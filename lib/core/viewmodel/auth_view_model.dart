import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/UserData.dart';
import 'package:ecommerce_app/view/Admin/AdminScreen.dart';
import 'package:ecommerce_app/view/Admin/OwnerScreen.dart';
import 'package:ecommerce_app/view/home/home_screen.dart';
import 'package:ecommerce_app/view/shared/components/components.dart';
import 'package:ecommerce_app/view/shared/components/constant.dart';
import 'package:ecommerce_app/view/shared/network/local/cache_helper.dart';
import 'package:ecommerce_app/view/shared/style/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthViewModel extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void signInWithEmailandPass(
      {
        required String email,
        required String pass,
      }
      ) async{
   try {
  await auth.signInWithEmailAndPassword(
    email: email,
    password: pass
  ).then((value) {
    getUserData(value.user!.uid);
    CacheHelper.saveData(key: 'uId', value: value.user!.uid).then((value){
      uId = value.toString();
      if(userModell!.statusAccount == 'User'){
        Get.snackbar('Sign In Success', 'Enjoy!',snackPosition: SnackPosition.BOTTOM);
        Get.offAll(HomeScreen());
      }else if(userModell!.statusAccount == 'Admin'){
        Get.snackbar('Sign In Success', 'Enjoy!',snackPosition: SnackPosition.BOTTOM);
        Get.offAll(AdminScreen());
      }else if(userModell!.statusAccount == 'Owner'){
        Get.snackbar('Sign In Success', 'Enjoy!',snackPosition: SnackPosition.BOTTOM);
        Get.offAll(OwnerScreen());
      }else{

      }
    });
  });
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    Get.snackbar('Sign Up Error', 'No user found for that email.',snackPosition: SnackPosition.BOTTOM);
  } else if (e.code == 'wrong-password') {
    Get.snackbar('Sign Up Error', 'Wrong password provided for that user.',snackPosition: SnackPosition.BOTTOM);
  }
}
  }

  void signUpWithEmailandPass(
      {
        required String email,
        required String name,
        required String pass,
      }
      ) async{
   try {
  await auth.createUserWithEmailAndPassword(
    email: email,
    password: pass,
  ).then((value) {
    setDataUser(email: email, name: name, Id: value.user!.uid);
    CacheHelper.saveData(key: 'uId', value: value.user!.uid).then((value){
      uId = value.toString();
    });
  });
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    Get.snackbar('Sign Up Error', 'The password provided is too weak.',snackPosition: SnackPosition.BOTTOM);
  } else if (e.code == 'email-already-in-use') {
    Get.snackbar('Sign Up Error', 'The account already exists for that email.',snackPosition: SnackPosition.BOTTOM);
  }
} catch (error) {
  Get.snackbar('Sign Up Error', error.toString(),snackPosition: SnackPosition.BOTTOM);
  print(error);
}
  }

  void setDataUser(
    {
        required String email,
        required String name,
        required String Id,
      }
  ){
    UserModel userModel = UserModel(email: email, id: Id, name: name,pic: '',statusAccount: 'User');
    FirebaseFirestore.instance.collection('users').doc(Id).set(userModel.toMap()).then((value){
      Get.snackbar('Sign Up Success', 'Enjoy!',snackPosition: SnackPosition.BOTTOM);
      Get.offAll(HomeScreen());
    }).catchError((onError){
      print(onError);
    });
  }
  UserModel? userModell;
  void getUserData(id){
    FirebaseFirestore.instance.collection('users').doc(id).get().then((value)async{
        userModell = UserModel.fromJson(value.data()!);
        print(value.data()!['statusAccount']);
     await CacheHelper.saveData(key: 'accounStatus', value: value.data()!['statusAccount']).then((value){
          accountStatus = value.toString();
          print(value.toString());
        });
        print("value is: ${value.data()}");
      });
  }
}
