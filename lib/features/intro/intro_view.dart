import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_app/core/router/router.dart';
import 'package:resturant_app/features/auth/units/customer_button.dart';
import 'package:resturant_app/widgets/widgets/custom_text.dart';
import '../../core/app_images/app_images.dart';
import '../auth/login.dart';

class IntroScreen extends StatelessWidget {
  final Widget? nextScreen;

  const IntroScreen({Key? key, this.nextScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Image(
                  image: const AssetImage(AppImages.intro),
                  height: 300.h,
                  width: 300.w,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomText(
                  width: 300.5.w,
                  text: 'WE WILL FIND THE BEST!',
                  color: const Color(0xFF53714B),
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomText(
                  width: 300.5.w,
                  fontWeight: FontWeight.w200,
                  text:
                      'find the nearest places with the best organic foods and make your life healthier!',
                  color: const Color(0xFF53714B),
                  fontSize: 20.sp,
                  align: TextAlign.center,
                )
              ],
            ),
          ),
          CustomButton(
            width: 250.w,
            text: 'LET\'S GO',
            colortext: Colors.white,
            function: () {
              MagicRouter.navigateTo(Login());
            },
            color: const Color(0xFF53714B),
          ),
          SizedBox(
            height: 3.h,
          )
        ],
      ),
    ));
  }
}
