import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/color_manager/color_manager.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  String? title;
  var onSaved;
  var validate;
  var prefixIcon;
  int? maxLength;
  var suffixIcon;
  var hintText;
  bool obscure;
  var keyboardType;
  var controller;
  bool readOnly;
  var lines;
  var height;
  Color? color;
  bool isGreyTextColor = true;

  var label;
  var name;
  bool enabled = true;
  CustomTextField(
      {Key? key,
      this.title,
      this.name,
      this.maxLength,
      this.keyboardType,
      this.readOnly = false,
      this.color,
      this.height,
      this.hintText,
      this.controller,
      this.lines,
      this.onSaved,
      this.validate,
      this.suffixIcon,
      this.isGreyTextColor = true,
      this.obscure = false,
      this.enabled = true,
      this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 14.w),
      child: Container(
        height: 80.h,
        width: 1.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 14.w),
              child: Container(
                child: Row(
                  children: [
                    Text(name,
                        style: TextStyle(
                            letterSpacing: 4.5,
                            fontSize: 19.sp,
                            color: const Color(0xFF53714B),
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
            Container(
              height: 48.h,
              child: Padding(
                padding: EdgeInsets.only(left: 14.0.w, bottom: 0.h),
                child: TextFormField(
                    style: TextStyle(
                        color: ColorManager.darkGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: 20.sp),
                    obscureText: obscure,
                    onSaved: onSaved,
                    validator: validate,
                    controller: controller,
                    autofocus: false,
                    maxLines: lines,
                    maxLength: maxLength,
                    // buildCounter: (context,
                    //         {required currentLength,
                    //         required isFocused,
                    //         maxLength}) =>
                    //     null,
                    readOnly: readOnly,
                    keyboardType: keyboardType,
                    textDirection: TextDirection.ltr,
                    decoration: InputDecoration(
                      prefixIcon: prefixIcon,
                      suffixIcon: suffixIcon,
                      hintText: hintText,
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                        color: Color(0xFFB8B6B6),
                      ),
                      //   border: InputBorder.none,
                      focusColor: ColorManager.blackColor,
                      fillColor: Color(0xFF53714B),
                      hoverColor: Color(0xFF53714B)
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
