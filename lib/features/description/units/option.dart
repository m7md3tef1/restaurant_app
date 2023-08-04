part of'../view.dart';

class Option extends StatefulWidget {
  const Option({super.key});

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  var value;
  var gvalue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 20.w, right: 20.w, top: 35.h, bottom: 20.h),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius:
                  BorderRadius.circular(10.r)),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: '   Option 1',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    color: ColorManager.primaryColor,
                  ),
                  Radio(
                      value: "Option 1",
                      groupValue: gvalue,
                      hoverColor: ColorManager.primaryColor,
                      activeColor:
                      ColorManager.primaryColor,
                      focusColor: ColorManager.primaryColor,
                      onChanged: (val) {
                        setState(() {
                          gvalue = val.toString();
                        });
                      }),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius:
                  BorderRadius.circular(10.r)),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: '   Option 2',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    color: ColorManager.primaryColor,
                  ),
                  Radio(
                      value: "Option 2",
                      groupValue: gvalue,
                      activeColor:
                      ColorManager.primaryColor,
                      focusColor: ColorManager.primaryColor,
                      onChanged: (val) {
                        setState(() {
                          gvalue = val.toString();
                        });
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
