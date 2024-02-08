import 'authentication/Presentation/Views/signin_screen.dart';
import 'on_boarding/Presentation/Views/onboarding_screen.dart';
import 'package:tdd_clean/src/authentication/Presentation/Views/signup_screen.dart';


class ApplicationRoutesProvider{

  static get all =>
    {
      "signin":(context) => const SignInScreen(),
      "signup" : (context) => const SignUpScreen(),
      "onboarding": (context) =>  const OnBoardingScreen(),

    };
}