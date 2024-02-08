import 'package:dartz/dartz.dart';
import 'package:tdd_clean/core/errors/exceptions.dart';
import 'package:tdd_clean/core/errors/failure.dart';
import 'package:tdd_clean/core/utils/typedefs.dart';
import 'package:tdd_clean/src/Records/Data/DataSource/remote.dart';
import 'package:tdd_clean/src/Records/Data/Models/note_model.dart';
import 'package:tdd_clean/src/Records/Domain/contracts/IRecord_repository.dart';
import 'package:tdd_clean/src/Records/Domain/entities/note.dart';

class RecordRepository implements IRecordRepository{

  final IRecordRemoteDataSource _dataSource;

  const RecordRepository(this._dataSource);


  @override
  ResultVoid addRecord({required String condition, required String bloodLevel, required List<Note> notes, required DateTime createdAt}) async {
    try{
      await _dataSource.addRecord(condition: condition, bloodLevel: bloodLevel,notes: notes.map((e) => e as NoteModel).toList(), createdAt: createdAt );
      return const Right(null);
    } on APIException catch(e){
      return Left(APIFailure.fromException(e));
    }
  }

}
