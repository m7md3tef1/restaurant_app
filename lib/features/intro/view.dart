import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_app/core/data/local/cacheHelper.dart';
import 'package:resturant_app/core/keys/keys.dart';
import 'package:resturant_app/core/router/router.dart';
import 'package:resturant_app/features/auth/units/customer_button.dart';
import 'package:resturant_app/widgets/widgets/custom_text.dart';
import '../../core/app_images/app_images.dart';
import '../admin/units/admin_screen.dart';
import '../auth/login.dart';
import '../home/view.dart';
part 'units/logo.dart';
part 'units/info.dart';

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
          const Center(
            child: Column(
              children: [
                Logo(),
                Info(),
              ],
            ),
          ),
          CustomButton(
            width: 250.w,
            text: 'LET\'S GO',
            colortext: Colors.white,
            function: () {
              if(CacheHelper.getBool(SharedKeys.customer)==true){
                MagicRouter.navigateTo(const Home());
              }else if(CacheHelper.getBool(SharedKeys.admin)==true){
                MagicRouter.navigateTo(const AdminScreen());
              }else{
                MagicRouter.navigateTo(Login());
              }

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
