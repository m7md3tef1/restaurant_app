import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:image_picker/image_picker.dart';
import 'package:resturant_app/core/data/models/Users.dart';
import 'package:resturant_app/features/admin/units/admin_screen.dart';
import 'package:resturant_app/features/auth/login.dart';

import '../../../core/data/api/api.dart';

import '../../../core/data/local/cacheHelper.dart';
import '../../../core/dialoges/toast.dart';
import '../../../core/keys/keys.dart';
import '../../../core/router/router.dart';
import '../../home/view.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthLoading());

  static AuthCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity = Connectivity();
  TextEditingController emailController = TextEditingController();
  var image;
  var id;
  List<dynamic> userList = [];
var login;
  // var fireAuth = FirebaseAuth.instance;
  var googleSignIn = GoogleSignIn(scopes: ['email']);

  signIn(userModel, context) async {
    var response =
        Api().postHttp(url: 'users/is-available', data: userModel.toJson());
    // print(response);
    print('login response');
    emit(SignInLoading());
    response
        .then((value) => {
              print('//////////////////////////////'),
              print('rolllllle'),
              //   print(email),
              emit(SignInSuccess()),
              for (int i = 0; i < userList.length; i++)
                {
                  if (emailController.text == userList[i]["email"])
                    {
                      id = --userList[i]["id"],
                      print(id.toString()),
                      //  print(userList[id]["role"].toString()),
                      // print(userList[id]["name"].toString()),
                    }
                },
              if (userList[id]["role"] == "customer")
                {
                  // print(userList[id]["role"].toString()),
                  // login =  CacheHelper.putString(SharedKeys.customer, value['customer']),
                  CacheHelper.putBool(SharedKeys.customer, true),
                  MagicRouter.navigateTo(const Home()),
                  showToast(msg: 'Welcome Admin ', state: ToastedStates.SUCCESS)
                }
              else if (userList[id]["role"] == "admin")
                {
                  // login =  CacheHelper.putString(SharedKeys.customer, value['admin']),
                  CacheHelper.putBool(SharedKeys.admin, true),
                  // print(userList[--id]["role"].toString()),
                  MagicRouter.navigateTo(const AdminScreen()),
                },
              showToast(
                  msg: 'login Successfully', state: ToastedStates.SUCCESS),
            })
        .onError((error, stackTrace) => {
              emit(SignInFailed()),
              showToast(msg: error.toString(), state: ToastedStates.ERROR),
              print('Failed'),
              print(error),
            });
  }

  getUsers() {
    emit(GetUsersLoading());
    Api()
        .getHttp(url: 'users')
        .then((value) => {
              print('..................................'),
              print(value),
              //  print(value[3]['role']),

              userList = value,
              emit(GetUsersSuccess(value)),
              print('Get My User Response'),
              // print(productList.length),
            })
        .onError((error, stackTrace) => {
              emit(GetUsersFailed(error.toString())),
              print(error),
            });
  }

  signUp(userModel) {
    var response = Api().postHttp(url: 'users', data: userModel.toJson());
    emit(SignUpLoading());
    print(response);
    response
        .then((value) => {
              //    print(value),
              emit(SignUpSuccess()),
              MagicRouter.navigateTo(Login()),
              showToast(
                  msg: 'Sign up successfully', state: ToastedStates.SUCCESS),
            })
        .onError((error, stackTrace) => {
              emit(SignUpFailed()),
              showToast(msg: error.toString(), state: ToastedStates.ERROR),
              print(error),
            });
  }

  // signInWithGoogle() async {
  //   emit(SignInGoogleLoading());
  //   var googleUser = await googleSignIn.signIn();
  //
  //   var getIds = await googleUser?.authentication;
  //
  //   AuthCredential googleCredential = GoogleAuthProvider.credential(
  //     accessToken: getIds?.accessToken,
  //     idToken: getIds?.idToken,
  //   );
  //   await fireAuth
  //       .signInWithCredential(googleCredential)
  //       .then((value) => {
  //             emit(SignInGoogleSuccess()),
  //             MagicRouter.navigateTo(Login()),
  //             showToast(
  //                 msg: 'Sign In Google Successfully',
  //                 state: ToastedStates.SUCCESS),
  //           })
  //       .onError((error, stackTrace) => {
  //             emit(SignUpFailed()),
  //             showToast(msg: error.toString(), state: ToastedStates.ERROR),
  //             print(error),
  //           });
  // }

  pickFromCamera(BuildContext context) async {
    XFile? img = await ImagePicker().pickImage(source: ImageSource.camera);
    image = File(img!.path);
    Navigator.of(context).pop();
    print(image);
    emit(ImageCamera());
  }

  pickFromGallery(BuildContext context) async {
    XFile? img = await ImagePicker().pickImage(source: ImageSource.gallery);
    image = File(
      img!.path,
    );
    Navigator.of(context).pop();
    print('pppppppppppppppppppppppp');

    print(image);
    emit(ImageGallery());
  }
}
