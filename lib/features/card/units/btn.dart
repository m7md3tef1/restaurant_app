part of'../view.dart';
class BTN extends StatefulWidget {
   BTN({this.totalcounter,this.C,this.totalprice,this.P});
var totalcounter;
var C;
var totalprice;
var P;
  @override
  State<BTN> createState() => _BTNState();
}

class _BTNState extends State<BTN> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                  text: widget.totalcounter == 0
                      ? widget.C.toString()
                      : widget.totalcounter.toString(),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.whiteColor,
                ),
              ),
            ),
            SizedBox(width: 80.w),
            CustomText(
              text: 'Ir a pagar',
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
              color: Colors.white,
            ),
            SizedBox(width: 20.w),
            SizedBox(width: 40.w),
            CustomText(
              space: 1.5,
              text:
              '\$${widget.totalprice == 0 ? widget.P.toString() : widget.totalprice.toString()}',
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
