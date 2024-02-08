

import 'package:tdd_clean/core/utils/typedefs.dart';
import 'package:tdd_clean/src/Records/Domain/entities/note.dart';

abstract class IRecordRepository{

  const IRecordRepository();

  // register new record
  ResultVoid addRecord({ required String condition, required String bloodLevel, required List<Note> notes, required DateTime createdAt});


}