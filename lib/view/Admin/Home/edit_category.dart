import 'package:ecommerce_app/core/viewmodel/admin_view_model.dart';
import 'package:ecommerce_app/model/CategoreyModel.dart';
import 'package:ecommerce_app/model/ProductModel.dart';
import 'package:ecommerce_app/view/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCategory extends StatelessWidget {
  EditCategory({required this.categoryId,required this.categoriesModel,required this.index});
  dynamic index;
  dynamic categoryId;
  CategoriesModel? categoriesModel;
  var nameProduct = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    nameProduct.text = categoriesModel!.name.toString();
    return GetBuilder<AdminViewModel>(
      init: AdminViewModel(),
      builder: (admin) => Form(
        key: formkey,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: Text('Edit Category',style: TextStyle(color: Colors.black),),
            centerTitle: true,
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,)),
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.black,
              child: Icon(Icons.edit),
              onPressed: (){
                if(formkey.currentState!.validate()) {
                  admin.EditCategory(
                      nameProduct.text,
                      index,
                    categoryId
                  );
                  admin.MainImUp = '';
                  admin.CoverImUp = '';
                  Navigator.pop(context);
                }

              }),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
                children: [
                  defaultTextFormField(
                      hint: 'Name Product',
                      perfixicon: Icons.text_fields,color: Colors.black,
                      controller: nameProduct,
                      type: TextInputType.name,
                      validator: (String? value){
                        if(value!.isEmpty) {
                          return 'Enter data';
                        }
                      }
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(onPressed: (){
                          admin.getProfileImage();
                        }, child: Text('Add Image Category')),
                      ],
                    ),
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
}

