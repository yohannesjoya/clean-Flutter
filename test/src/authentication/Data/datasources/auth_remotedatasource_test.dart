


import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:tdd_clean/core/errors/exceptions.dart';
import 'package:tdd_clean/core/utils/constants.dart';
import 'package:tdd_clean/src/authentication/Data/Models/user_models.dart';
import 'package:tdd_clean/src/authentication/Data/datasources/remote.dart';

class MockClient extends Mock implements http.Client{}


void main(){


  late http.Client httpClient;
  late IAuthRemoteDataSource authRemoteDataSource;

  setUp((){
    httpClient = MockClient();
    authRemoteDataSource = AuthRemoteDataSource(httpClient);
    registerFallbackValue(Uri());
  });


  group("createUser", () {

    test('should complete successfully when status code is [correct]', () async {
      
      when(()=> httpClient.post(any(), body: any(named: "body")))
          .thenAnswer((invocation) async => http.Response("user created successfully",201));

      final methodCall =  authRemoteDataSource.createUser;

      expect( methodCall(
          name: "test_user", avatar: "test_avatar",
          createdAt: "test_createdAt"), completes);

      verify(() =>
          httpClient.post(
              Uri.https(baseUrl,kCreateUserEndPoint),
              body: jsonEncode({"name": "test_user","avatar": "test_avatar","createdAt": "test_createdAt"})))
          .called(1);

      verifyNoMoreInteractions(httpClient);

    });

    test('should throw [APIException] when status code is [not Correct]', () async {

      when(()=> httpClient.post(any(), body: any(named: "body")))
          .thenAnswer((invocation) async => http.Response("BadRequest: failed to create a user",400));

      final methodCall =  authRemoteDataSource.createUser;


      expect(() async => methodCall(
            name: "test_user", avatar: "test_avatar",
            createdAt: "test_createdAt"),
          throwsA(const APIException(message: "BadRequest: failed to create a user" , statusCode: 400)));

      verify(() =>
          httpClient.post(
              Uri.https(baseUrl,kCreateUserEndPoint),
              body: jsonEncode({"name": "test_user","avatar": "test_avatar","createdAt": "test_createdAt"})))
          .called(1);

      verifyNoMoreInteractions(httpClient);

    });
  });




  final tUsers = [const UserModel.empty()];

  group("getAllUsers", () {

    test('should complete successfully when status code is [correct]', () async {

      when(()=> httpClient.get(any()))
          .thenAnswer((invocation) async => http.Response(jsonEncode([tUsers.first.toMap()]),
          200));

      final result =  await authRemoteDataSource.getAllUsers();

      expect(result, equals(tUsers));

      verify(() =>
          httpClient.get(Uri.https(baseUrl,kGetAllUsers))).called(1);

      verifyNoMoreInteractions(httpClient);

    });

    test('should throw [APIException] when status code is [not Correct]', () async {

      when(()=> httpClient.get(any()))
          .thenAnswer((invocation) async => http.Response("404: users not found",404));

      final methodCall =  authRemoteDataSource.getAllUsers;


      expect(() async => methodCall(),
          throwsA(const APIException(message: "404: users not found" , statusCode: 404)));

      verify(() =>
          httpClient.get(
              Uri.https(baseUrl,kGetAllUsers))).called(1);

      verifyNoMoreInteractions(httpClient);

    });
  });


}