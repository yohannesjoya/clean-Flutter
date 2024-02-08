import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

Widget ssoProvidersWidget(BuildContext context) {
  return Container(
    width: 265.w,
    margin: EdgeInsets.only(top: 18.h, bottom: 18.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ssoIconsWidget("appleicon.png"),
        ssoIconsWidget("googleicon.png"),
        ssoIconsWidget("facebook.png"),
      ],
    ),
  );
}


Widget ssoIconsWidget(String iconsPath) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 35.w,
      height: 35.w,
      child: Image.asset('assets/icons/$iconsPath'),),
  );
}
