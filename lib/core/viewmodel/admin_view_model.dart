import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/UserData.dart';
import 'package:ecommerce_app/view/Admin/Home/AddCategories.dart';
import 'package:ecommerce_app/view/Admin/Home/AddProduct.dart';
import 'package:ecommerce_app/view/Admin/Home/AllUsers.dart';
import 'package:ecommerce_app/view/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AdminViewModel extends GetxController{

  AdminViewModel(){
    getAllUsers();
  }
   @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

int currentindex = 0;
   void ChangeBottomNav(int index){
     currentindex = index;
     update();
   }
   List<Widget> screens = [
     AllUsersScreen(),
     AddProductScreen(),
     AddCategoryScreen(),
   ];

   List<UserModel> users = [];
   void getAllUsers(){
     users = [];
     FirebaseFirestore.instance.collection('users').get().then((value){
       value.docs.forEach((element) {
         users.add(UserModel.fromJson(element.data()));
         update();
       });
     });
   }
  void deleteUser(index){
    FirebaseFirestore.instance.collection('users').doc(users[index].id).delete().then((value){
      getAllUsers();
      showToast(text: 'Success', color: Colors.green);
      update();
    });
  }
}