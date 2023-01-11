import 'package:ecommerce_app/view/shared/components/components.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              defaultTextFormField(
                hint: 'Name Product',
                perfixicon: Icons.text_fields,color: Colors.black,
                  controller: nameProduct,
                  type: TextInputType.name,
                  validator: (String? value){

                  }
              ),
              SizedBox(height: 10,),
              defaultTextFormField(
                  hint: 'Name Product',
                  perfixicon: Icons.text_fields,color: Colors.black,
                  controller: nameProduct,
                  type: TextInputType.name,
                  validator: (String? value){

                  }
              ),
              SizedBox(height: 10,),
              defaultTextFormField(
                  hint: 'Name Product',
                  perfixicon: Icons.text_fields,color: Colors.black,
                  controller: nameProduct,
                  type: TextInputType.name,
                  validator: (String? value){

                  }
              ),
              SizedBox(height: 10,),
              defaultTextFormField(
                  hint: 'Name Product',
                  perfixicon: Icons.text_fields,color: Colors.black,
                  controller: nameProduct,
                  type: TextInputType.name,
                  validator: (String? value){

                  }
              ),
              SizedBox(height: 10,),
              defaultTextFormField(
                  hint: 'Name Product',
                  perfixicon: Icons.text_fields,color: Colors.black,
                  controller: nameProduct,
                  type: TextInputType.name,
                  validator: (String? value){

                  }
              ),
              SizedBox(height: 10,),
              defaultTextFormField(
                  hint: 'Name Product',
                  perfixicon: Icons.text_fields,color: Colors.black,
                  controller: nameProduct,
                  type: TextInputType.name,
                  validator: (String? value){

                  }
              ),
              SizedBox(height: 10,),
              defaultTextFormField(
                  hint: 'Name Product',
                  perfixicon: Icons.text_fields,color: Colors.black,
                  controller: nameProduct,
                  type: TextInputType.name,
                  validator: (String? value){

                  }
              ),
              SizedBox(height: 10,),
              defaultTextFormField(
                  hint: 'Name Product',
                  perfixicon: Icons.text_fields,color: Colors.black,
                  controller: nameProduct,
                  type: TextInputType.name,
                  validator: (String? value){

                  }
              ),
              SizedBox(height: 10,),
              defaultTextFormField(
                  hint: 'Name Product',
                  perfixicon: Icons.text_fields,color: Colors.black,
                  controller: nameProduct,
                  type: TextInputType.name,
                  validator: (String? value){

                  }
              ),
              SizedBox(height: 10,),
              defaultTextFormField(
                  hint: 'Name Product',
                  perfixicon: Icons.text_fields,color: Colors.black,
                  controller: nameProduct,
                  type: TextInputType.name,
                  validator: (String? value){

                  }
              ),
              SizedBox(height: 10,),
              defaultTextFormField(
                  hint: 'Name Product',
                  perfixicon: Icons.text_fields,color: Colors.black,
                  controller: nameProduct,
                  type: TextInputType.name,
                  validator: (String? value){

                  }
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
