part of'../view.dart';
class Info extends StatefulWidget {
   const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  var selectedValue;

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          value: "Peru 1",
          child: CustomText(
            text: "Peru 1",
            color: const Color(0xFF53714B),
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          )),
      DropdownMenuItem(
          value: "Peru 2",
          child: CustomText(
              text: "Peru 2",
              color: const Color(0xFF53714B),
              fontWeight: FontWeight.bold,
              fontSize: 20.sp)),
      DropdownMenuItem(
          value: "Peru 3",
          child: CustomText(
              text: "Peru 3",
              color: const Color(0xFF53714B),
              fontWeight: FontWeight.bold,
              fontSize: 20.sp)),
      DropdownMenuItem(
          value: "Peru 4",
          child: CustomText(
              text: "Peru 4",
              color: const Color(0xFF53714B),
              fontWeight: FontWeight.bold,
              fontSize: 20.sp)),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: EdgeInsets.only(
          left: 20.w, right: 20.w, top: 40.h, bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.menu,
                color: Color(0xFF53714B),
              ),
              SizedBox(
                width: 20.w,
              ),
              CustomText(
                text: 'Ectraga en :   ',
                fontSize: 20.sp,
                color: Color(0xFF53714B),
              ),
              DropdownButton(
                value: selectedValue,
                items: dropdownItems,
                onChanged: (Object? value) {
                  setState(() {
                    selectedValue = value!;
                  });
                },
              ),
            ],
          ),
          const CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Image(
                image: AssetImage('assets/images/circle.png'),
              )),
        ],
      ),
    );
  }
}
