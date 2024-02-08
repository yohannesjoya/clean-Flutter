import 'package:equatable/equatable.dart';
import 'package:tdd_clean/src/Records/Domain/entities/note.dart';

class Record extends Equatable{

  final String id;
  final String condition;
  final String bloodLevel;
  final List<Note> notes;
  final DateTime createdAt;

  const Record({required this.id, required this.condition, required this.bloodLevel, required this.notes, required this.createdAt});

  Record.empty() : this(id: 'empty.id', condition: "empty.condition", bloodLevel: "empty.bloodLevel", notes: const [Note.empty()], createdAt: DateTime.now());


  @override
  List<Object?> get props => [id, condition, bloodLevel, notes, createdAt];
}