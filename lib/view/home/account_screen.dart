import 'package:ecommerce_app/view/auth/login_screen.dart';
import 'package:ecommerce_app/view/shared/components/components.dart';
import 'package:ecommerce_app/view/shared/components/constant.dart';
import 'package:ecommerce_app/view/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(onPressed: ()async{
         await CacheHelper.removeData(key: 'uId').then((value)async {
            uId = '';
           await CacheHelper.removeData(key: 'accounStatus').then((value){
              accountStatus = '';
              navigateto(context, LoginScreen());
            });
          });
        }, icon: Icon(Icons.exit_to_app,size: 50,)),
      ),
    );
  }
}