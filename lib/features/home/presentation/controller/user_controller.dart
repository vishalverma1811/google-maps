import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/features/home/data/model/user_model.dart';
import 'package:google_maps/features/home/data/repo/user_repo.dart';
import 'package:google_maps/uses_cases/app_exception.dart';

class UserController extends GetxController{
  final api = UserRepo();
  final RxBool isUserLoading = false.obs;
  final RxBool isApiDone = false.obs;
  late Rxn<UserModel> user = Rxn<UserModel>();
  RxList<UserModel> users = <UserModel>[].obs;

  Future<void> getAllUsers() async{
    isUserLoading.value = true;
    isApiDone.value = true;


    await api.getUser().then((value) {
      isUserLoading.value = false;
      isApiDone.value = false;
      users.value.addAll(value);
    }).onError((error, stackTrace){
      isUserLoading.value = false;
      isApiDone.value = false;
      if(error is InternetException){
        SnackBar(
          content: Text('No Internet, Please check your internet service!!'),
          duration: Duration(seconds: 3),
        );
      }
    });
  }
}