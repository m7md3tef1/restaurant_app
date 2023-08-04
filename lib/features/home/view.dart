import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_app/core/color_manager/color_manager.dart';
import 'package:resturant_app/features/description/view.dart';

import 'package:resturant_app/features/home/states.dart';
import 'package:resturant_app/widgets/widgets/custom_text.dart';
import '../../core/data/models/ProductApi.dart';
import '../../core/router/router.dart';
import '../../widgets/widgets/custom_button.dart';
import '../../widgets/widgets/custom_rowdrawer.dart';
import '../auth/login.dart';
import 'package:badges/badges.dart' as badge;
import 'controller.dart';
import 'cubit/getProduct_cubit.dart';
import 'cubit/getProduct_state.dart';

part 'units/drawer.dart';
part 'units/nav_bar.dart';
part 'units/btn.dart';
part 'units/info.dart';
part 'units/textformfield.dart';
part 'units/listview.dart';
part 'units/products.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BTN(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Column(children: [
              const Info(),
              const TextForm(),
              const Listview(),
              Products()
            ]),
          ),
        ),
      ),
    );
  }
}
