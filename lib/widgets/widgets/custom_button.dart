import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/color_manager/color_manager.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  var function;
  String? text;
  double? width;
  double? height;

  var color;
  var colorborder;
  var colortext;
  double? font;
  var icon;
  var image;
  var color2;
  CustomButton(
      {Key? key,
      this.color2,
      this.image,
      this.function,
      this.colorborder,
      this.colortext,
      required this.text,
      this.font,
      this.width,
      this.height,
      this.icon,
      this.color = ColorManager.yellow})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
          width: width ?? 1.sw,
          height: height ?? 55.h,
          decoration: BoxDecoration(
              color: color,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 5),
                  blurRadius: 0,
                  color: color2 == null
                      ? Colors.transparent
                      : color2.withOpacity(.2),
                ),
              ],
              borderRadius: BorderRadius.circular(35.r),
              border: Border.all(
                color: colorborder ?? Colors.transparent,
              )),
          child: Center(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 15.w,),
                image==null?Container():  Image(image: image),
                Expanded(
                  child: CustomText(
                    text: text,
                    align: TextAlign.center,
                    color: colortext ?? Colors.black,
                    fontSize: font ?? 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ))),
    );
  }
}
