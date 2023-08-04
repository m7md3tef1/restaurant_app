
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/color_manager/color_manager.dart';
import '../../core/data/models/CreatePro.dart';
import '../../widgets/widgets/custom_button.dart';
import '../../widgets/widgets/custom_text_field2.dart';
import 'home_cubit.dart';
import 'home_state.dart';

part 'units/create_product.dart';
part 'units/nav_bar.dart';
part 'units/delete_product.dart';
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: BottomBar(),
      body:  BlocConsumer<AdminCubit, HomeStates>(
        listener: (context, s) {},
        builder: (context, s) {
          return AdminCubit.get(context)
              .bottomScreens[AdminCubit.get(context).currentIndex];
        },
      ),
    );
  }
}
