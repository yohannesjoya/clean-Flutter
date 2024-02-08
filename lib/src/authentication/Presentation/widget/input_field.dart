import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

Widget inputFieldWidget(String labelText, String hintText, IconData iconName, TextEditingController controller) {
  return Container(
      margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
      width: double.infinity,
      height: 46.h,
      child: TextField(
        onChanged: (value){
          // changeHandler!(value);
          // BlocProvider.of<AuthBloc>(context).add( (hintText == "password"? PasswordChangeEvent(password: "password"): EmailChangeEvent(email: "email")))
        },
        obscureText: hintText == "password",
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          labelStyle: TextStyle(color: Colors.grey.withOpacity(1)),
          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.6)),
          prefixIcon: Icon(iconName),
          border: const OutlineInputBorder(
              // borderRadius: BorderRadius.circular(5.0),
              // borderSide: const BorderSide(width: 0.2)
          ),
        ),
      )

  );
}


