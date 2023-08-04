import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_app/core/color_manager/color_manager.dart';
import 'package:resturant_app/features/admin/home_cubit.dart';
import 'package:resturant_app/features/home/cubit/getProduct_cubit.dart';
import 'package:resturant_app/features/home/view.dart';

import '../../../core/router/router.dart';
import '../view.dart';
class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   AdminCubit.get(context).getProduct();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
              child: Center(
                child: SizedBox(
                  height: .35.sh,
                  width: .5.sw,
                  child: InkWell(
                    onTap: () {
                      MagicRouter.navigateTo(const HomeView());
                    },
                    child: const Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 80,
                          backgroundImage: AssetImage('assets/images/100.jpg'),
                        ),
                        Text(
                          'Admin',
                          style: TextStyle(color: ColorManager.primaryColor, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              )),
          Container(
              child: Center(
                child: SizedBox(
                  height: .35.sh,
                  width: .5.sw,
                  child: InkWell(
                    onTap: () {
                     MagicRouter.navigateTo(const Home());
                    },
                    child: const Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 80,
                          backgroundImage: AssetImage('assets/images/user.png'),
                        ),
                        Text(
                          'User',
                          style: TextStyle(color: ColorManager.primaryColor, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
