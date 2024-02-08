//depend on record repository


import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean/src/Records/Domain/contracts/IRecord_repository.dart';
import 'package:tdd_clean/src/Records/Domain/usecases/add_record.dart';

import 'record_repository.mock.dart';



void main(){

  late IRecordRepository recordRepository;
  late AddRecord usecase;

  setUp((){
    recordRepository = MockRecordRepository();
    usecase = AddRecord(recordRepository);
  });



  final params = AddRecordParams.empty();
  test("should call [RecordRepository.addRecord]", () async {

    when(() => recordRepository.addRecord(condition: any(named: "condition"), bloodLevel: any(named: "bloodLevel"), notes: any(named: "notes"), createdAt: any(named: "createdAt"))
    ).thenAnswer((invocation) async => const Right(null));

    final result = await usecase(params);

    expect(result, equals(const Right<dynamic,void>(null)));
    verify(() => recordRepository.addRecord(condition: params.condition, bloodLevel: params.bloodLevel, notes: params.notes, createdAt: params.createdAt)
    ).called(1);
    verifyNoMoreInteractions(recordRepository);

  });


}