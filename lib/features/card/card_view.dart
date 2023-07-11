import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_app/core/color_manager/color_manager.dart';
import 'package:badges/badges.dart' as badge;
import 'package:resturant_app/widgets/widgets/custom_text.dart';

import '../../core/data/models/Product.dart';

// ignore: must_be_immutable
class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  // late var c ;
  num totalprice = 0;
  num totalcounter = 0;
  void _incrementCounter(index) {
    setState(() {
      totalprice = 0;
      totalcounter=0;
      pro[index].counter++;
      for (var i = 0; i < pro.length; i++) {
        totalprice += pro[i].price * pro[i].counter;

        print(totalprice);
      }
      for (var i = 0; i < pro.length; i++) {
        totalcounter += pro[i].counter;

        print(totalcounter);
      }
    });
  }

  num P = 0;
  void p() {
    for (var i = 0; i < pro.length; i++) {
      P += pro[i].price;
    }
  }

  num C = 0;
  void c() {
    for (var i = 0; i < pro.length; i++) {
      C += pro[i].counter;
    }
  }

  void _decrementCounter(index) {
    setState(() {
      totalprice = 0;
      totalcounter=0;
      pro[index].counter == 1 ? 1 : pro[index].counter--;
      for (var i = 0; i < pro.length; i++) {
        totalprice += pro[i].price * pro[i].counter;

        print(totalprice);
      }
      for (var i = 0; i < pro.length; i++) {
        totalcounter += pro[i].counter;

        print(totalcounter);
      }
    });
  }

  List image = [
    'assets/images/029-burger.png',
    'assets/images/Group 2759.png',
    'assets/images/020-donut.png',
    'assets/images/024-soup.png',
    'assets/images/012-fried chicken.png'
  ];
  List name = ['Burger', 'Carne', 'Postres', 'Sopa', 'Sopa'];
  List color = [
    const Color(0xFFCAE9F7),
    const Color(0xFFCAF7D6),
    const Color(0xFFF7D0CA),
    const Color(0xFFF1ECCA),
    const Color(0xFFCCCAF1),
  ];

  List<Product> pro = [
    Product(
        imgurl: 'assets/images/emiliano-vittoriosi-OFismyezPnY-unsplash.png',
        name: 'Platillo Example',
        price: 155,
        counter: 1),
    Product(
        imgurl: 'assets/images/brooke-lark-1Rm9GLHV0UA-unsplash.png',
        name: 'Platillo Example',
        price: 155,
        counter: 1),
  ];
  @override
  void initState() {
    p();
    c();
    print(P);
    print(C);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
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
                      text: totalcounter == 0
                          ? C.toString()
                          : totalcounter.toString(),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.whiteColor,
                    ),
                  ),
                ),
                SizedBox(width: 80.w),
                CustomText(
                  text: 'Ir a pagar',
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                  color: Colors.white,
                ),
                SizedBox(width: 20.w),
                SizedBox(width: 40.w),
                CustomText(
                  space: 1.5,
                  text:
                      '\$${totalprice == 0 ? P.toString() : totalprice.toString()}',
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.grey[200],
            child: Padding(
              padding: EdgeInsets.only(top: 80.h),
              child: Container(
                  width: 1.sw,
                  height: 1.sh,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(19.r),
                        topLeft: Radius.circular(19.r)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 50.w,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 18.r,
                                backgroundColor: ColorManager.primaryColor,
                                child: const Center(
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 50.w,
                          ),
                          Image.asset(
                            'assets/images/basket.png',
                            color: const Color(0xFF341557),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          CustomText(
                            text: 'Tu canasta',
                            fontWeight: FontWeight.w500,
                            fontSize: 30.sp,
                            color: ColorManager.primaryColor,
                          )
                        ],
                      ),
                      Container(
                        height: 350.h,
                        width: 1.sw,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: pro.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) =>
                                Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image(
                                            image: AssetImage(
                                                pro[index].imgurl.toString())),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              text: pro[index].name.toString(),
                                              fontWeight: FontWeight.w400,
                                              color: ColorManager.primaryColor,
                                              fontSize: 20.sp,
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            CustomText(
                                              space: 1.5,
                                              text:
                                                  '\$${pro[index].price.toString()}',
                                              fontWeight: FontWeight.bold,
                                              color: ColorManager.primaryColor,
                                              fontSize: 17.sp,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 10.r),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: ColorManager.greyColor)),
                                        child: Padding(
                                          padding: EdgeInsets.all(15.r),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    _incrementCounter(index);
                                                  });
                                                },
                                                child: Center(
                                                  child: CustomText(
                                                    text: '+',
                                                    fontSize: 30.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorManager
                                                        .primaryColor,
                                                  ),
                                                ),
                                              ),
                                              CustomText(
                                                text: pro[index]
                                                    .counter
                                                    .toString(),
                                                fontSize: 22.sp,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    ColorManager.primaryColor,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    _decrementCounter(index);
                                                    print(pro[index].counter);
                                                  });
                                                },
                                                child: Center(
                                                  child: CustomText(
                                                    text: '-',
                                                    fontSize: 30.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorManager
                                                        .primaryColor,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                index==1? SizedBox(
                                  height: 5.h,
                                ):
                                SizedBox(
                                  height: 20.h,
                                  child: const Divider(thickness: .9),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20.r),
                            child: CustomText(
                              align: TextAlign.start,
                              text: 'Busca algo más',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 150.h,
                        width: 1.sw,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: image.length,
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 45.r,
                                        backgroundColor: color[index],
                                        child: Center(
                                          child: Image(
                                              image: AssetImage(image[index])),
                                        ),
                                      ),
                                      CustomText(
                                        text: 'Burger',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                        color: ColorManager.primaryColor,
                                      )
                                    ],
                                  ),
                                )),
                      ),
                      SizedBox(
                        height: 100.h,
                        child: const Divider(thickness: .9),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                CustomText(
                                  text: 'Total a cobrar:',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.primaryColor,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomText(
                                  text: 'pago con tarjeta',
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFD0E612),
                                ),
                              ],
                            ),
                            CustomText(
                              text:
                                  '\$${totalprice == 0 ? P.toString() : totalprice.toString()}',
                              space: 1.5,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                              color: ColorManager.primaryColor,
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ));
  }
}
