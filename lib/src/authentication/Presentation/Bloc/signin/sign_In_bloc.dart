
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tdd_clean/core/utils/toast.dart';
import 'package:tdd_clean/src/authentication/Domain/usecases/create_user.dart';
import 'package:tdd_clean/src/authentication/Domain/usecases/get_all_users.dart';



part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvents, SignInStates> {
  SignInBloc({required CreateUser createUserUC, required GetAllUsers getAllUsersUC }) :
        _createUserUC = createUserUC, _getAllUsersUC = getAllUsersUC, super(SignInState())
  {
    on<EmailChangeEvent>(_emailChangeHandler);
    on<PasswordChangeEvent>(_passwordChangeHandler);
    on<SigningInEvent>(_signInHandler);
  }

  final CreateUser _createUserUC;
  final GetAllUsers _getAllUsersUC;


  void _signInHandler(SigningInEvent event, Emitter<SignInStates> emit) async {

    emit(SignInProcess());

    try {
      print("\n--\n--\n--\n--\n");
      print(event.email + "  " + event.password);
      print("\n--\n--\n--\n--\n");


      final credentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: event.email, password: event.password);

      // validation of Inputs

      if (credentials.user == null){
          // no account
        emit(const SignInError("No Account"));

      }else if(!credentials.user!.emailVerified) {
        emit(const SignInError("Email not Verified"));


      }


      var user = credentials.user;
      // print("\n--\n--\n--\n---\n");
      // print(user);
      // print("\n--\n--\n--\n--\n");
      emit(SigningInSuccess());
      }on FirebaseAuthException catch(e){
            emit( SignInError(e.code.toString()) );
          // if (e.code == "user-not-found"){
          // }
          // else if (e.code=="wrong-password"){
          //   emit(SignInError(e.code.toString()));
          // }
    }

    catch(e){
      emit(const SignInError("Network Error"));
    }

  }




  void _emailChangeHandler(EmailChangeEvent event, Emitter<SignInStates> emit) async {
    // emit(state.copyWith(email: event.email));
  }

  void _passwordChangeHandler(PasswordChangeEvent event, Emitter<SignInStates> emit) async {
    // emit(state.copyWith(password: event.password));
  }

}






// on<CreateUserEvent>(_createUserHandler);
// on<GetAllUsersEvent>(_getAllUsersHandler);

Future<void> _createUserHandler(CreateUserEvent event, Emitter<SignInState> emit) async {
  emit(const CreatingUser());

  final result = await _createUserUC(
      CreateUserParams(name: event.name, avatar: event.avatar, createdAt: event.createdAt));

  result.fold((failure) => emit(AuthError(failure.errorMessage)), (success) => emit(const UserCreated()));

}

Future<void> _getAllUsersHandler(GetAllUsersEvent event, Emitter<SignInState> emit) async {

  emit(const GettingUser());

  final result =  await _getAllUsersUC();

  result.fold((failure) => emit(AuthError(failure.errorMessage)), (users) => emit(UsersLoaded(users)));

}
