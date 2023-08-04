import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  var name;
  var prefixIcon;
  int? maxLength;
  var suffixIcon;
  var hintText;
  var lines;
  var height;
  var controller;
  var validate;

  bool enabled = true;
  CustomTextField(
      {Key? key,
      this.name,
      this.height,
      this.controller,
      this.validate,
      this.maxLength,
      this.lines,
      this.hintText,
      this.suffixIcon,
      this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        height: height ?? 110.h,
        width: 1.sw,
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 2.w),
              child: Row(
                children: [
                  Text(name,
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: const Color(0xFFC3D61B),
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            Container(
              //  height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Colors.grey),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 14.0.w, bottom: 0.h),
                child: TextFormField(
                    style: const TextStyle(color: Colors.grey),
                    autofocus: false,
                    maxLines: lines,
                    validator: validate,
                    controller: controller,
                    maxLength: maxLength,
                    textDirection: TextDirection.ltr,
                    buildCounter: (context,
                            {required currentLength,
                            required isFocused,
                            maxLength}) =>
                        null,
                    decoration: InputDecoration(
                      prefixIcon: prefixIcon,
                      suffixIcon: suffixIcon,
                      hintText: hintText,
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17.sp,
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                      focusColor: Colors.black,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
