part of '../login.dart';

class ButtonLogin extends StatelessWidget {
  ButtonLogin(this.emailController, {super.key});
  var emailController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 90.h,
        ),
        Column(
          children: [
            CustomButton(
              width: 320.w,
              height: 65.h,
              text: 'LOG IN',
              colortext: Colors.white,
              function: () {
                AuthCubit.get(context)
                    .signIn(Users(email: emailController), context);

                // MagicRouter.navigateTo(Home());
              },
              color: const Color(0xFF53714B),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: 'Do not have an account?',
                  color: const Color(0xFF53714B),
                  fontWeight: FontWeight.w300,
                  fontSize: 18.sp,
                ),
                SizedBox(
                  width: 10.w,
                ),
                InkWell(
                  onTap: () {
                    MagicRouter.navigateTo(SignUp());
                  },
                  child: CustomText(
                    text: 'REGISTER',
                    color: const Color(0xFF53714B),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
