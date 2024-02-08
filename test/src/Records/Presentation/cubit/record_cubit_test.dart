import 'dart:ffi';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean/core/errors/failure.dart';
import 'package:tdd_clean/src/Records/Domain/usecases/add_record.dart';
import 'package:tdd_clean/src/Records/Presentation/cubit/record_cubit.dart';

class MockAddRecordUC extends Mock implements AddRecord{}


void main(){


  late AddRecord addRecordUC;
  late RecordCubit recordCubit;


  final tAddRecordParams = AddRecordParams.empty();
  final tApiFailure = APIFailure(message: "message", statusCode: 400);

  setUp(() {
    addRecordUC = MockAddRecordUC();
    recordCubit = RecordCubit(addRecordUC: addRecordUC);
    registerFallbackValue(tAddRecordParams);
  });

  tearDown(() => recordCubit.close());


  test("should initial state be [RecordInitial]", () async => {
    expect(recordCubit.state, equals(RecordInitial()))
  });


  group("addRecord", () {

    blocTest<RecordCubit, RecordState>("should emit [AddingRecord, RecordAdded] when Successful",
        build: (){
          when(()=> addRecordUC(any()))
              .thenAnswer((invocation) async => const Right(null));
            return recordCubit;
        },
        act: (cubit) => cubit.addRecordHandler(
            condition: tAddRecordParams.condition, bloodLevel: tAddRecordParams.bloodLevel,
            notes: tAddRecordParams.notes, createdAt: tAddRecordParams.createdAt),
        expect: () => [AddingRecord(), RecordAdded()],
        verify: (_){
            verify(()=> addRecordUC(tAddRecordParams)).called(1);
            verifyNoMoreInteractions(addRecordUC);

        }
    );

    blocTest<RecordCubit, RecordState>("should emit [AddingRecord, RecordError] when failure occurs",
        build: (){
          when(()=> addRecordUC(any()))
              .thenAnswer((invocation) async => Left(tApiFailure));
          return recordCubit;
        },
        act: (cubit) => cubit.addRecordHandler(
            condition: tAddRecordParams.condition, bloodLevel: tAddRecordParams.bloodLevel,
            notes: tAddRecordParams.notes, createdAt: tAddRecordParams.createdAt),
        expect: () => [AddingRecord(), RecordError(tApiFailure.errorMessage)],
        verify: (_){
          verify(()=> addRecordUC(tAddRecordParams)).called(1);
          verifyNoMoreInteractions(addRecordUC);

        }
    );


  });

}