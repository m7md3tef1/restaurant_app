part of'../login.dart';

class ImageLogo extends StatelessWidget {
  const ImageLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30.h,),
        Image(image: const AssetImage(AppImages.login,),height: 70.h,width: 70.w,),
        SizedBox(
          height: 15.h,
        ),
        CustomText(
          text: 'Welcome to VIVEE',
          color: const Color(0xFF53714B),
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomText(
          text: 'helping you to find the best food',
          color: const Color(0xFFB8B6B6),
          fontSize: 16.sp,
          fontWeight: FontWeight.w300,
        ),
      ],
    );
  }
}
