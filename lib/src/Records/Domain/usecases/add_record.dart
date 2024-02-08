


import 'package:equatable/equatable.dart';
import 'package:tdd_clean/core/usecases/usecase.dart';
import 'package:tdd_clean/core/utils/typedefs.dart';
import 'package:tdd_clean/src/Records/Domain/contracts/IRecord_repository.dart';
import 'package:tdd_clean/src/Records/Domain/entities/note.dart';

class AddRecord extends UseCaseWithPrams<void, AddRecordParams> {

  final IRecordRepository _recordRepository;
  const AddRecord(this._recordRepository);

  @override
  ResultVoid call(AddRecordParams params)
  async => _recordRepository.addRecord(condition: params.condition, bloodLevel: params.bloodLevel, notes: params.notes, createdAt: params.createdAt);

}

class AddRecordParams extends Equatable{

  final String condition;
  final String bloodLevel;
  final List<Note> notes;
  final DateTime createdAt;

  const AddRecordParams({ required this.condition, required this.bloodLevel, required this.notes, required this.createdAt});

  AddRecordParams.empty() : this( condition: "empty.condition", bloodLevel: "empty.bloodLevel", notes: [const Note.empty()], createdAt: DateTime.now());

  @override
  List<Object?> get props => [ condition, bloodLevel, notes, createdAt];
}
