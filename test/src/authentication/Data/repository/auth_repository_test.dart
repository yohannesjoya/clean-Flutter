//depend on IAuthRemoteDataSource

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean/core/errors/exceptions.dart';
import 'package:tdd_clean/core/errors/failure.dart';
import 'package:tdd_clean/src/authentication/Data/Models/user_models.dart';
import 'package:tdd_clean/src/authentication/Data/datasources/remote.dart';
import 'package:tdd_clean/src/authentication/Data/repository/auth_repository.dart';
import 'package:tdd_clean/src/authentication/Domain/contracts/IAuth_repository.dart';
import 'package:tdd_clean/src/authentication/Domain/entities/user.dart';

class MockAuthRemoteDataSource extends Mock implements IAuthRemoteDataSource{}

void main(){

  late IAuthRemoteDataSource authRemoteDataSource;
  late IAuthRepository authRepository;

  setUp(() {
    authRemoteDataSource = MockAuthRemoteDataSource();
    authRepository = AuthRepository(authRemoteDataSource);
  });

  final tApiException = APIException(message: "unknown Error occurred", statusCode: 500);
  final tApiFailure = APIFailure(message: tApiException.message, statusCode: tApiException.statusCode);

  group('createUser', () { 
    
    test('should call [IAuthRemoteDataSource.createUser] and complete', () async {
      //arrange
      when(
              () => authRemoteDataSource.createUser(name: any(named: "name"), avatar: any(named: "avatar"), createdAt: any(named: "createdAt")) )
          .thenAnswer((invocation) async => Future.value());
      //act
      final result = await authRepository.createUser(name: "test_user", avatar: "test_avatar", createdAt: "test_createdAt");
      //assert
      expect(result, equals(const Right(null)));
      verify(()=> authRemoteDataSource.createUser(name: "test_user", avatar: "test_avatar", createdAt: "test_createdAt")).called(1);
      verifyNoMoreInteractions(authRemoteDataSource);

    });


    test('should return [Server Failure] when the call to remote source is unsuccessful',() async {

      // arrange
      when( ()=>authRemoteDataSource.createUser(name: any(named: "name"), avatar: any(named: "avatar"), createdAt: any(named: "createdAt")))
          .thenThrow(tApiException);

      final result = await authRepository.createUser(name: "test_user", avatar: "test_avatar", createdAt: "test_createdAt");

      expect(result,equals(Left( tApiFailure)));
      verify(()=> authRemoteDataSource.createUser(name: "test_user", avatar: "test_avatar", createdAt: "test_createdAt")).called(1);
      verifyNoMoreInteractions(authRemoteDataSource);

    });
    
  });

  group("getAllUsers", () {

    test("should call [IAuthRemoteDataSource.getAllUsers],"
        "should return a [List of User]", () async {

      // arrange
      when(()=> authRemoteDataSource.getAllUsers()).thenAnswer((invocation) async => []);

      final result = await authRepository.getAllUsers();

      expect(result, isA<Right<dynamic, List<User>>>());
      verify(()=> authRemoteDataSource.getAllUsers()).called(1);
      verifyNoMoreInteractions(authRemoteDataSource);

    });

    test('should return [Server Failure] when the call to remote source is unsuccessful',() async {

      // arrange
      when( ()=>authRemoteDataSource.getAllUsers())
          .thenThrow(tApiException);

      final result = await authRepository.getAllUsers();

      expect(result,equals(Left(tApiFailure)));
      verify(()=> authRemoteDataSource.getAllUsers()).called(1);
      verifyNoMoreInteractions(authRemoteDataSource);

    });



  });






}