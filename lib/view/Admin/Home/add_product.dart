import 'package:ecommerce_app/core/viewmodel/admin_view_model.dart';
import 'package:ecommerce_app/view/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({Key? key}) : super(key: key);

  var nameProduct = TextEditingController();
  var picProduct = TextEditingController();
  var priceProduct = TextEditingController();
  var coverProduct = TextEditingController();
  var colorProduct = TextEditingController();
  var sizeProduct = TextEditingController();
  var bestProduct = TextEditingController();
  var descriptionProduct = TextEditingController();
  var statusProduct = TextEditingController();
  var typeProduct = TextEditingController();
  var favProduct = TextEditingController();
  var categoryProduct = TextEditingController();
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
            title: Text('Add Product',style: TextStyle(color: Colors.black),),
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
                admin.AddProduct(
                    nameProduct.text,
                    colorProduct.text,
                    priceProduct.text,
                    descriptionProduct.text,
                    sizeProduct.text,
                    statusProduct.text,
                    typeProduct.text,
                    categoryProduct.text,
                    bestProduct.text);
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
                  defaultTextFormField(
                      hint: 'Type Product',
                      perfixicon: Icons.text_fields,color: Colors.black,
                      controller: typeProduct,
                      type: TextInputType.name,
                      validator: (String? value){
                        if(value!.isEmpty) {
                          return 'Enter data';
                        }
                      }
                  ),
                  SizedBox(height: 10,),
                  defaultTextFormField(
                      hint: 'Color Product',
                      perfixicon: Icons.text_fields,color: Colors.black,
                      controller: colorProduct,
                      type: TextInputType.name,
                      validator: (String? value){
                        if(value!.isEmpty) {
                          return 'Enter data';
                        }
                      }
                  ),
                  SizedBox(height: 10,),
                  defaultTextFormField(
                      hint: 'Best Product',
                      perfixicon: Icons.text_fields,color: Colors.black,
                      controller: bestProduct,
                      type: TextInputType.name,
                      validator: (String? value){
                        if(value!.isEmpty) {
                          return 'Enter data';
                        }
                      }
                  ),
                  SizedBox(height: 10,),
                  defaultTextFormField(
                      hint: 'Price Product',
                      perfixicon: Icons.text_fields,color: Colors.black,
                      controller: priceProduct,
                      type: TextInputType.text,
                      validator: (String? value){
                        if(value!.isEmpty) {
                          return 'Enter data';
                        }
                      }
                  ),
                  SizedBox(height: 10,),
                  defaultTextFormField(
                      hint: 'Category Product',
                      perfixicon: Icons.text_fields,color: Colors.black,
                      controller: categoryProduct,
                      type: TextInputType.name,
                      validator: (String? value){
                        if(value!.isEmpty) {
                          return 'Enter data';
                        }
                      }
                  ),
                  SizedBox(height: 10,),
                  defaultTextFormField(
                      hint: 'Description Product',
                      perfixicon: Icons.text_fields,color: Colors.black,
                      controller: descriptionProduct,
                      type: TextInputType.name,
                      validator: (String? value){
                        if(value!.isEmpty) {
                          return 'Enter data';
                        }
                      }
                  ),
                  SizedBox(height: 10,),
                  defaultTextFormField(
                      hint: 'Size Product',
                      perfixicon: Icons.text_fields,color: Colors.black,
                      controller: sizeProduct,
                      type: TextInputType.name,
                      validator: (String? value){
                        if(value!.isEmpty) {
                          return 'Enter data';
                        }
                      }
                  ),
                  SizedBox(height: 10,),
                  defaultTextFormField(
                      hint: 'Status Product',
                      perfixicon: Icons.text_fields,color: Colors.black,
                      controller: statusProduct,
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
                        }, child: Text('Add Image Product')),
                        SizedBox(width: 10,),
                        OutlinedButton(onPressed: (){
                          admin.getCoverImage();
                        }, child: Text('Add Cover Product')),
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

