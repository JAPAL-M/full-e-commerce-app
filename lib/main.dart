import 'package:ecommerce_app/firebase_options.dart';
import 'package:ecommerce_app/helper/binding.dart';
import 'package:ecommerce_app/view/Admin/AdminScreen.dart';
import 'package:ecommerce_app/view/Admin/OwnerScreen.dart';
import 'package:ecommerce_app/view/auth/login_screen.dart';
import 'package:ecommerce_app/view/home/home_screen.dart';
import 'package:ecommerce_app/view/shared/components/constant.dart';
import 'package:ecommerce_app/view/shared/network/local/cache_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/viewmodel/cart_view_model.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  uId = CacheHelper.getData(key: 'uId')?? '';
 accountStatus = CacheHelper.getData(key: 'accounStatus')?? '';
  Widget? start;
  if(uId != ''){
    if(accountStatus == 'Admin'){
      start = AdminScreen();
    }else if(accountStatus == 'Owner'){
      start = OwnerScreen();
    }else if(accountStatus == 'User'){
      start = HomeScreen();
    }else{
      start = LoginScreen();
    }
  }else{
    start = LoginScreen();
  }

  runApp(MyApp(startwidget: start,));
}

class MyApp extends StatelessWidget {
 Widget? startwidget;
 MyApp({required this.startwidget});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      home: startwidget,
    );
  }
}
