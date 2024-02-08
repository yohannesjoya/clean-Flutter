import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdd_clean/src/app_blocs.dart';
import 'package:tdd_clean/src/app_routes.dart';
import 'package:tdd_clean/src/authentication/Presentation/Views/signin_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/injection_container.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid ? await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBjmAREWdVV-ZO_hoak_n553_OsPLyqAfw", appId: "1:929089683051:android:18544ecff8933ef8317b2e",
        messagingSenderId: "929089683051", projectId: "cleanflutter-b4fec")
  ) : await Firebase.initializeApp();

  await init();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: ApplicationBlocsProvider.all,
        
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0)
            ),
            // home: const AuthScreen(),
            home:  const SignInScreen(),
            routes: ApplicationRoutesProvider.all,
          ),
        )
    );
  }
}