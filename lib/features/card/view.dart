import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_app/core/color_manager/color_manager.dart';
import 'package:badges/badges.dart' as badge;
import 'package:resturant_app/core/router/router.dart';
import 'package:resturant_app/widgets/widgets/custom_text.dart';
import '../../core/data/models/Product.dart';

part 'units/btn.dart';
part 'units/name.dart';
part 'units/listview.dart';
part 'units/total.dart';

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
      totalcounter = 0;
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
      totalcounter = 0;
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
        bottomNavigationBar: BTN(
          totalprice: totalprice,
          C: C,
          totalcounter: totalcounter,
          P: P,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.grey[200],
            child: Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Container(
                  width: 1.sw,
                  height: 1.sh,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.r),
                        topLeft: Radius.circular(30.r)),
                  ),
                  child: Column(
                    children: [
                      Name(),
                      //start details
                      Container(
                        height: 320.h,
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
                                index == 1
                                    ? SizedBox(
                                        height: 5.h,
                                      )
                                    : SizedBox(
                                        height: 20.h,
                                        child: const Divider(thickness: .9),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //end details
                      const Listview(),
                      Total(P, totalprice),
                    ],
                  )),
            ),
          ),
        ));
  }
}
