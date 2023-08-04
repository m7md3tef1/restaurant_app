part of'../view.dart';
class BTN extends StatefulWidget {
   BTN({this.counter,this.price,this.totalprice});
var counter;
var totalprice;
var price;
  @override
  State<BTN> createState() => _BTNState();
}

class _BTNState extends State<BTN> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            //   useRootNavigator:true,
              showDragHandle: true,
              isScrollControlled: true,
              context: context,
              builder: (context) => const CardScreen());
        },
        child: Container(
          width: 1.sw,
          height: 70.h,
          decoration: BoxDecoration(
              color: const Color(0xFF53714B),
              borderRadius: BorderRadius.circular(10.r)),
          child: Row(
            children: [
              SizedBox(
                width: 30.w,
              ),
              Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                    color: const Color(0xFFC3D61B),
                    borderRadius: BorderRadius.circular(8.r)),
                child: Center(
                  child: CustomText(
                    text: widget.counter.toString(),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.whiteColor,
                  ),
                ),
              ),
              SizedBox(width: 40.w),
              CustomText(
                text: 'Mi cesta',
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                color: Colors.white,
              ),
              SizedBox(width: 40.w),
              CustomText(
                text: '|',
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
                color: Colors.white,
              ),
              SizedBox(width: 40.w),
              CustomText(
                text: widget.totalprice == null
                    ? '\$ ${widget.price.toString()}'
                    : '\$ ${widget.totalprice.toString()}',
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
