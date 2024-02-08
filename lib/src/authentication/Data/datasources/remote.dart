import 'dart:convert';
import 'package:tdd_clean/core/errors/exceptions.dart';
import 'package:tdd_clean/core/utils/constants.dart';
import 'package:tdd_clean/core/utils/typedefs.dart';
import 'package:tdd_clean/src/authentication/Data/Models/user_models.dart';
import 'package:http/http.dart' as http;

abstract class IAuthRemoteDataSource {

  Future<void> createUser({required String name, required String avatar, required String createdAt});
  Future<List<UserModel>> getAllUsers();

}

class AuthRemoteDataSource implements IAuthRemoteDataSource{

  final http.Client _httpClient;

  const AuthRemoteDataSource(this._httpClient);

  @override
  Future<void> createUser({required String name, required String avatar, required String createdAt}) async {


    try
    {
        final response = await _httpClient.post(
            Uri.https(baseUrl,kCreateUserEndPoint),
            body: jsonEncode({"name": name,"avatar": avatar,"createdAt": createdAt}));

        if (response.statusCode==400) {
          throw APIException(message: "BadRequest: failed to create a user", statusCode: response.statusCode);
        }

    }
    on APIException {
         rethrow;
    } catch(e){
        //application exception from the code
        throw APIException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<List<UserModel>> getAllUsers() async {

    try
    {
        final response = await _httpClient.get(Uri.https(baseUrl,kGetAllUsers));

        if (response.statusCode == 404){
         throw APIException(message: "404: users not found", statusCode: response.statusCode);
        }

      return List<DataMap>.from(jsonDecode(response.body) as List).map((userData) => UserModel.fromMap(userData)).toList();

    }
    on APIException {
        rethrow;
    }
    catch(e){
        throw APIException(message: e.toString(), statusCode: 505);
    }

  }

}
