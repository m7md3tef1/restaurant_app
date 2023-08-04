import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart'
    as v;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_app/core/app_images/app_images.dart';
import 'package:resturant_app/core/data/models/Users.dart';
import 'package:resturant_app/features/auth/domain/auth_states.dart';
import 'package:resturant_app/features/auth/units/profile_image.dart';

import '../../widgets/widgets/custom_button.dart';

import '../../widgets/widgets/custom_text.dart';
import '../../widgets/widgets/custom_text_field.dart';
import 'domain/auth_cubit.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return v.KeyboardVisibilityBuilder(
        builder: (context, visible) => Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Scaffold(
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: InkWell(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                      },
                      child: BlocConsumer<AuthCubit, AuthStates>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Container(
                                    color: const Color(0xFF53714B),
                                    height: 80.h,
                                    width: 1.sw,
                                    child: Center(
                                      child: Text(
                                        'REGISTER',
                                        style: TextStyle(
                                            letterSpacing: 5.5,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22.sp),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  CustomText(
                                    text: 'New here?',
                                    color: const Color(0xFF53714B),
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  CustomText(
                                    text: 'Fill in the fields and join us!',
                                    color: const Color(0xFF53714B),
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  ProfileImage(AuthCubit.get(context).image),
                                  CustomTextField(
                                    controller: nameController,
                                    name: 'Name',
                                    hintText: ' psilva',
                                    suffixIcon: const Icon(Icons.abc),
                                  ),
                                  CustomTextField(
                                    controller: emailController,
                                    name: 'EMAIL',
                                    hintText: ' psilva.ericka@gmail.com',
                                    suffixIcon: const Icon(Icons.email),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  CustomTextField(
                                    controller: passwordController,
                                    name: 'PASSWORD',
                                    hintText: '   * * * * * * * *',
                                    suffixIcon: const Image(
                                      image:
                                          AssetImage('assets/images/key.png'),
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              Column(
                                children: [
                                  CustomButton(
                                    width: 350.w,
                                    height: 68.h,
                                    text: 'REGISTER',
                                    colortext: Colors.white,
                                    function: () {
                                      AuthCubit.get(context).signUp(Users(
                                          password:
                                              passwordController.text.trim(),
                                          email: emailController.text.trim(),
                                          role: 'admin',
                                          avatar:
                                              'https://www.bing.com/ck/a?!&&p=a09e14b71afc1116JmltdHM9MTY5MDA3MDQwMCZpZ3VpZD0xZWUyMTM4My01N2RjLTZlM2UtMTJhZS0wMmY4NTZhMDZmZTkmaW5zaWQ9NTYwOA&ptn=3&hsh=3&fclid=1ee21383-57dc-6e3e-12ae-02f856a06fe9&u=a1L2ltYWdlcy9zZWFyY2g_cT1pbWFnZXMmRk9STT1JUUZSQkEmaWQ9MkY1OUIxRUZCRUM0MjMzQTExMjMwMkUxRkI3NTdEQzg3NDY3MUZCNA&ntb=1',
                                          name: nameController.text.trim()));
                                    },
                                    color: const Color(0xFF53714B),
                                  ),
                                  SizedBox(
                                    height: 25.h,
                                  ),
                                  Center(
                                    child: CustomText(
                                      text: 'OR',
                                      color: const Color(0xFF53714B),
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25.h,
                                  ),
                                  CustomButton(
                                    width: 350.w,
                                    height: 68.h,
                                    image: const AssetImage(AppImages.face),
                                    text: 'Register with Facebook',
                                    colortext: Colors.white,
                                    function: () {},
                                    color: const Color(0xFF3B5998),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  CustomButton(
                                    width: 350.w,
                                    image: const AssetImage(AppImages.google),
                                    height: 68.h,
                                    text: 'Register with Google',
                                    colortext: const Color(0xFF34302D),
                                    function: () async{
                                      // AuthCubit.get(context).signInWithGoogle();
                                    },
                                    color: Colors.white,
                                    color2: Colors.grey,
                                  ),
                                ],
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
