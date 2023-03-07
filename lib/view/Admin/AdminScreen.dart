import 'package:ecommerce_app/core/viewmodel/admin_view_model.dart';
import 'package:ecommerce_app/view/auth/login_screen.dart';
import 'package:ecommerce_app/view/shared/components/components.dart';
import 'package:ecommerce_app/view/shared/components/constant.dart';
import 'package:ecommerce_app/view/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminViewModel>(
      init: AdminViewModel(),
      builder: (control) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [
          IconButton(onPressed: ()async{
           await CacheHelper.removeData(key: 'uId').then((value)async{
              uId = '';
             await CacheHelper.removeData(key: 'accounStatus').then((value){
                accountStatus = '';
                navigateto(context, LoginScreen());
              });
            });
          }, icon: Icon(Icons.exit_to_app,color: Colors.black,))
        ],),
        bottomNavigationBar: GetBuilder<AdminViewModel>(
          init: AdminViewModel(),
          builder: (controller) => BottomNavigationBar(
            currentIndex: controller.currentindex,
            onTap: (int index){
              controller.ChangeBottomNav(index);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Users'),
              BottomNavigationBarItem(icon: Icon(Icons.production_quantity_limits),label: 'Product'),
              BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label: 'Categories'),
            ],
          ),
        ),
        body: control.screens[control.currentindex],
      ),
    );
  }
}
