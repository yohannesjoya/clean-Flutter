part of 'sign_up_bloc.dart';

abstract class SignUpEvents extends Equatable {
  const SignUpEvents();
}
class SigningUpEvent extends SignUpEvents{

  final String email;
  final String password;
  final String confirmPassword;
  final String username;

  const SigningUpEvent({this.email="", this.password="", this.username="", this.confirmPassword=""});

  @override
  List<Object?> get props =>[email,password,username,confirmPassword];

}
