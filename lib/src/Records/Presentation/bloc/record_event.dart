part of 'record_bloc.dart';

abstract class RecordEvent extends Equatable {
  const RecordEvent();

  @override
  List<Object?> get props => [];
}


class AddRecordEvent extends RecordEvent{

  final String condition;
  final String bloodLevel;
  final List<Note> notes;
  final DateTime createdAt;

  const AddRecordEvent({ required this.condition, required this.bloodLevel, required this.notes, required this.createdAt});

  @override
  List<Object?> get props => [condition, bloodLevel, notes, createdAt];
}

