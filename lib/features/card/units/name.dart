part of'../view.dart';


class Name extends StatelessWidget {
  const Name({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
                InkWell(
                  onTap: (){
                    MagicRouter.pop();
                  },
                  child: CircleAvatar(
                    radius: 18.r,
                    backgroundColor: ColorManager.primaryColor,
                    child: const Center(
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
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
      ],
    );
  }
}
