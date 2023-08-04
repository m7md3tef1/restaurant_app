part of '../view.dart';

class BTN extends StatelessWidget {
  const BTN({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
