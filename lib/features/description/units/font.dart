part of'../view.dart';

class Font extends StatefulWidget {
   const Font({super.key});

  @override
  State<Font> createState() => _FontState();
}

class _FontState extends State<Font> {
  int index = 1;

  Color col = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          padding: EdgeInsets.only(
              left: 20.w, right: 20.w, top: 35.h),
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
      ],
    );
  }
}
