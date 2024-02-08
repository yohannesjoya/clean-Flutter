//what are its dependencies
// create a fake version of them
// control the fakes

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean/src/authentication/Domain/contracts/IAuth_repository.dart';

import 'package:tdd_clean/src/authentication/Domain/usecases/create_user.dart';

import 'auth_repository.mock.dart';



void main(){

  late CreateUser usecase;
  late IAuthRepository authRepository;

  setUp(() {
    authRepository = MockAuthRepository();
    usecase  = CreateUser(authRepository);
  });

  const params = CreateUserParams.empty();

  test("should call [AuthRepository.createUser]", () async {

    //arrange
    when(
          () => authRepository
                .createUser(name: any(named: "name"), avatar: any(named: "avatar"), createdAt: any(named: "createdAt")),
    ).thenAnswer((invocation) async => const Right(null));

    //act
    final result = await usecase(params);

    //assert
    expect(result, equals(const Right<dynamic,void>(null)));
    verify(()=> authRepository.createUser(name: params.name, avatar: params.avatar, createdAt: params.createdAt)).called(1);
    verifyNoMoreInteractions(authRepository);
  });

}






