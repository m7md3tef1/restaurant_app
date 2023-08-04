part of '../view.dart';

class Details extends StatefulWidget {
  Details(
      {required this.counter,
      this.price,
      this.totalprice,
      this.name,}
      );
  int counter;
  var totalprice;
  var price;
  var name;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
 void _incrementCounter() {
    setState(() {
      widget.counter++;
      _count();
    });
  }

  void _count() {
    setState(() {
      widget.counter * widget.price!;
      widget.totalprice = widget.counter * widget.price!;
      print(widget.counter * widget.price!);
    });
  }

  void _decrementCounter() {
    setState(() {
      widget.counter == 1 ? 1 : widget.counter--;
      _count();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                text: widget.name,
                fontSize: 25.sp,
                fontWeight: FontWeight.w400,
                color: ColorManager.primaryColor,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: '\$ ${widget.price!.toString()}',
                fontSize: 22.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF0D1863),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _decrementCounter();
                        // _count();
                      });
                    },
                    child: Container(
                      height: 36.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                          color: ColorManager.whiteColor,
                          border: Border.all(color: ColorManager.greyColor),
                          borderRadius: BorderRadius.circular(30.r)),
                      child: Center(
                        child: CustomText(
                          text: '-',
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  CustomText(
                    text: '  ${widget.counter.toString()}  ',
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.primaryColor,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _incrementCounter();
                        //_count();
                      });
                    },
                    child: Container(
                      height: 36.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                          color: ColorManager.primaryColor,
                          borderRadius: BorderRadius.circular(30.r)),
                      child: Center(
                        child: CustomText(
                          text: '+',
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.whiteColor,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
