import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:resturant_app/core/color_manager/color_manager.dart';
import 'package:badges/badges.dart' as badge;
import 'package:resturant_app/widgets/widgets/custom_text.dart';
import '../../core/data/models/Product.dart';
import '../card/view.dart';

part 'units/btn.dart';
part 'units/image.dart';
part 'units/details.dart';
part 'units/rowButton.dart';
part 'units/font.dart';
part 'units/option.dart';

// ignore: must_be_immutable
class DescScreen extends StatefulWidget {
  DescScreen({
    super.key,
    this.name,
    this.price,
    this.rival,
    this.image,
    this.product,
    this.hint,
  });
  Product? product;
  var name;
  int? price;
  List? image;
  var hint;
  var rival;

  @override
  State<DescScreen> createState() => _DescScreenState();
}

class _DescScreenState extends State<DescScreen> {
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
    var img = widget.image;
    return Scaffold(
        bottomNavigationBar: BTN(
          counter: _counter.toString(),
          totalprice: totalprice,
          price: widget.price.toString(),
        ),
        body: SingleChildScrollView(
          child: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              color: const Color(0xFFF6F9FA),
              child: Column(
                children: [
                  ImageBadge(
                    img: img,
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45.r),
                            topRight: Radius.circular(45.r)),
                        color: ColorManager.whiteColor),
                    child: Column(
                      children: [
                        //start details
                        Column(
                          children: [
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                                  color:
                                                      ColorManager.greyColor),
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
                            SizedBox(
                              width: 320.w,
                              height: 50.h,
                              child: Text(
                                widget.hint,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: ColorManager.primaryColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,

                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                        //end details
                        const Font(),
                        const RowButton(),
                        const Option()
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
