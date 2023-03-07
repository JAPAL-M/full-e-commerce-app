import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/CategoreyModel.dart';
import 'package:ecommerce_app/model/ProductModel.dart';
import 'package:ecommerce_app/model/UserData.dart';
import 'package:ecommerce_app/view/Admin/Home/AddCategories.dart';
import 'package:ecommerce_app/view/Admin/Home/AddProduct.dart';
import 'package:ecommerce_app/view/Admin/Home/AllUsers.dart';
import 'package:ecommerce_app/view/shared/components/components.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class AdminViewModel extends GetxController{

  AdminViewModel(){
    getAllUsers();
    getProducts();
    getCategory();
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
     AddCategoryScreen()
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

  void deleteProduct(index){
    FirebaseFirestore.instance.collection('Products').doc(productId[index]).delete().then((value){
      getProducts();
      showToast(text: 'Success delete', color: Colors.green);
      update();
    });
  }

  void deleteCategory(index){
    FirebaseFirestore.instance.collection('Categories').doc(CategoryId[index]).delete().then((value){
      getCategory();
      showToast(text: 'Success delete', color: Colors.green);
      update();
    });
  }

  File? mainImage;
  var Picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedImage = await Picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      mainImage = File(pickedImage.path);
      if(coverImage != null) {
        UploadMainImage();
      }
    } else {
      print('no image');
    }
  }

  File? coverImage;
  var cover = ImagePicker();

  Future<void> getCoverImage() async {
    final pickeImage = await Picker.pickImage(source: ImageSource.gallery);

    if (pickeImage != null) {
      coverImage = File(pickeImage.path);
      if(coverImage != null) {
        UploadCoverImage();
      }
    } else {
      print('no image');
    }
  }

  String MainImUp = '';

  void UploadMainImage() {
    FirebaseStorage.instance
        .ref()
        .child('products/${Uri
        .file(mainImage!.path)
        .pathSegments
        .last}')
        .putFile(mainImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        showToast(text: 'Success Upload Main Image', color: Colors.green);
        MainImUp = value.toString();
      }).catchError((error) {
        print(error.toString());
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  String CoverImUp = '';

  void UploadCoverImage() {
    FirebaseStorage.instance
        .ref()
        .child('products/${Uri
        .file(coverImage!.path)
        .pathSegments
        .last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        showToast(text: 'Success Upload Cover Image', color: Colors.green);
        CoverImUp = value.toString();
      }).catchError((error) {
        print(error.toString());
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  void AddProduct(String? name , color , price , description , size , status , type, categorey , best){
    ProductModel productModel = ProductModel(cover: CoverImUp, categorey: categorey, name: name, pic: MainImUp, best: best, color: color, description: description, fav: false, price: price, size: size, status: status, type: type);
     FirebaseFirestore.instance.collection('Products').add(productModel.toMap()).then((value){
       getProducts();
       showToast(text: 'Success', color: Colors.green);
       update();
     });
  }

  bool? isBottomSheetShown = false;
  void changeBottomSheet(
      @required bool isShow,
      ){
    isBottomSheetShown = isShow;
     update();
  }

  List<ProductModel> products = [];
  List<dynamic> productId = [];
  void getProducts(){
    products = [];
    productId = [];
    FirebaseFirestore.instance.collection('Products').get().then((value){
      value.docs.forEach((element) {
        productId.add(element.id);
        products.add(ProductModel.fromJson(element.data()));
        print(element.data());
        update();
      });
    });
  }

  void EditProduct(String? name , color , price , description , size , status , type, categorey , best, dynamic productId,index){
    ProductModel productModel = ProductModel(cover: CoverImUp == '' ? products[index].cover : CoverImUp , categorey: categorey, name: name, pic: MainImUp  == '' ? products[index].pic : MainImUp, best: best, color: color, description: description, fav: false, price: price, size: size, status: status, type: type);
    FirebaseFirestore.instance.collection('Products').doc(productId).update(productModel.toMap()).then((value){
      getProducts();
      showToast(text: 'Success Edit', color: Colors.green);
    });
  }

  List<CategoriesModel> categories = [];
  List<dynamic> CategoryId = [];
  void getCategory(){
    categories = [];
    CategoryId = [];
    FirebaseFirestore.instance.collection('Categories').get().then((value){
      value.docs.forEach((element) {
        CategoryId.add(element.id);
        categories.add(CategoriesModel.fromJson(element.data()));
        print(element.data());
        update();
      });
    });
  }

  void AddCategory(String? name){
    CategoriesModel categoriesModel = CategoriesModel(name: name, pic: MainImUp);
    FirebaseFirestore.instance.collection('Categories').add(categoriesModel.toMap()).then((value){
      getCategory();
      showToast(text: 'Success', color: Colors.green);
      update();
    });
  }

  void EditCategory(String? name,index,categoryId){
    CategoriesModel categoriesModel = CategoriesModel(name: name, pic: MainImUp  == '' ? categories[index].pic : MainImUp);
    FirebaseFirestore.instance.collection('Products').doc(categoryId).update(categoriesModel.toMap()).then((value){
      getCategory();
      showToast(text: 'Success Edit', color: Colors.green);
    });
  }
}