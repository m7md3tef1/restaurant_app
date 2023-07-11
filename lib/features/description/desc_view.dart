import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_app/core/color_manager/color_manager.dart';
import 'package:badges/badges.dart' as badge;
import 'package:resturant_app/core/router/router.dart';
import 'package:resturant_app/widgets/widgets/custom_text.dart';

import '../../core/data/models/Product.dart';
import '../card/card_view.dart';

// ignore: must_be_immutable
class DescScreen extends StatefulWidget {
  DescScreen(
      {super.key,
      this.name,
      this.price,
      this.rival,
      this.image,
      this.product,
      this.hint});
  Product? product;
  var name;
  int? price;
  var image;
  var hint;
  var rival;

  @override
  State<DescScreen> createState() => _DescScreenState();
}

class _DescScreenState extends State<DescScreen> {
  int index = 1;
  Color col = Colors.white;
  bool isfav = true;
  var value;
  var gvalue;
  var totalprice;
  int _counter = 1;
  void _incrementCounter() {
    setState(() {
      _counter++;
      _count();
    });
  }

  void _count() {
    setState(() {
      _counter * widget.price!;
      totalprice = _counter * widget.price!;
      print(_counter * widget.price!);
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter == 1 ? 1 : _counter--;
      _count();
    });
  }

