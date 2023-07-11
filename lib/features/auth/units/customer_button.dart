import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/color_manager/color_manager.dart';
import '../../../widgets/widgets/custom_text.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String? text;
  var function;
  var width;
  Color? color;
  Color? colortext;

  CustomButton(
      {required this.text,
      this.colortext,
      this.width,
      required this.function,
      this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.only(top: 18, bottom: 14),
        child: Container(
            width: width ?? double.infinity,
            height: 70.h,
            decoration: BoxDecoration(
              color: color ?? ColorManager.yellow,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: CustomText(
                color: colortext,
                text: text,
                fontWeight: FontWeight.w200,
                fontSize: 22.sp,
              ),
            )),
      ),
    );
  }
}
