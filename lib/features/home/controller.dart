import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/features/home/states.dart';

import '../../core/data/api/api.dart';
import '../../core/data/local/cacheHelper.dart';
import '../../core/keys/keys.dart';


class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeLayoutLoading());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    // const HomeScreen(),
    // const SearchView(),
    // const LoadsView(),
    // const VehiclesView(),
    //  JobsView()
  ];

  void changeBottom(int index, context) {
    currentIndex = index;
    if (currentIndex == 3) //VehiclesCubit.get(context).getVehicleCubit(context,self: 0);
    if (currentIndex == 2) {
    //  LoadsCubit.get(context).getLoad(self: 0, isFilter: false);
    }
    if (currentIndex == 1) //ProductsCubit.get(context).getProduct();
    if (currentIndex == 4) //JopCubit.get(context).getJops(isFilter: false);

    emit(ChangeBottomNavState());
  }

}
