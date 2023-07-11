import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import '../../core/app_images/app_images.dart';
import '../../core/router/router.dart';
import '../../features/home/view.dart';
import 'custom_text.dart';

class CustomAppbar extends StatelessWidget {
  String title;
  var font;
  var icon;
  GlobalKey<ScaffoldState>? scaffoldKey;
  bool? hideIcons;
  CustomAppbar(
      {Key? key,
      required this.title,
      this.icon,
      this.font,
      this.hideIcons,
      this.scaffoldKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        height: 120.h,
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            child: Column(
              children: [
                Center(
                    child: Image(
                        height: 60.h,
                        width: 1.sw,
                        image: const AssetImage(AppImages.logo))),
                Row(
                  mainAxisAlignment:
                      (hideIcons == null || !hideIcons!) && icon != null
                          ? MainAxisAlignment.spaceBetween
                          : (hideIcons == null || !hideIcons!)
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.center,
                  children: [
                    if (hideIcons == null || !hideIcons!)
                      InkWell(
                          onTap: () {
                            print('clicked');
                            if (scaffoldKey != null) {
                              print('clicked2');

                              scaffoldKey!.currentState!.openDrawer();
                            } else {
                            //  Home.scaffoldStateKey.currentState!.openDrawer();
                            }
                          },
                          child: const Icon(Icons.menu)),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: CustomText(
                          text: title,
                          align: TextAlign.center,
                          fontSize: font ?? 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if ((hideIcons == null || !hideIcons!))
                      InkWell(
                          onTap: () {
                          //  MagicRouter.navigateTo(DashboardView());
                          },
                          child: const Icon(Icons.account_circle_outlined)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
