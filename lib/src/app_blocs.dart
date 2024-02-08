import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_clean/src/authentication/Presentation/Bloc/signin/sign_In_bloc.dart';
import 'package:tdd_clean/src/authentication/Presentation/Bloc/signup/sign_up_bloc.dart';
import 'package:tdd_clean/src/on_boarding/Presentation/Bloc/on_boarding_bloc.dart';
import '../core/services/injection_container.dart';

class ApplicationBlocsProvider{

  static get all => [
    BlocProvider(create: (context) => sl<OnBoardingBloc>(),),
    BlocProvider(create: (context) => sl<SignInBloc>() ),
    BlocProvider(create: (context) => sl<SignUpBloc>() )
  ];

}