part of '../view.dart';

class OnDrawer extends StatelessWidget {
  OnDrawer({Key? key, this.inHome = false}) : super(key: key);
  bool inHome = false;
  Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('Do You want to log out?'),
            actions: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 35.sp,
                    ),
                    Expanded(
                        child: CustomButton(
                            function: () => Navigator.pop(context, false),
                            text: 'No',
                            height: 37.sp,
                            font: 15)),
                    SizedBox(
                      width: 35.sp,
                    ),
                    Expanded(
                        child: CustomButton(
                      function: () => MagicRouter.navigateTo(Login()),
                      text: 'Yes',
                      height: 37.sp,
                      font: 15,
                    )),
                    SizedBox(
                      width: 35.sp,
                    ),
                  ],
                ),
              ),
            ],
          ));
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: const [
                        Text(
                          'Hello',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CustomRowDrawer(
              text: 'Home',
              isHome: true,
              icon: Icons.home,
              inHome: inHome,
              navigatename: const Home(),
            ),

          ],
        ),
      ),
    );
  }
}
