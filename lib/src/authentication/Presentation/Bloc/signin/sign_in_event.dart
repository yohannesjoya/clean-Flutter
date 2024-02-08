
part of 'sign_In_bloc.dart';

abstract class SignInEvents extends Equatable {
  const SignInEvents();

  @override
  List<Object?> get props =>[];

}

class EmailChangeEvent extends SignInEvents{
  final String email;
  const EmailChangeEvent({required this.email});
}


class PasswordChangeEvent extends SignInEvents{
  final String password;
  const PasswordChangeEvent({required this.password});
}



class SigningInEvent extends SignInEvents{

  final String email;
  final String password;

  const SigningInEvent({this.email="", this.password=""});

  @override
  List<Object?> get props =>[email,password];

}




// class CreateUserEvent extends AuthEvent{
//
//   final String name;
//   final String avatar;
//   final String createdAt;
//
//   const CreateUserEvent({required this.name,required this.avatar, required this.createdAt});
//
//   @override
//   List<Object?> get props =>[name, avatar, createdAt];
//
// }
//
// class GetAllUsersEvent extends AuthEvent{
//   const GetAllUsersEvent();
// }
