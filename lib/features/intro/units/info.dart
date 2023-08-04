part of '../view.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CustomText(
          width: 300.5.w,
          text: 'WE WILL FIND THE BEST!',
          color: const Color(0xFF53714B),
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
          height: 5.h,
        ),
        CustomText(
          width: 300.5.w,
          fontWeight: FontWeight.w200,
          text:
          'find the nearest places with the best organic foods and make your life healthier!',
          color: const Color(0xFF53714B),
          fontSize: 20.sp,
          align: TextAlign.center,
        )
      ],
    );
  }
}
