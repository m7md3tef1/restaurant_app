part of '../view.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
          height: 60.h,
        ),
        Image(
          image: const AssetImage(AppImages.intro),
          height: 300.h,
          width: 300.w,
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}

