part of '../view.dart';

class Listview extends StatefulWidget {
  const Listview({super.key});

  @override
  State<Listview> createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  int index = 1;
  Color col = Colors.white;
  var i = 0;
  @override
  void initState() {
    ProductCubit.get(context).productList.length;
    ProductCubit.get(context).getProduct();
    // print(  ProductCubit.get(context).productList[0]['category']['image'].toString());
    print('dataaa');
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, GetProductStates>(
      listener: (state, index) {},
      builder: (state, index) {
        return  Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, top: 25.h),
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
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                    child: Container(
                      height: 160.h,
                      width: 1.sw,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: ProductCubit.get(context).productList.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    i = index;
                                  });
                                },
                                child: Container(
                                  color: i == index
                                      ? const Color(0xFF53714B)
                                      : col,
                                  width: 85.w,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 70.h,
                                        width: 85.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                        ),
                                        child: Image(
                                          image: NetworkImage(
                                              ProductCubit.get(context)
                                                  .productList[index]
                                                      ['category']['image']
                                                  .toString()),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(2.r),
                                        child: Container(
                                          height: 80.h,
                                          width: 80.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            // color: i == index ? const Color(0xFF53714B) : col,
                                          ),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              FittedBox(
                                                child: CustomText(
                                                  text:
                                                      ProductCubit.get(context)
                                                          .productList[index]
                                                              ['category']
                                                              ['name']
                                                          .toString(),
                                                  color: i == index
                                                      ? Colors.white
                                                      : const Color(0xFF707070),
                                                  fontSize: 18.sp,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
