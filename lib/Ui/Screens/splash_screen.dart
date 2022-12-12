import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:magiccoffee/Ui/Constans/app.dart';
import 'package:magiccoffee/Ui/Constans/icons.dart';
import 'package:magiccoffee/Ui/Constans/images.dart';
import 'package:magiccoffee/Ui/Constans/strings.dart';
import 'package:magiccoffee/Ui/Screens/Auth/signin.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors().AppMainColor,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: SizedBox(
              height: height,
              width: width,
              child: Image.asset(
                ImagesData().SplashScreenBackgroundImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: height * 0.4,
                      width: width * 0.75,
                      child: Text(StringsData().AppName,
                          style: AppData().splashScrenTitleStyle()),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  startTimer() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, navigationPage);
  }

  navigationPage() {
    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        duration: const Duration(milliseconds: 200),
        child: const SignInScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("home"),
      ),
    );
  }
}
