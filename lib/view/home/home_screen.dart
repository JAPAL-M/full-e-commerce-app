import 'package:ecommerce_app/core/viewmodel/home_view_model.dart';
import 'package:ecommerce_app/view/auth/login_screen.dart';
import 'package:ecommerce_app/view/shared/components/components.dart';
import 'package:ecommerce_app/view/shared/components/constant.dart';
import 'package:ecommerce_app/view/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  
  var icon1 = Image.asset('assets/Icons/Icon_Explore.png',fit: BoxFit.cover,width: 20);
  var icon2 = Image.asset('assets/Icons/Icon_Cart.png',fit: BoxFit.cover,width: 20);
  var icon3 = Image.asset('assets/Icons/Icon_User.png',fit: BoxFit.cover,width: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Card(
        margin: EdgeInsets.zero,
        elevation: 30,
        child: GetBuilder<HomeViewModel>(
          init: HomeViewModel(),
          builder: (controller) => BottomNavigationBar(
            currentIndex: controller.currentIndex,
            onTap: (int index){
             controller.ChangeBottoNavigation(index);
            },
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 20.0,bottom: 10),
                child: icon1,
              ),
              label: '',
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 20.0,bottom: 10),
                child: Text('Explorer',style: TextStyle(fontWeight: FontWeight.bold),),
              )
              ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 20.0,bottom: 10),
                child: icon2,
              ),
              label: '',
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 20.0,bottom: 10),
                child: Text('Cart',style: TextStyle(fontWeight: FontWeight.bold),),
              )
              ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 20.0,bottom: 10),
                child: icon3,
              ),
              label: '',
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 20.0,bottom: 10),
                child: Text('Account',style: TextStyle(fontWeight: FontWeight.bold),),
              )
              ),
          ]),
        ),
      ),
      body: GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) => controller.screens[controller.currentIndex],
    )
    );
  }
}
