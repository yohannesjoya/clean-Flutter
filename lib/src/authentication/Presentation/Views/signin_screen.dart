import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdd_clean/core/utils/toast.dart';
import 'package:tdd_clean/src/authentication/Presentation/Bloc/signin/sign_In_bloc.dart';
import 'package:tdd_clean/src/authentication/Presentation/widget/appbar_builder.dart';
import 'package:tdd_clean/src/authentication/Presentation/widget/input_field.dart';
import 'package:tdd_clean/src/authentication/Presentation/widget/sso_widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarBuilder(context,"Log In"),
        body: SingleChildScrollView(
          child: BlocConsumer<SignInBloc, SignInStates>(
            listener: (context, state){

              if (state is SignInError){
                toastInfo(msg: state.message);
              }
              if(state is SigningInSuccess){
                toastInfo(msg: "Welcome");
              }

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
                      margin: EdgeInsets.only(top: 30.h),
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          labelTextWidget("Email"),
                          inputFieldWidget("Enter your email", "example@example.com", Icons.person,_emailController),
                          SizedBox(height: 11.h,),
                          labelTextWidget("Password"),
                          inputFieldWidget("Enter your password", "password", Icons.key,_passwordController),
                          forgetPassword(),
                          SizedBox(height: 30.h,),

                          authButtonWidget("Login", state,
                                  () {BlocProvider.of<SignInBloc>(context).add(SigningInEvent(email: _emailController.text, password: _passwordController.text));}
                          ),
                          SizedBox(height: 6.h,),

                          authButtonWidget("Register",false,
                                  () {
                            Navigator.of(context).pushNamed("signup");
                          }
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


Widget labelTextWidget(String labelText) {
  return Container(
      margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
      child: Text(labelText, style: TextStyle(fontWeight: FontWeight.normal,
          fontSize: 14.sp,
          color: Colors.grey.withOpacity(0.75)),)
  );
}


Widget authButtonWidget(String labelText,state, void Function()? action ){

  return GestureDetector(
    onTap: (){action!();},
    child: Container(
      margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
      width: double.infinity,
      height: 45.h,
      decoration: BoxDecoration(
        color: labelText=="Login"? Colors.blueAccent : Colors.white,
        border: Border.all(color: Colors.blueAccent)
      ),
      child: Center(child: state is SignInProcess ? const CircularProgressIndicator()   : Text(labelText, style:  TextStyle(fontSize: 16.sp, color: labelText=="Login"? Colors.white : Colors.blueAccent, fontWeight: FontWeight.w500),)
      )
    ),
  );
}



Widget forgetPassword(){
  return Container(
    margin: EdgeInsets.only(top: 8.h),
    child: GestureDetector(
      child: const Text("forget password?", style: TextStyle(
        color: Colors.blue,
        decoration: TextDecoration.underline,
        decorationColor: Colors.blue,
        decorationStyle: TextDecorationStyle.solid
      ),),
    ),
  );
}