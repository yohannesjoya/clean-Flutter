part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
}
class CreatingUser extends AuthState{
  const CreatingUser();
}

class GettingUser extends AuthState{
  const GettingUser();
}


class UserCreated extends AuthState{
  const UserCreated();
}

class UsersLoaded extends AuthState{

  final List<User> users;

  const UsersLoaded(this.users);

  @override
  List<Object> get props => users.map((user) => user.id).toList();
}


class AuthError extends AuthState{

  final String message;

  const AuthError(this.message);

  @override
  List<String> get props =>[message];
}