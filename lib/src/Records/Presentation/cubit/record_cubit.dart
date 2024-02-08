import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd_clean/src/Records/Domain/entities/note.dart';
import 'package:tdd_clean/src/Records/Domain/usecases/add_record.dart';

part 'record_state.dart';

class RecordCubit extends Cubit<RecordState> {
  RecordCubit({required AddRecord addRecordUC}) : 
        _addRecordUC = addRecordUC, super(RecordInitial());




  final AddRecord _addRecordUC;
  Future<void> addRecordHandler({
    required String condition, required String bloodLevel, required List<Note> notes, required DateTime createdAt
}) async {

    emit(AddingRecord());

    final result = await _addRecordUC(AddRecordParams(condition: condition, bloodLevel: bloodLevel, notes: notes, createdAt: createdAt));

    result.fold((failure) => emit(RecordError(failure.errorMessage)), (_) => emit(RecordAdded()));

  }
}
