//depend - nothing

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_clean/core/utils/typedefs.dart';
import 'package:tdd_clean/src/Records/Data/Models/note_model.dart';
import 'package:tdd_clean/src/Records/Data/Models/record_model.dart';


import '../../../../fixture/fixture_reader.dart';

void main(){

  final tRecordModel = RecordModel(id: "empty.id", condition: "empty.condition", bloodLevel: "empty.bloodLevel", notes: [NoteModel.empty()], createdAt: DateTime.parse("2024-01-02T12:34:56Z"));

  test('RecordModel must be a subclass of [Record] entity', () {
    expect(tRecordModel, isA<RecordModel>());
  });

  final tRecordJson = fixture('record.json').trim();
  final tRecordMap = jsonDecode(tRecordJson) as DataMap;

  group('fromMap', () {

    test('should return a [RecordModel] with correct data', () {

      final result = RecordModel.fromMap(tRecordMap);
      expect(result, equals(tRecordModel));
    });

  });

  group('fromJson', () {

    test('should return a [RecordModel] with correct data', () {

      final result = RecordModel.fromJson(tRecordJson);
      expect(result, equals(tRecordModel));
    });
  });

  group('toMap', () {
    test('should return a [RecordModelMap] with correct data', () {

      final result = tRecordModel.toMap();
      final formattedDateTime = tRecordModel.createdAt.toUtc().toIso8601String();
      final expectedMap = {
        'id': 'empty.id',
        'condition': 'empty.condition',
        'bloodLevel': 'empty.bloodLevel',
        'notes': [NoteModel.empty().toMap()],
        'createdAt': formattedDateTime,
      };
      expect(result, equals(expectedMap));
    });
  });

  group('toJson', () {
    test('should return a [RecordModelJson] with correct data', () {
      final result = tRecordModel.toJson();
      expect(result, equals(tRecordJson.trim()));
    });
  });



  group('copyWith', () {
    test('should return a [RecordModel] with correct [condition] changes', () {
      final result = tRecordModel.copyWith(condition: "test_condition");
      expect(result.condition, equals("test_condition"));
    });

    test('should return a [RecordModel] with correct [bloodLevel] changes', () {
      final result = tRecordModel.copyWith(bloodLevel: "test_bloodLevel");
      expect(result.bloodLevel, equals("test_bloodLevel"));
    });

    test('should return a [RecordModel] with correct [createdAt] changes', () {
      final now = DateTime.now();
      final result = tRecordModel.copyWith(createdAt:now);
      expect(result.createdAt, equals(now));
    });

    test('should return a [RecordModel] with correct [id] changes', () {
      final result = tRecordModel.copyWith(id: "test_id");
      expect(result.id, equals("test_id"));
    });
  });

}
