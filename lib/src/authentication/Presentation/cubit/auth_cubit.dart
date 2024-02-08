import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd_clean/src/authentication/Domain/entities/user.dart';
import 'package:tdd_clean/src/authentication/Domain/usecases/create_user.dart';
import 'package:tdd_clean/src/authentication/Domain/usecases/get_all_users.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required CreateUser createUserUC, required GetAllUsers getAllUsersUC}) :
        _createUserUC= createUserUC, _getAllUsersUC = getAllUsersUC ,super(AuthInitial());

  final CreateUser _createUserUC;
  final GetAllUsers _getAllUsersUC;

  Future<void> createUserHandler({required String name, required String avatar, required String createdAt }) async {
    emit(const CreatingUser());

    final result = await _createUserUC(
        CreateUserParams(name: name, avatar: avatar, createdAt: createdAt));

    result.fold((failure) => emit(AuthError(failure.errorMessage)), (success) => emit(const UserCreated()));

  }

  Future<void> getAllUsersHandler() async {

    emit(const GettingUser());

    final result =  await _getAllUsersUC();

    result.fold((failure) => emit(AuthError(failure.errorMessage)), (users) => emit(UsersLoaded(users)));

  }


}
