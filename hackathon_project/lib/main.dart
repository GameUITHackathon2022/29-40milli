import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hackathon_project/screens/homepage_screen/HomepageScreen.dart';
import 'package:hackathon_project/screens/idea_screen/idea_newsfeed_screen.dart';
import 'package:hackathon_project/screens/intro_screen.dart/on_boading_screen.dart';
import 'package:hackathon_project/screens/login_screen/LoginScreen.dart';
import 'package:hackathon_project/screens/main_screen/MainScreen.dart';
import 'package:hackathon_project/screens/user_profile/edit_user_profile.dart';
import 'package:hackathon_project/screens/user_profile/user_profile_screen.dart';
import 'package:hackathon_project/utils/app_functions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: OnBoardingScreen(),
      theme: ThemeData(primarySwatch: Colors.green),
      home: Splash(),
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      AppFunctions.pushToScreenAndClear(context, OnBoardingScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          "assets/splash_screen_2.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
