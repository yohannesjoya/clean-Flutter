
import 'package:equatable/equatable.dart';

class Note extends Equatable{

  final String id;
  final String title;
  final String note;


  const Note({required this.id, required this.title,required this.note});

  const Note.empty() : this(id: "empty.id",title: "empty.title",note: "empty.note");


  @override
  List<Object?> get props => [id,note];
}