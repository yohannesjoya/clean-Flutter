part of 'record_cubit.dart';

abstract class RecordState extends Equatable {
  const RecordState();
  @override
  List<Object> get props => [];
}

class RecordInitial extends RecordState {}


class AddingRecord extends RecordState {}

class RecordAdded extends RecordState {}

class RecordError extends RecordState {

  final String message;
  const RecordError(this.message);

  @override
  List<String> get props => [message];
}