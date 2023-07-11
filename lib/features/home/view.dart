import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_app/core/color_manager/color_manager.dart';
import 'package:resturant_app/features/description/desc_view.dart';

import 'package:resturant_app/features/home/states.dart';
import 'package:resturant_app/widgets/widgets/custom_text.dart';
import '../../core/router/router.dart';
import '../../widgets/widgets/custom_button.dart';
import '../../widgets/widgets/custom_rowdrawer.dart';
import '../auth/login.dart';
import 'package:badges/badges.dart' as badge;
import 'controller.dart';

part 'units/drawer.dart';
part 'units/nav_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          value: "Peru 1",
          child: CustomText(
            text: "Peru 1",
            color: const Color(0xFF53714B),
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          )),
      DropdownMenuItem(
          value: "Peru 2",
          child: CustomText(
              text: "Peru 2",
              color: const Color(0xFF53714B),
              fontWeight: FontWeight.bold,
              fontSize: 20.sp)),
      DropdownMenuItem(
          value: "Peru 3",
          child: CustomText(
              text: "Peru 3",
              color: const Color(0xFF53714B),
              fontWeight: FontWeight.bold,
              fontSize: 20.sp)),
      DropdownMenuItem(
          value: "Peru 4",
          child: CustomText(
              text: "Peru 4",
              color: const Color(0xFF53714B),
              fontWeight: FontWeight.bold,
              fontSize: 20.sp)),
    ];
    return menuItems;
  }

  var selectedValue;
  List image = [
    'assets/images/1.png',
    'assets/images/2.png',
  ];
  List name = [
    'Pizza veloper',
    'Pizza Cantos',
  ];
  List hint1 = [
    'Lorem ipsum dolor sit amet, consetetur',
    'Lorem ipsum dolor sit amet, consetetur',
  ];
  List<int> price = [
    150 ,
    70 ,
  ];
  List rival = ['Antes \$170.00', ''];
  List image2 = [
    'assets/images/5a35e097637df0.5152847915134803434075.png',
    'assets/images/5a35e097637df0.5152847915134803434075.png',
  ];
  List name2 = [
    'Burger miau',
    'Pizza Cantos',
    'Sandwich',
    'Desayuno',
    'Brocheta'
  ];
  List hint2 = [
    'Lorem ipsum dolor sit amet, consetetur',
    'Lorem ipsum dolor sit amet, consetetur',
  ];
  List<int> price2 = [
    150 ,
    70 ,
  ];
  List rival2 = ['Antes \$170.00', ''];

  int index = 1;
  Color col = Colors.white;

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
                    text: '3',
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
                text: '\$150.00',
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 20.w, right: 20.w, top: 40.h, bottom: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.menu,
                        color: Color(0xFF53714B),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      CustomText(
                        text: 'Ectraga en :   ',
                        fontSize: 20.sp,
                        color: Color(0xFF53714B),
                      ),
                      DropdownButton(
                        value: selectedValue,
                        items: dropdownItems,
                        onChanged: (Object? value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image(
                        image: AssetImage('assets/images/circle.png'),
                      )),
                ],
              ),
            ),
            Container(
                height: 50.h,
                width: 350.w,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 1,
                        color: Colors.grey.withOpacity(.1),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        size: 25.r,
                        color: Colors.grey,
                      ),
                      label: Text(
                        '     Que quieres comer hoy?',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
                        ),
                      ),
                      border: InputBorder.none),
                )),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Categories',
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: const Color(0xFF53714B),
                  ),
                  CustomText(
                    text: 'Ofertas',
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: Colors.redAccent,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
              child: Container(
                height: 150.h,
                width: 1.sw,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5.r),
                      child: Row(
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
                                height: 150.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: index == 1
                                      ? const Color(0xFF53714B)
                                      : col,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Image(
                                      image:
                                          AssetImage('assets/images/pizza.png'),
                                      height: 30.h,
                                      width: 30.w,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    CustomText(
                                      text: 'Pizzas',
                                      color: index == 1
                                          ? Colors.white
                                          : Color(0xFF707070),
                                      fontSize: 18.sp,
                                    )
                                  ],
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
                                height: 150.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: index == 2
                                      ? const Color(0xFF53714B)
                                      : col,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Image(
                                      image: AssetImage(
                                          'assets/images/burger.png'),
                                      height: 30.h,
                                      width: 30.w,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    CustomText(
                                      text: 'Burger',
                                      color: index == 2
                                          ? Colors.white
                                          : Color(0xFF707070),
                                    )
                                  ],
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
                                height: 150.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: index == 3
                                      ? const Color(0xFF53714B)
                                      : col,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Image(
                                      image: AssetImage(
                                          'assets/images/sandwich.png'),
                                      height: 30.h,
                                      width: 30.w,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    CustomText(
                                      text: 'Sandwich',
                                      color: index == 3
                                          ? Colors.white
                                          : Color(0xFF707070),
                                    )
                                  ],
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
                                height: 150.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: index == 4
                                      ? const Color(0xFF53714B)
                                      : col,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Image(
                                      image: const AssetImage(
                                          'assets/images/breakfast.png'),
                                      height: 30.h,
                                      width: 30.w,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    CustomText(
                                      text: 'Desayuno',
                                      color: index == 4
                                          ? Colors.white
                                          : Color(0xFF707070),
                                    )
                                  ],
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
                                index = 5;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.all(2.r),
                              child: Container(
                                height: 150.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: index == 5
                                      ? const Color(0xFF53714B)
                                      : col,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Image(
                                      image: const AssetImage(
                                          'assets/images/barbecue.png'),
                                      height: 30.h,
                                      width: 30.w,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    CustomText(
                                      text: 'Brocheta',
                                      color: index == 5
                                          ? Colors.white
                                          : Color(0xFF707070),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Pizzas',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF53714B),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Container(
                height: 300.h,
                width: 1.sw,
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DescScreen(
                                image: image[index],
                                name: name[index],
                                hint: hint1[index],
                                price: price[index],
                              );
                            }));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 3),
                                    blurRadius: 2,
                                    color: Color(0xFF53714B).withOpacity(.2),
                                  ),
                                ],
                              ),
                              height: 120.h,
                              width: 1.sw,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    rival[index] == ''
                                        ? CircleAvatar(
                                            radius: 40.r,
                                            backgroundColor: Colors.transparent,
                                            child: Image(
                                                image:
                                                    AssetImage(image2[index])),
                                          )
                                        : badge.Badge(
                                            position:
                                                badge.BadgePosition.topStart(
                                                    top: 1, start: -9),
                                            badgeStyle: badge.BadgeStyle(
                                              badgeColor: Colors.red,
                                            ),
                                            badgeContent: Center(
                                              child: CustomText(
                                                text: ' 20%',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10.sp,
                                                color: Colors.white,
                                              ),
                                            ),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              radius: 40.r,
                                              child: Image(
                                                  image:
                                                      AssetImage(image[index])),
                                            ),
                                          ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          CustomText(
                                            align: TextAlign.start,
                                            text: name[index],
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18.sp,
                                            color: const Color(0xFF53714B),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          CustomText(
                                            align: TextAlign.center,
                                            text: hint1[index],
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10.sp,
                                            color: const Color(0xFF53714B),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          CustomText(
                                            text: price[index].toString(),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18.sp,
                                            color: const Color(0xFFC3D61B),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          CustomText(
                                            text: rival[index],
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10.sp,
                                            color: const Color(0xFF53714B),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40.w,
                                    ),
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: CircleAvatar(
                                          radius: 20.r,
                                          backgroundColor:
                                              const Color(0xFF53714B),
                                          child: const Center(
                                            child: Image(
                                                image: AssetImage(
                                                    'assets/images/shopping-cart.png')),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Hamburgars',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF53714B),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
              ),
              child: Container(
                height: 300.h,
                width: 1.sw,
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DescScreen(
                                image: image2[index],
                                name: name2[index],
                                hint: hint2[index],
                                price: price2[index],
                              );
                            }));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 3),
                                    blurRadius: 2,
                                    color: Color(0xFF53714B).withOpacity(.2),
                                  ),
                                ],
                              ),
                              height: 120.h,
                              width: 1.sw,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    rival2[index] == ''
                                        ? CircleAvatar(
                                            radius: 40.r,
                                            backgroundColor: Colors.transparent,
                                            child: Image(
                                                image:
                                                    AssetImage(image2[index])),
                                          )
                                        : badge.Badge(
                                            badgeContent: Center(
                                              child: CustomText(
                                                text: '20%',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10.sp,
                                                color: Colors.white,
                                              ),
                                            ),
                                            position:
                                                badge.BadgePosition.topStart(
                                                    top: 1, start: -9),
                                            badgeStyle: const badge.BadgeStyle(
                                              badgeColor: Colors.red,
                                            ),
                                            child: CircleAvatar(
                                              radius: 40.r,
                                              backgroundColor:
                                                  Colors.transparent,
                                              child: Image(
                                                  image: AssetImage(
                                                      image2[index])),
                                            ),
                                          ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          CustomText(
                                            align: TextAlign.start,
                                            text: name2[index],
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18.sp,
                                            color: const Color(0xFF53714B),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          CustomText(
                                            align: TextAlign.center,
                                            text: hint2[index],
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10.sp,
                                            color: const Color(0xFF53714B),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          CustomText(
                                            text: price2[index].toString(),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18.sp,
                                            color: const Color(0xFF2BBEBA),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          CustomText(
                                            text: rival2[index],
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10.sp,
                                            color: const Color(0xFF53714B),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40.w,
                                    ),
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: CircleAvatar(
                                          radius: 20.r,
                                          backgroundColor:
                                              const Color(0xFF2BBEBA),
                                          child: const Center(
                                              child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          )),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
