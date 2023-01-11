import 'package:ecommerce_app/core/viewmodel/admin_view_model.dart';
import 'package:ecommerce_app/model/UserData.dart';
import 'package:ecommerce_app/view/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllUsersScreen extends StatelessWidget {

  var scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminViewModel>(
      init: AdminViewModel(),
      builder: (controller) => Scaffold(
        key: scaffoldkey,
        backgroundColor: Colors.white,
        body: ListView.separated(
            itemBuilder: (context,index) => buildUsers(controller.users[index],index),
            separatorBuilder: (context,index) => myDivider(),
            itemCount: controller.users.length
        ),
      ),
    );
  }
  Widget buildUsers(UserModel? userModel,index) => Container(
    padding: EdgeInsets.all(8),
    margin: EdgeInsets.all(8),
    height: 100,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(10)
    ),
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.black,
          backgroundImage: NetworkImage(userModel!.pic.toString()),
          radius: 43,
        ),
        SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${userModel.name}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
            SizedBox(height: 3,),
            Text('Status: ${userModel.statusAccount}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.red.shade900),),
           ],
        ),
        Spacer(),
        if(userModel.statusAccount == 'User' )
         SizedBox(width: 10,),
        if(userModel.statusAccount == 'User' )
         GetBuilder<AdminViewModel>(
           init: AdminViewModel(),
           builder: (con) => InkWell(
             onTap: (){
               con.deleteUser(index);
             },
               child: CircleAvatar(child: Icon(Icons.delete),backgroundColor: Colors.red.shade900,)),
         ),
      ],
    ),
  );
}
