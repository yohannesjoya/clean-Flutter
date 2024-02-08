//depend on


import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean/core/errors/exceptions.dart';
import 'package:tdd_clean/core/errors/failure.dart';
import 'package:tdd_clean/src/Records/Data/DataSource/remote.dart';
import 'package:tdd_clean/src/Records/Data/Models/note_model.dart';
import 'package:tdd_clean/src/Records/Data/repository/record_repository.dart';
import 'package:tdd_clean/src/Records/Domain/contracts/IRecord_repository.dart';

class MockRecordRemoteDataSource extends Mock implements IRecordRemoteDataSource {}

void main(){

  late IRecordRemoteDataSource recordRemoteDataSource;
  late IRecordRepository recordRepository;

  setUp((){

    recordRemoteDataSource = MockRecordRemoteDataSource();
    recordRepository = RecordRepository(recordRemoteDataSource);

  });


  final tApiException = APIException(message: "unknown Error occurred", statusCode: 500);
  final tApiFailure = APIFailure(message: tApiException.message, statusCode: tApiException.statusCode);
  final now = DateTime.now();
  final tNotes = [NoteModel.empty()];

  group('AddRecord', () {

    test('should call [IRecordRemoteDataSource.AddRecord] and complete', () async {
      //arrange
      when(
              () => recordRemoteDataSource.addRecord(condition: any(named: "condition"), bloodLevel: any(named: "bloodLevel"), notes: any(named: "notes"),createdAt: any(named: "createdAt")) )
          .thenAnswer((invocation) async => Future.value());
      //act
      final result = await recordRepository.addRecord(condition: "test_condition", bloodLevel: "test_bloodLevel",notes: tNotes , createdAt: now );
      //assert
      expect(result, equals(const Right(null)));
      verify(()=> recordRemoteDataSource.addRecord(condition: "test_condition", bloodLevel: "test_bloodLevel",notes: tNotes , createdAt: now )).called(1);
      verifyNoMoreInteractions(recordRemoteDataSource);

    });


    test('should return [Server Failure] when the call to remote source is unsuccessful',() async {

      // arrange
      when(  () => recordRemoteDataSource.addRecord(condition: any(named: "condition"), bloodLevel: any(named: "bloodLevel"), notes: any(named: "notes"),createdAt: any(named: "createdAt")) )
          .thenThrow(tApiException);

      final result = await recordRepository.addRecord(condition: "test_condition", bloodLevel: "test_bloodLevel",notes: tNotes, createdAt: now );

      expect(result,equals(Left( tApiFailure)));
      verify(()=> recordRemoteDataSource.addRecord(condition: "test_condition", bloodLevel: "test_bloodLevel",notes: tNotes, createdAt: now )).called(1);
      verifyNoMoreInteractions(recordRemoteDataSource);

    });

  });




}