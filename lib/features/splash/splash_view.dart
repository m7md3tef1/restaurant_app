import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_app/features/intro/intro_view.dart';
import 'package:resturant_app/widgets/widgets/custom_text.dart';
import '../../core/app_images/app_images.dart';
import '../home/view.dart';

class SplashScreen extends StatelessWidget {
  final Widget? nextScreen;

  const SplashScreen({Key? key, this.nextScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        AnimatedSplashScreen(
            duration: 2500,
            splashIconSize: 150,
            splash: Column(
              children: [
                Image.asset(AppImages.logo
                ,width: 200.w,),
                SizedBox(
                  height: 4.h,
                ),
                CustomText(
                  text: 'find good food',
                  color: const Color(0xFF53714B),
                  fontSize: 18.sp,
                )
              ],
            ),
            nextScreen: const IntroScreen(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Colors.white),


    );
  }
}
