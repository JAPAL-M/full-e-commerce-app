import 'package:ecommerce_app/core/viewmodel/admin_view_model.dart';
import 'package:ecommerce_app/core/viewmodel/home_view_model.dart';
import 'package:ecommerce_app/model/CategoreyModel.dart';
import 'package:ecommerce_app/model/ProductModel.dart';
import 'package:ecommerce_app/view/Admin/Home/add_product.dart';
import 'package:ecommerce_app/view/Admin/Home/edit_category.dart';
import 'package:ecommerce_app/view/Admin/Home/edit_product.dart';
import 'package:ecommerce_app/view/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCategoryScreen extends StatelessWidget {
  AddCategoryScreen({Key? key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminViewModel>(
      init: AdminViewModel(),
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: (){
            navigateto(context, AddProductPage());
          },
          child: Icon(Icons.add,),
        ),
        backgroundColor: Colors.white,
        body: ListView.separated(
            itemBuilder: (context,index) => buildCategory(controller.categories[index],controller.CategoryId[index],context,index),
            separatorBuilder: (context,index) => myDivider(),
            itemCount: controller.categories.length
        ),
      ),
    );
  }

  Widget buildCategory(CategoriesModel? categoriesModel,categoryId,context,index) => Container(
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
        Card(
          color: Colors.grey.shade300,
          child: Image.network(categoriesModel!.pic.toString(),width: 100,height: 100,),
        ),
        SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${categoriesModel.name}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
          ],
        ),
        Spacer(),
        CircleAvatar(backgroundColor: Colors.black,child: IconButton(
            onPressed: (){
              navigateto(context, EditCategory(categoryId: categoryId,categoriesModel: categoriesModel,index: index));
            }, icon: Icon(Icons.edit))),
        SizedBox(width: 5,),
        GetBuilder<AdminViewModel>(
          init: AdminViewModel(),
          builder: (admins) => CircleAvatar(backgroundColor: Colors.red.shade900,child: IconButton(onPressed: (){
            admins.deleteCategory(index);
          }, icon: Icon(Icons.delete))),
        ),
      ],
    ),
  );
}
