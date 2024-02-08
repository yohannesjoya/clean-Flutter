import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdd_clean/src/authentication/Presentation/Bloc/signup/sign_up_bloc.dart';
import 'package:tdd_clean/src/authentication/Presentation/Views/signin_screen.dart';
import 'package:tdd_clean/src/authentication/Presentation/widget/appbar_builder.dart';
import 'package:tdd_clean/src/authentication/Presentation/widget/input_field.dart';
import 'package:tdd_clean/src/authentication/Presentation/widget/sso_widgets.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _emailController = TextEditingController(),
      _passwordController = TextEditingController(),
      _userNameController = TextEditingController(),
      _confirmPassController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarBuilder(context, "Sign Up"),
        body: SingleChildScrollView(
          child: BlocConsumer<SignUpBloc, SignUpStates>(
            listener: (context, state){

              // if (state is SignInError){
              //   toastInfo(msg: state.message);
              // }
              // if(state is SigningInSuccess){
              //   toastInfo(msg: "Welcome");
              // }

            },
            builder: (context, state) {
              return SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    ssoProvidersWidget(context),
                    labelTextWidget("or use your email account to Log In"),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 20.h),
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          labelTextWidget("User Name"),
                          inputFieldWidget("Enter your Username", "joeDoe", Icons.person,_userNameController),
                          SizedBox(height: 7.h,),
                          labelTextWidget("Email"),
                          inputFieldWidget("Enter your email", "example@example.com", Icons.person,_emailController),
                          SizedBox(height: 7.h,),
                          labelTextWidget("Password"),
                          inputFieldWidget("Enter your password", "password", Icons.key,_passwordController),
                          SizedBox(height: 7.h,),
                          labelTextWidget("Confirm Password"),
                          inputFieldWidget("Renter your Password", "password", Icons.key,_confirmPassController),
                          SizedBox(height: 25.h,),

                          authButtonWidget("Register",false,
                                  () {
                            BlocProvider.of<SignUpBloc>(context).add(SigningUpEvent(
                                email: _emailController.text, password: _passwordController.text,
                              username: _userNameController.text, confirmPassword: _confirmPassController.text
                            ));
                          }
                          ),
                          SizedBox(height: 4.h,),
                          Row(
                              children: [
                                labelTextWidget("already have an account? "),
                                GestureDetector(
                                  onTap: (){Navigator.of(context).pushNamedAndRemoveUntil("signin", (route) => false);},
                                  child: const Text(" Log In",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        decorationColor: Colors.blue,
                                        decorationStyle: TextDecorationStyle.solid,
                                        decoration: TextDecoration.underline),),)
                              ],
                            ),

                        ],
                      ),
                    )
                  ],),
              );
            },
          ),
        )
    );
  }
}
