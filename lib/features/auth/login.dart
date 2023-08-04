import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart'
    as v;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_app/core/app_images/app_images.dart';
import 'package:resturant_app/core/router/router.dart';
import 'package:resturant_app/features/auth/sign_up.dart';
import 'package:resturant_app/widgets/widgets/custom_text.dart';
import '../../core/data/models/Users.dart';
import '../../widgets/widgets/custom_button.dart';
import '../../widgets/widgets/custom_text_field.dart';
import '../home/view.dart';
import 'domain/auth_cubit.dart';

part 'units/image.dart';
part 'units/button.dart';

// ignore: must_be_immutable
class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
@override
  void initState() {

    // TODO: implement initState

    AuthCubit.get(context).userList;
    AuthCubit.get(context).getUsers();
     print(AuthCubit.get(context).id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return v.KeyboardVisibilityBuilder(
      builder: (context, visible) => Padding(
        padding: EdgeInsets.only(bottom: 0),
        child: Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: InkWell(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const ImageLogo(),
                        SizedBox(
                          height: 95.h,
                        ),
                        CustomTextField(
                          controller: AuthCubit.get(context).emailController,
                          name: 'EMAIL',
                          hintText: ' psilva.ericka@gmail.com',
                          suffixIcon: Icon(Icons.email),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        CustomTextField(
                          controller: passwordController,
                          name: 'PASSWORD',
                          hintText: '   * * * * * * * *',
                          suffixIcon: const Image(
                            image: AssetImage('assets/images/key.png'),
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                     ButtonLogin(AuthCubit.get(context).emailController.text.trim().toString()),
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
