import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar appBarBuilder(context,String title){
  return  AppBar(
    // bottom: PreferredSize(
    //   preferredSize: const Size.fromHeight(1),
    //   child: Container(color: Colors.grey.withOpacity(0.15), height: 1,),
    // ),
    title: Text(title , style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.normal, color: Colors.black),),
    centerTitle: true,
  );
}