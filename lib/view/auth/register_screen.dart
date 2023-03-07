import 'package:ecommerce_app/core/viewmodel/auth_view_model.dart';
import 'package:ecommerce_app/view/shared/components/components.dart';
import 'package:ecommerce_app/view/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 20,
              )),
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 50.0, right: 20, bottom: 20, left: 20),
            child: Card(
              elevation: 4,
              child: Container(
                height: 420,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Sign Up',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    CustomText(
                      text: 'Name',
                      color: Colors.grey,
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                          hintText: 'Enter Your Name'
                      ),
                      keyboardType: TextInputType.name,
                      validator: (value) {},
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomText(
                      text: 'Email',
                      color: Colors.grey,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: 'Enter Your Email'
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {},
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    CustomText(
                      text: 'Password',
                      color: Colors.grey,
                    ),
                    TextFormField(
                      controller: passController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '********',
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {},
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    defaultButton(
                      onPressed: () {
                        controller.signUpWithEmailandPass(
                            email: emailController.text,
                            name: nameController.text,
                            pass: passController.text);
                      },
                      text: 'SIGN UP',
                    )
                  ],
                ),
              ),
            ),
          ),
        ])));
  }
}
