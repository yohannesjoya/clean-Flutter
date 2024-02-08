

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean/core/errors/failure.dart';
import 'package:tdd_clean/src/authentication/Domain/entities/user.dart';
import 'package:tdd_clean/src/authentication/Domain/usecases/create_user.dart';
import 'package:tdd_clean/src/authentication/Domain/usecases/get_all_users.dart';
import 'package:tdd_clean/src/authentication/Presentation/cubit/auth_cubit.dart';

class MockCreateUserUC extends Mock implements CreateUser{}
class MockGetAllUsersUC extends Mock implements GetAllUsers{}

void main(){
  
  late CreateUser createUserUC;
  late GetAllUsers getAllUsersUC;
  late AuthCubit authCubit;


  const tCreateUserParams = CreateUserParams.empty();
  const tUsersList = [User.empty(),User.empty()];
  final tApiFailure = const APIFailure(message: "message", statusCode: 400);

  setUp(() {
    
    createUserUC = MockCreateUserUC();
    getAllUsersUC = MockGetAllUsersUC();
    authCubit = AuthCubit(createUserUC: createUserUC, getAllUsersUC: getAllUsersUC);
    registerFallbackValue(tCreateUserParams);
  });
  
  tearDown(() => authCubit.close());

  
  
  
  test("should initial state be [AuthInitial]", () async {
    
    expect(authCubit.state, equals(AuthInitial()));

  });


  group("createUser", () {

    blocTest<AuthCubit,AuthState>("should emit [CreatingUser, UserCreated] when successful",
        build: (){
            when(()=> createUserUC(any()))
                .thenAnswer((invocation) async => const Right(null));
            return authCubit;
        },

        act: (cubit) =>
             cubit.createUserHandler(
                name: tCreateUserParams.name, avatar: tCreateUserParams.avatar,
                createdAt: tCreateUserParams.createdAt),
        expect: ()=> const [CreatingUser(), UserCreated()],
        verify: (_){
              verify(()=>createUserUC(tCreateUserParams)).called(1) ;
              verifyNoMoreInteractions(createUserUC);
        }

    );

    blocTest<AuthCubit,AuthState>("should emit [CreatingUser, AuthError] when failure occurs",
        build: (){
          when(()=> createUserUC(any()))
              .thenAnswer((invocation) async => Left(tApiFailure));
          return authCubit;
        },

        act: (cubit) =>
            cubit.createUserHandler(
                name: tCreateUserParams.name, avatar: tCreateUserParams.avatar,
                createdAt: tCreateUserParams.createdAt),
        expect: ()=> [const CreatingUser(), AuthError(tApiFailure.errorMessage)],
        verify: (_){
          verify(()=>createUserUC(tCreateUserParams)).called(1) ;
          verifyNoMoreInteractions(createUserUC);
        }

    );


  });






  group("getAllUsers", () {

    blocTest<AuthCubit,AuthState>("should emit [GettingUser, UsersLoaded] when successful",
        build: (){
          when(()=> getAllUsersUC())
              .thenAnswer((invocation) async => const Right(tUsersList));
          return authCubit;
        },

        act: (cubit) =>
            cubit.getAllUsersHandler(),
        expect: ()=> const [GettingUser(), UsersLoaded(tUsersList)],
        verify: (_){
          verify(()=>getAllUsersUC()).called(1) ;
          verifyNoMoreInteractions(getAllUsersUC);
        }

    );

    blocTest<AuthCubit,AuthState>("should emit [GettingUser, AuthError] when failure occurs",
        build: (){
          when(()=> getAllUsersUC())
              .thenAnswer((invocation) async => Left(tApiFailure));
          return authCubit;
        },

        act: (cubit) =>
            cubit.getAllUsersHandler(),
        expect: ()=> [const GettingUser(), AuthError(tApiFailure.errorMessage)],
        verify: (_){
          verify(()=>getAllUsersUC()).called(1) ;
          verifyNoMoreInteractions(getAllUsersUC);
        }

    );


  });
  
  
  
}
