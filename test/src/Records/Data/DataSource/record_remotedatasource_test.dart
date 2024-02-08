


import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:tdd_clean/core/errors/exceptions.dart';
import 'package:tdd_clean/core/utils/constants.dart';
import 'package:tdd_clean/src/Records/Data/DataSource/remote.dart';
import 'package:tdd_clean/src/Records/Data/Models/note_model.dart';


class MockClient extends Mock implements http.Client{}


void main(){


  late http.Client httpClient;
  late IRecordRemoteDataSource recordRemoteDataSource;

  setUp((){
    httpClient = MockClient();
    recordRemoteDataSource = RecordRemoteDataSource(httpClient);
    registerFallbackValue(Uri());
  });

  final now = DateTime.now();
  final tNotes = [NoteModel.empty()];

  group("AddRecord", () {

    test('should complete successfully when status code is [correct]', () async {

      when(()=> httpClient.post(any(), body: any(named: "body")))
          .thenAnswer((invocation) async => http.Response("record added successfully",201));

      final methodCall =  recordRemoteDataSource.addRecord;

      expect( methodCall(
          condition: "test_condition", bloodLevel: "test_bloodLevel", notes: tNotes,
          createdAt: now), completes);

      verify(() =>
          httpClient.post(
              Uri.https(baseUrl,kAddRecordEndPoint),
              body: jsonEncode({"condition": "test_condition","bloodLevel": "test_bloodLevel", "notes": tNotes, "createdAt":now.toUtc().toIso8601String() })))
          .called(1);

      verifyNoMoreInteractions(httpClient);

    });

    test('should throw [APIException] when status code is [not Correct]', () async {

      when(()=> httpClient.post(any(), body: any(named: "body")))
          .thenAnswer((invocation) async => http.Response("BadRequest: failed to add a record",400));

      final methodCall =  recordRemoteDataSource.addRecord;


      expect(() async => methodCall(
          condition: "test_condition", bloodLevel: "test_bloodLevel", notes: tNotes,
          createdAt: now),
          throwsA(const APIException(message: "BadRequest: failed to add a record" , statusCode: 400)));

      verify(() =>
          httpClient.post(
              Uri.https(baseUrl,kAddRecordEndPoint),
              body: jsonEncode({"condition": "test_condition","bloodLevel": "test_bloodLevel", "notes": tNotes, "createdAt":now.toUtc().toIso8601String() })))
          .called(1);

      verifyNoMoreInteractions(httpClient);

    });
  });

}