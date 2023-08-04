import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_app/core/color_manager/color_manager.dart';

import '../../features/auth/domain/auth_cubit.dart';

class PickImageDialoge extends StatelessWidget {
  const PickImageDialoge({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text(
        ('Select...'),
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      children: [
        SimpleDialogOption(
            child: Row(
              children: [
                const Icon(
                  Icons.camera_alt_outlined,
                  size: 30,
                ),
                SizedBox(
                  width: 30.w,
                ),
                const Text(
                  ('Pick From Camera'),
                  style: TextStyle(
                      color: ColorManager.primaryColor,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            onPressed: () {
              AuthCubit.get(context).pickFromCamera(context);
            }),
        SimpleDialogOption(
            child: Row(
              children: [
                const Icon(
                  Icons.image_outlined,
                  size: 30,
                ),
                SizedBox(
                  width: 30.w,
                ),
                const Text(
                  ('Pick From Gallery'),
                  style: TextStyle(
                      color: ColorManager.primaryColor,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            onPressed: () {
              AuthCubit.get(context).pickFromGallery(context);
            }),
      ],
    );
  }
}
