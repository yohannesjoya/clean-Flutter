

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:tdd_clean/core/errors/exceptions.dart';
import 'package:tdd_clean/core/utils/constants.dart';
import 'package:tdd_clean/src/Records/Data/Models/note_model.dart';

abstract class IRecordRemoteDataSource {
  Future<void> addRecord({required String condition, required String bloodLevel, required List<NoteModel> notes, required DateTime createdAt});
}

class RecordRemoteDataSource implements IRecordRemoteDataSource{

  final http.Client _httpClient;

  const RecordRemoteDataSource(this._httpClient);

  @override
  Future<void> addRecord({required String condition, required String bloodLevel, required List<NoteModel> notes, required DateTime createdAt}) async {
  try
      {

        final response = await _httpClient.post(
            Uri.https(baseUrl,kAddRecordEndPoint),
            body: jsonEncode({"condition": condition,"bloodLevel": bloodLevel, "notes":notes, "createdAt": createdAt.toUtc().toIso8601String()})
        );

        if (response.statusCode==400) {
          throw APIException(message: "BadRequest: failed to add a record", statusCode: response.statusCode);
        }

      }

      on APIException {
        rethrow;
      } catch(e){
        //application exception from the code
        throw APIException(message: e.toString(), statusCode: 505);
      }
  }

}