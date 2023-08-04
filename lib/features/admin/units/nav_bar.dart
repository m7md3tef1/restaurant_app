part of '../view.dart';


class BottomBar extends StatelessWidget {
  BottomBar({super.key}) ;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AdminCubit, HomeStates>(
      listener: (_, s) {},
      builder: (context, state) => BottomNavigationBar(
          currentIndex: AdminCubit.get(context).currentIndex,
            onTap: (i) {
              index = i;
              AdminCubit.get(context).changeBottom(i, context);

            },
            showUnselectedLabels: true,
            selectedLabelStyle:  TextStyle(
                color: AdminCubit.get(context).color,
                fontWeight: FontWeight.w500,
                fontSize: 16),
            unselectedLabelStyle:  TextStyle(
                color: AdminCubit.get(context).color2 ,fontSize: 13, fontWeight: FontWeight.w400),
            unselectedItemColor: AdminCubit.get(context).color2,
            selectedItemColor: AdminCubit.get(context).color,
          selectedIconTheme:  IconThemeData(color:AdminCubit.get(context).color ),
          unselectedIconTheme:  IconThemeData(color: AdminCubit.get(context).color2 ),
            items: const [
              BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.create_new_folder_outlined),
                  label: 'Create Product'),
              BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon:  Icon(Icons.delete),
                  label: 'Delete Product'),

            ]),
    );

  }
}
