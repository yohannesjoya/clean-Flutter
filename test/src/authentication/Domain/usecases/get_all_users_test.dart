import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean/src/authentication/Domain/contracts/IAuth_repository.dart';
import 'package:tdd_clean/src/authentication/Domain/entities/user.dart';
import 'package:tdd_clean/src/authentication/Domain/usecases/get_all_users.dart';

import 'auth_repository.mock.dart';


void main(){

  late GetAllUsers usecase;
  late IAuthRepository authRepository;

  setUp(() {
    authRepository = MockAuthRepository();
    usecase = GetAllUsers(authRepository);
  });

  const usersList = [User.empty(),User.empty()];
  test("should call [IAuthRepository.getAllUsers]", () async {

    // arrange
    when(
        () =>  authRepository.getAllUsers()
    ).thenAnswer((invocation) async => const Right(usersList));
    //act
    final result  = await usecase();

    //assert
    expect(result, equals(const Right<dynamic,List<User>>(usersList)));
    verify(()=> authRepository.getAllUsers()).called(1);
    verifyNoMoreInteractions(authRepository);

  });

}