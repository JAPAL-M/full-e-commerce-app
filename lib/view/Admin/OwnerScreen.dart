import 'package:ecommerce_app/view/auth/login_screen.dart';
import 'package:ecommerce_app/view/shared/components/components.dart';
import 'package:ecommerce_app/view/shared/components/constant.dart';
import 'package:ecommerce_app/view/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';

class OwnerScreen extends StatelessWidget {
  const OwnerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: (){
          CacheHelper.removeData(key: 'uId').then((value){
            uId = '';
            CacheHelper.removeData(key: 'accounStatus').then((value){
              accountStatus = '';
              navigateto(context, LoginScreen());
            });
          });
        }, icon: Icon(Icons.exit_to_app))
      ],),
      body: Text('Owner'),
    );
  }
}
