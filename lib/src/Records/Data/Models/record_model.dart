

import 'dart:convert';
import 'package:tdd_clean/core/utils/typedefs.dart';
import 'package:tdd_clean/src/Records/Data/Models/note_model.dart';
import 'package:tdd_clean/src/Records/Domain/entities/Record.dart';
import 'package:tdd_clean/src/Records/Domain/entities/note.dart';

class RecordModel extends Record{
  const RecordModel({required super.id, required super.condition, required super.bloodLevel, required super.notes, required super.createdAt});

  factory RecordModel.fromJson(String source) => RecordModel.fromMap(jsonDecode(source) as DataMap);
  RecordModel.empty() : this(id: 'empty.id', condition: "empty.condition", bloodLevel: "empty.bloodLevel" , notes: const [Note.empty()], createdAt: DateTime.now());

  RecordModel copyWith({
    String? id, String? condition,
    String? bloodLevel, List<Note>? notes,DateTime? createdAt,}) =>
      RecordModel(
        id: id ?? this.id, condition: condition ?? this.condition,
        bloodLevel: bloodLevel ?? this.bloodLevel,notes: notes ?? this.notes, createdAt: createdAt ?? this.createdAt,);


  RecordModel.fromMap(DataMap map) : this(
      id: map['id'] as String,
      condition: map['condition'] as String,
      bloodLevel: map['bloodLevel'] as String,
      notes: (map['notes'] as List<dynamic>).map((element) =>  NoteModel.fromMap(element)).toList(),
      createdAt: DateTime.parse(map['createdAt'] as String)
  );

  DataMap toMap() => {
    'id':id,
    'condition':condition,
    'bloodLevel':bloodLevel,
    'notes':notes.map((e) => (e as NoteModel).toMap() ).toList(),
    'createdAt': createdAt.toUtc().toIso8601String(),
  };

  String toJson() => jsonEncode(toMap());

}