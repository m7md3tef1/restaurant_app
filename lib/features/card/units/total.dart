part of'../view.dart';

class Total extends StatelessWidget {
   Total(this.P,this.totalprice, {super.key});
var totalprice;
var P;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              CustomText(
                text: 'Total a cobrar:',
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: ColorManager.primaryColor,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomText(
                text: 'pago con tarjeta',
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xFFD0E612),
              ),
            ],
          ),
          CustomText(
            text:
            '\$${totalprice == 0 ? P.toString() : totalprice.toString()}',
            space: 1.5,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
            color: ColorManager.primaryColor,
          )
        ],
      ),
    );
  }
}
