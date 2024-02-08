

import 'dart:convert';
import 'package:tdd_clean/core/utils/typedefs.dart';
import 'package:tdd_clean/src/Records/Domain/entities/note.dart';


class NoteModel extends Note{
  const NoteModel({required super.id, required super.title, required super.note,});

  factory NoteModel.fromJson(String source) => NoteModel.fromMap(jsonDecode(source) as DataMap);
  NoteModel.empty() : this(id: 'empty.id', title: "empty.title", note: "empty.note");

  NoteModel copyWith({
    String? id, String? title,
    String? note, List<String>? notes,DateTime? createdAt,}) =>
      NoteModel(
        id: id ?? this.id, title: title ?? this.title,
        note: note ?? this.note,);


  NoteModel.fromMap(DataMap map) : this(
      id: map['id'] as String,
      title: map['title'] as String,
      note: map['note'] as String,
  );

  DataMap toMap() => {
    'id':id,
    'title':title,
    'note':note,
  };

  String toJson() => jsonEncode(toMap());

}