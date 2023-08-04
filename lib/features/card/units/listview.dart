part of '../view.dart';

class Listview extends StatefulWidget {
  const Listview({super.key});

  @override
  State<Listview> createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  List image = [
    'assets/images/029-burger.png',
    'assets/images/Group 2759.png',
    'assets/images/020-donut.png',
    'assets/images/024-soup.png',
    'assets/images/012-fried chicken.png'
  ];
  List name = ['Burger', 'Carne', 'Postres', 'Sopa', 'Sopa'];
  List color = [
    const Color(0xFFCAE9F7),
    const Color(0xFFCAF7D6),
    const Color(0xFFF7D0CA),
    const Color(0xFFF1ECCA),
    const Color(0xFFCCCAF1),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.r),
              child: CustomText(
                align: TextAlign.start,
                text: 'Busca algo más',
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                color: ColorManager.primaryColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h,),
        Container(
          height: 130.h,
          width: 1.sw,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: image.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 45.r,
                      backgroundColor: color[index],
                      child: Center(
                        child: Image(
                            image: AssetImage(image[index])),
                      ),
                    ),
                    CustomText(
                      text: 'Burger',
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: ColorManager.primaryColor,
                    )
                  ],
                ),
              )),
        ),
        SizedBox(
          height: 80.h,
          child: const Divider(thickness: .9),
        ),
      ],
    );
  }
}
