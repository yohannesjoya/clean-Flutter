part of 'sign_In_bloc.dart';

abstract class SignInStates extends Equatable {
  const SignInStates();
  @override
  List<Object> get props => [];
}


class SignInState extends SignInStates{}

class SignInProcess extends SignInStates{}
class SigningInSuccess extends SignInStates{}


class SignInError extends SignInStates{

  final String message;

  const SignInError(this.message);

  @override
  List<String> get props =>[message];
}



// class CreatingUser extends AuthState{
//   const CreatingUser();
// }
//
// class GettingUser extends AuthState{
//   const GettingUser();
// }
//
//
// class UserCreated extends AuthState{
//   const UserCreated();
// }
//
// class UsersLoaded extends AuthState{
//
//   final List<User> users;
//
//   const UsersLoaded(this.users);
//
//   @override
//   List<Object> get props => users.map((user) => user.id).toList();
// }
