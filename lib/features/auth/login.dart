import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart'
    as v;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_app/core/app_images/app_images.dart';
import 'package:resturant_app/core/router/router.dart';
import 'package:resturant_app/features/auth/sign_up.dart';
import 'package:resturant_app/widgets/widgets/custom_text.dart';
import '../../widgets/widgets/custom_button.dart';
import '../../widgets/widgets/custom_text_field.dart';
import '../home/view.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return v.KeyboardVisibilityBuilder(
      builder: (context, visible) => Padding(
        padding: EdgeInsets.only(bottom: 0),
        child: Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: InkWell(
                onTap: (){
                  FocusScope.of(context).unfocus();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 30.h,),
                         Image(image: AssetImage(AppImages.login,),height: 70.h,width: 70.w,),
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
                        SizedBox(
                          height: 95.h,
                        ),
                        CustomTextField(
                          name: 'EMAIL',
                          hintText: ' psilva.ericka@gmail.com',
                          suffixIcon:Icon( Icons.email),
                        ),
                        SizedBox(height: 30.h,),
                        CustomTextField(
                          name: 'PASSWORD',
                          hintText: '   * * * * * * * *',
                          suffixIcon: const Image(image: AssetImage('assets/images/key.png'),color: Colors.grey,),
                        ),


                      ],
                    ),
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
                            MagicRouter.navigateTo(Home());
                          },
                          color: const Color(0xFF53714B),
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: 'Do not have an account?',
                              color: Color(0xFF53714B),
                              fontWeight: FontWeight.w300,
                              fontSize: 18.sp,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            InkWell(
                              onTap: (){
                                MagicRouter.navigateTo(SignUp());
                              },
                              child: CustomText(

                                text: 'REGISTER',
                                color: Color(0xFF53714B),
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
