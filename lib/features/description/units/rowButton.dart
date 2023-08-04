part of'../view.dart';

class RowButton extends StatelessWidget {
  const RowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 20.w, right: 20.w, top: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              CustomText(
                text: 'Elige complemento',
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: ColorManager.primaryColor,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomText(
                  text: 'Selecciona hasta dos opciones',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorManager.primaryColor),
            ],
          ),
          Container(
            height: 50.h,
            width: 120.w,
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(10.r)),
            child: Center(
              child: CustomText(
                text: 'Obligatorio',
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
                color: ColorManager.whiteColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
