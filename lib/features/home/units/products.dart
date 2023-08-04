part of '../view.dart';

class Products extends StatefulWidget {
  Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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
    150,
    70,
  ];

  List rival2 = ['Antes \$170.00', ''];

  @override
  void initState() {
    ProductCubit.get(context).productList.length;
    ProductCubit.get(context).getProduct();
    print('dataaa');
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
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
        BlocConsumer<ProductCubit, GetProductStates>(
            builder: (context, state) {
              return state is GetProductsSuccess
                  ? Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Container(
                        height: 300.h,
                        width: 1.sw,
                        child: ListView.builder(
                            itemCount:
                                ProductCubit.get(context).productList.length,
                            itemBuilder: (context, index) {
                              // print('---dddddddddddd---');
                              // print(
                              //     ProductCubit.get(context).productList.length);
                              // print(ProductCubit.get(context)
                              //     .productList[0]['images'][0]
                              //     .toString());
                              // print(ProductCubit.get(context).productList[0]['category']['name'].toString() );
                              // print(ProductCubit.get(context).productList[1]['category']['name'].toString());
                              // print(ProductCubit.get(context).productList[2]['category']['name'].toString());
                              // print(ProductCubit.get(context).productList[3]['category']['name'].toString());
                              // print(ProductCubit.get(context).productList[4]['category']['name'].toString());
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return DescScreen(
                                      image: ProductCubit.get(context)
                                          .productList[index]['images'],
                                      name: ProductCubit.get(context)
                                          .productList[index]['title']
                                          .toString(),
                                      hint: ProductCubit.get(context)
                                          .productList[index]['description']
                                          .toString(),
                                      price: ProductCubit.get(context)
                                          .productList[index]['price'],
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
                                          color: const Color(0xFF53714B)
                                              .withOpacity(.2),
                                        ),
                                      ],
                                    ),
                                    height: 135.h,
                                    width: 1.sw,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 40.r,
                                            backgroundColor: Colors.transparent,
                                            child: Image.network(ProductCubit
                                                                .get(context)
                                                            .productList[index]
                                                        ['images'][0] ==
                                                    null
                                                ? image2[1]
                                                : ProductCubit.get(context)
                                                    .productList[index]
                                                        ['images'][0]
                                                    .toString()),
                                          ),

                                          // : badge.Badge(
                                          //     position: badge.BadgePosition
                                          //         .topStart(
                                          //             top: 1, start: -9),
                                          //     badgeStyle:
                                          //         const badge.BadgeStyle(
                                          //       badgeColor: Colors.red,
                                          //     ),
                                          //     badgeContent: Center(
                                          //       child: CustomText(
                                          //         text: ' 20%',
                                          //         fontWeight:
                                          //             FontWeight.w600,
                                          //         fontSize: 10.sp,
                                          //         color: Colors.white,
                                          //       ),
                                          //     ),
                                          //     child: CircleAvatar(
                                          //       backgroundColor:
                                          //           Colors.transparent,
                                          //       radius: 40.r,
                                          //       child: Image.network(ProductCubit
                                          //                           .get(
                                          //                               context)
                                          //                       .productList[index]
                                          //                   ['images'][0] ==
                                          //               null
                                          //           ? image[1]
                                          //           : ProductCubit.get(
                                          //                   context)
                                          //               .productList[index]
                                          //                   ['images'][0]
                                          //               .toString()),
                                          //     ),
                                          //   ),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                CustomText(
                                                  align: TextAlign.center,
                                                  text: ProductCubit.get(
                                                                      context)
                                                                  .productList[
                                                              index]['title'] ==
                                                          null
                                                      ? 'Nooooooo'
                                                      : ProductCubit.get(
                                                              context)
                                                          .productList[index]
                                                              ['title']
                                                          .toString(),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18.sp,
                                                  color:
                                                      const Color(0xFF53714B),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Expanded(
                                                  child: CustomText(
                                                    align: TextAlign.center,
                                                    text: ProductCubit.get(
                                                                        context)
                                                                    .productList[index]
                                                                [
                                                                'description'] ==
                                                            null
                                                        ? 'Nooooooo'
                                                        : ProductCubit.get(
                                                                context)
                                                            .productList[index]
                                                                ['description']
                                                            .toString(),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 10.sp,
                                                    color:
                                                        const Color(0xFF53714B),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                CustomText(
                                                  text: ProductCubit.get(
                                                                      context)
                                                                  .productList[
                                                              index]['price'] ==
                                                          null
                                                      ? 'Nooooooo'
                                                      : ProductCubit.get(
                                                              context)
                                                          .productList[index]
                                                              ['price']
                                                          .toString(),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18.sp,
                                                  color:
                                                      const Color(0xFFC3D61B),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                CustomText(
                                                  text:
                                                      'Antes \$${ProductCubit.get(context).productList[index]['price'] == null ? 'Nooooooo' : ProductCubit.get(context).productList[index]['price'].toString()}',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10.sp,
                                                  color:
                                                      const Color(0xFF53714B),
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
                              );
                            }),
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: ColorManager.primaryColor,
                      ),
                    );
            },
            listener: (context, state) {}),
        Padding(
          padding: EdgeInsets.only(left: 20.w, top: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'Hamburgers',
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
                                            image: AssetImage(image2[index])),
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
                                        position: badge.BadgePosition.topStart(
                                            top: 1, start: -9),
                                        badgeColor: Colors.red,
                                        child: CircleAvatar(
                                          radius: 40.r,
                                          backgroundColor: Colors.transparent,
                                          child: Image(
                                              image: AssetImage(image2[index])),
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
                                      backgroundColor: const Color(0xFF2BBEBA),
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
      ],
    );
  }
}
