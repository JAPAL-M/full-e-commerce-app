import 'package:ecommerce_app/core/viewmodel/admin_view_model.dart';
import 'package:ecommerce_app/view/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCategoryPage extends StatelessWidget {
  AddCategoryPage({Key? key}) : super(key: key);

  var nameProduct = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminViewModel>(
      init: AdminViewModel(),
      builder: (admin) => Form(
        key: formkey,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: Text('Add Category',style: TextStyle(color: Colors.black),),
            centerTitle: true,
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,)),
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.black,
              child: Icon(Icons.add),
              onPressed: (){
                if(formkey.currentState!.validate()) {
                  admin.AddCategory(
                      nameProduct.text,
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
                      hint: 'Name Category',
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

