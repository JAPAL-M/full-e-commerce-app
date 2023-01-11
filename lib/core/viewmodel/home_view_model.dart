import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/CategoreyModel.dart';
import 'package:ecommerce_app/model/ProductModel.dart';
import 'package:ecommerce_app/view/home/account_screen.dart';
import 'package:ecommerce_app/view/home/cart_screen.dart';
import 'package:ecommerce_app/view/home/explorer_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController{
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
 HomeViewModel(){
    getCategory();
    getProducts();
 }

  int currentIndex = 0;
  void ChangeBottoNavigation(int index){
   currentIndex = index;
   update();
  }

  List<Widget> screens = [
    ExplorerScreen(),
    CartScreen(),
    AccountScreen(),
  ];


  List<CategoriesModel> categories = [];
  void getCategory(){
    categories = [];
    FirebaseFirestore.instance.collection('Categories').get().then((value){
      value.docs.forEach((element) {
       categories.add(CategoriesModel.fromJson(element.data()));
       print(element.data());
        update();
      });
    });
  }

  List<ProductModel> products = [];
  void getProducts(){
    products = [];
    FirebaseFirestore.instance.collection('Products').get().then((value){
      value.docs.forEach((element) {
        products.add(ProductModel.fromJson(element.data()));
        print(element.data());
        update();
      });
    });
  }
}