  @override
  Widget build(BuildContext context) {
    // totalprice=widget.price;
    var img = widget.image;
    // totalprice= _counter *widget.price;
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              MagicRouter.navigateTo(CardScreen());
            },
            child: Container(
              width: 1.sw,
              height: 70.h,
              decoration: BoxDecoration(
                  color: const Color(0xFF53714B),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Row(
                children: [
                  SizedBox(
                    width: 30.w,
                  ),
                  Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        color: const Color(0xFFC3D61B),
                        borderRadius: BorderRadius.circular(8.r)),
                    child: Center(
                      child: CustomText(
                        text: _counter.toString(),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 40.w),
                  CustomText(
                    text: 'Mi cesta',
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    color: Colors.white,
                  ),
                  SizedBox(width: 40.w),
                  CustomText(
                    text: '|',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    color: Colors.white,
                  ),
                  SizedBox(width: 40.w),
                  CustomText(
                    text: totalprice == null
                        ?'\$ ${ widget.price.toString()}'
                        :'\$ ${ totalprice.toString()}',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Color(0xFFF6F9FA),
            child: Column(
              children: [
                badge.Badge(
                  position:
                      badge.BadgePosition.bottomEnd(end: 80.w, bottom: -20.h),
                  badgeStyle: badge.BadgeStyle(
                    badgeColor: ColorManager.primaryColor,
                  ),
                  badgeContent: InkWell(
                    onTap: () {
                      setState(() {
                        isfav = !isfav;
                      });
                    },
                    child: Padding(
                        padding: EdgeInsets.all(8.r),
                        child: Center(
                            child: Icon(
                          isfav ? Icons.favorite_border : Icons.favorite,
                          size: 33.r,
                          color: Colors.white,
                        ))),
                  ),
                  child: Container(
                    height: 370.h,
                    width: 1.sw,
                    child: Stack(children: [
                      Container(
                        height: 370.h,
                        width: 1.sw,
                        child: Image(
                          // width: 1.sw,
                          fit: BoxFit.cover,
                          image: AssetImage(img.toString()),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 80.h, horizontal: 50.w),
                        child: Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 20.r,
                                backgroundColor: ColorManager.primaryColor,
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              CircleAvatar(
                                radius: 20.r,
                                backgroundColor: ColorManager.primaryColor,
                                child: const Icon(
                                  Icons.share,
                                  color: ColorManager.whiteColor,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 220.h, left: 25.w, right: 25.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 15.r,
                                  backgroundColor: ColorManager.greyColor,
                                  child: const Icon(
                                    Icons.arrow_back_ios_new_outlined,
                                    color: Colors.black,
                                    size: 12,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                const Icon(
                                  Icons.more_horiz,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ],
                            ),
                            InkWell(
                              // onTap: () {
                              //   setState(() {
                              //     img = widget.image[index+1];
                              //     print(img.toString());
                              //   });
                              // },
                              child: CircleAvatar(
                                radius: 15.r,
                                backgroundColor: ColorManager.greyColor,
                                child: const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.black,
                                  size: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.r),
                          topRight: Radius.circular(45.r)),
                      color: ColorManager.whiteColor),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomText(
                              text: widget.name,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.primaryColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: '\$ ${widget.price!.toString()}',
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF0D1863),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _decrementCounter();
                                      // _count();
                                    });
                                  },
                                  child: Container(
                                    height: 36.h,
                                    width: 30.w,
                                    decoration: BoxDecoration(
                                        color: ColorManager.whiteColor,
                                        border: Border.all(
                                            color: ColorManager.greyColor),
                                        borderRadius:
                                            BorderRadius.circular(30.r)),
                                    child: Center(
                                      child: CustomText(
                                        text: '-',
                                        fontSize: 25.sp,
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager.primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                CustomText(
                                  text: '  ${_counter.toString()}  ',
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w500,
                                  color: ColorManager.primaryColor,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _incrementCounter();
                                      //_count();
                                    });
                                  },
                                  child: Container(
                                    height: 36.h,
                                    width: 30.w,
                                    decoration: BoxDecoration(
                                        color: ColorManager.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(30.r)),
                                    child: Center(
                                      child: CustomText(
                                        text: '+',
                                        fontSize: 25.sp,
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager.whiteColor,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              align: TextAlign.start,
                              text: widget.hint,
                              color: ColorManager.primaryColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'Elige tamaño',
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.primaryColor,
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            CircleAvatar(
                              radius: 10.r,
                              backgroundColor: Colors.deepPurple,
                              // backgroundColor: const Color(0xFF1BD699),
                              child: const Center(
                                child: Icon(
                                  Icons.done,
                                  color: ColorManager.whiteColor,
                                  size: 18,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20.w, right: 20.w, top: 35.h),
                        child: Container(
                          height: 50.h,
                          width: 1.sw,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        index = 1;
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(2.r),
                                      child: Container(
                                        height: 40.h,
                                        width: 70.w,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: ColorManager.greyColor),
                                          borderRadius:
                                              BorderRadius.circular(25.r),
                                          color: index == 1
                                              ? const Color(0xFF53714B)
                                              : col,
                                        ),
                                        child: Center(
                                          child: CustomText(
                                            text: 'CH',
                                            fontSize: 15.sp,
                                            color: index == 1
                                                ? Colors.white
                                                : ColorManager.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        index = 2;
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(2.r),
                                      child: Container(
                                        height: 40.h,
                                        width: 70.w,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: ColorManager.greyColor),
                                          borderRadius:
                                              BorderRadius.circular(25.r),
                                          color: index == 2
                                              ? const Color(0xFF53714B)
                                              : col,
                                        ),
                                        child: Center(
                                          child: CustomText(
                                            text: 'MD',
                                            fontSize: 15.sp,
                                            color: index == 2
                                                ? Colors.white
                                                : ColorManager.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        index = 3;
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(2.r),
                                      child: Container(
                                        height: 40.h,
                                        width: 70.w,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: ColorManager.greyColor),
                                          borderRadius:
                                              BorderRadius.circular(25.r),
                                          color: index == 3
                                              ? const Color(0xFF53714B)
                                              : col,
                                        ),
                                        child: Center(
                                          child: CustomText(
                                            fontSize: 15.sp,
                                            text: 'GD',
                                            color: index == 3
                                                ? Colors.white
                                                : ColorManager.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        index = 4;
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(2.r),
                                      child: Container(
                                        height: 40.h,
                                        width: 70.w,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: ColorManager.greyColor),
                                          borderRadius:
                                              BorderRadius.circular(25.r),
                                          color: index == 4
                                              ? const Color(0xFF53714B)
                                              : col,
                                        ),
                                        child: Center(
                                          child: CustomText(
                                            text: 'FM',
                                            fontSize: 15.sp,
                                            color: index == 4
                                                ? Colors.white
                                                : ColorManager.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                CustomText(
                                  text: 'Elige complemento',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.primaryColor,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomText(
                                    text: 'Selecciona hasta dos opciones',
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    color: ColorManager.primaryColor),
                              ],
                            ),
                            Container(
                              height: 50.h,
                              width: 120.w,
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Center(
                                child: CustomText(
                                  text: 'Obligatorio',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                  color: ColorManager.whiteColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20.w, right: 20.w, top: 35.h, bottom: 20.h),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: '   Option 1',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp,
                                      color: ColorManager.primaryColor,
                                    ),
                                    Radio(
                                        value: "Option 1",
                                        groupValue: gvalue,
                                        hoverColor: ColorManager.primaryColor,
                                        activeColor: ColorManager.primaryColor,
                                        focusColor: ColorManager.primaryColor,
                                        onChanged: (val) {
                                          setState(() {
                                            gvalue = val.toString();
                                          });
                                        }),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: '   Option 2',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp,
                                      color: ColorManager.primaryColor,
                                    ),
                                    Radio(
                                        value: "Option 2",
                                        groupValue: gvalue,
                                        activeColor: ColorManager.primaryColor,
                                        focusColor: ColorManager.primaryColor,
                                        onChanged: (val) {
                                          setState(() {
                                            gvalue = val.toString();
                                          });
                                        }),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
