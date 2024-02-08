//depend - nothing

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_clean/core/utils/typedefs.dart';
import 'package:tdd_clean/src/Records/Data/Models/note_model.dart';
import 'package:tdd_clean/src/Records/Domain/entities/note.dart';


import '../../../../fixture/fixture_reader.dart';

void main(){

  final tNoteModel = const NoteModel(id: "empty.id", title: "empty.title", note: "empty.note",);

  test('NoteModel must be a subclass of [Note] entity', () {
    expect(tNoteModel, isA<Note>());
  });

  final tNoteJson = fixture('note.json');
  final tNoteMap = jsonDecode(tNoteJson) as DataMap;

  group('fromMap', () {

    test('should return a [NoteModel] with correct data', () {

      final result = NoteModel.fromMap(tNoteMap);
      expect(result, equals(tNoteModel));
    });

  });

  group('fromJson', () {

    test('should return a [NoteModel] with correct data', () {

      final result = NoteModel.fromJson(tNoteJson);
      expect(result, equals(tNoteModel));
    });
  });

  group('toMap', () {
    test('should return a [NoteModelMap] with correct data', () {

      final result = tNoteModel.toMap();
      expect(result, equals(tNoteMap));
    });
  });

  group('toJson', () {
    test('should return a [NoteModelJson] with correct data', () {
      final result = tNoteModel.toJson();
      expect(result, equals(tNoteJson.trim()));
    });
  });

  group('copyWith', () {
    test('should return a [NoteModel] with correct [title] changes', () {
      final result = tNoteModel.copyWith(title: "test_title");
      expect(result.title, equals("test_title"));
    });

    test('should return a [NoteModel] with correct [note] changes', () {
      final result = tNoteModel.copyWith(note: "test_note");
      expect(result.note, equals("test_note"));
    });

    test('should return a [NoteModel] with correct [id] changes', () {
      final result = tNoteModel.copyWith(id: "test_id");
      expect(result.id, equals("test_id"));
    });
  });

}
