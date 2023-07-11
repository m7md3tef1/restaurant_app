import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/widgets/custom_appbar.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static GlobalKey<ScaffoldState> scaffoldStateKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomAppbar(
          title: 'Home Screen',
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 15.sp),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  SizedBox(
                    height: 38.h,
                  ),

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
