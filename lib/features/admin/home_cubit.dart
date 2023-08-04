import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resturant_app/features/admin/view.dart';

import '../../core/data/api/api.dart';
import '../../core/data/models/CreatePro.dart';
import 'home_state.dart';

class AdminCubit extends Cubit<HomeStates> {
  AdminCubit() : super(HomeLayoutLoading());

  static AdminCubit get(context) => BlocProvider.of(context);
  var image;
  var img1;
  int currentIndex = 0;
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerSize = TextEditingController();
  TextEditingController controllerDes = TextEditingController();

  List<Widget> bottomScreens = [
    const CreateProduct(),
    const DeleteProduct(),
  ];
  var color = const Color(0xFFC3D61B);
  var color2 = Colors.grey;
  void changeBottom(int index, context) {
    currentIndex = index;
    if (currentIndex == 0) const CreateProduct();
    if (currentIndex == 1) DeleteProduct();

    emit(ChangeBottomNavState());
  }

  List productList = [];
  addProduct(CreatePro model) {
    emit(CheckGetProductLoading());
    Api()
        .postHttp(url: 'products/', data: model.toJson())
        .then((value) => {
              print('..................................'),
              print(value),
              //  productList = value,
              emit(CreateProductsSuccess(value)),
      // showToast(
      //     msg: 'Add Product Success', state: ToastedStates.SUCCESS),
      //         print('Get My Product Response'),
              // print(productList.length),
            })
        .onError((error, stackTrace) => {
              emit(CreateProductsFailed(error.toString())),
      // showToast(
      //     msg: 'Add Product Failed$error', state: ToastedStates.ERROR),
              print(error),
            });
  }
  getProduct() {
    emit(GetProductLoading());
    Api()
        .getHttp(url: 'products')
        .then((value) => {
      print('..................................'),
      print(value),
      productList = value,
      emit(GetProductsSuccess(value)),
      // showToast(
      //     msg: 'Get Product Success', state: ToastedStates.SUCCESS),
      print('Get My Product Response'),
      print(productList.length),
    })
        .onError((error, stackTrace) => {
      emit(GetProductsFailed(error.toString())),
      // showToast(
      //     msg: 'Get Product Failed$error', state: ToastedStates.ERROR),
      print(error),
    });
  }
  
  deleteProduct(productId,context){
    emit(DeleteProductLoading());
    Api().deleteHttp(url: 'products/$productId').then((value) =>{
      // print(value),
      print("success"),
      getProduct(),
      print('get'),
      emit(DeleteProductsSuccess()),
      Navigator.pop(context),

      print('get'),
      // showToast(
      //     msg: 'Delete Success', state: ToastedStates.SUCCESS),
    })
        .onError((error, stackTrace) => {
      emit(DeleteProductsFailed(error.toString())),
      // showToast(
      //     msg: 'Delete Product Failed$error', state: ToastedStates.ERROR),
      print(error),
    });
  }

  pickFromCamera(BuildContext context) async {
    var img = await ImagePicker().pickImage(source: ImageSource.camera);
    image = File(img!.path);

    print(img1);
    Navigator.of(context).pop();
    print(image);
    print(image
        .toString()
        .split('/data/user/0/com.example.admin_resturant/cache'));

    // String fileName = image != null ? image!.path.split('/').last : '';
    // img1 = MultipartFile.fromFile(image!.path, filename: fileName);
    // print('mmmmmmmmmmm');
    // print(img1.toString());
    print('ccccccccccccc');
    emit(ImageCamera());
  }

  pickFromGallery(BuildContext context) async {
    var img = await ImagePicker().pickImage(source: ImageSource.gallery);
    image = File(
      img!.path,
    );
    Navigator.of(context).pop();
    print('pppppppppppppppppppppppp');

    print(image);
    emit(ImageGallery());
  }
}
