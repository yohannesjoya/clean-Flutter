import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd_clean/src/Records/Domain/entities/note.dart';
import 'package:tdd_clean/src/Records/Domain/usecases/add_record.dart';

part 'record_event.dart';
part 'record_state.dart';

class RecordBloc extends Bloc<RecordEvent, RecordState> {
  RecordBloc({required AddRecord addRecordUC}) :
        _addRecordUC = addRecordUC,  super(RecordInitial()) {
      on<AddRecordEvent>(_addRecordHandler);
  }


  final AddRecord _addRecordUC;
  Future<void> _addRecordHandler(AddRecordEvent event, Emitter<RecordState> emit) async {

    emit(AddingRecord());

    final result = await _addRecordUC(AddRecordParams(condition: event.condition, bloodLevel: event.bloodLevel, notes: event.notes, createdAt: event.createdAt));

    result.fold((failure) => emit(RecordError(failure.errorMessage)), (_) => emit(RecordAdded()));

  }
}
