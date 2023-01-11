import 'package:ecommerce_app/core/viewmodel/auth_view_model.dart';
import 'package:ecommerce_app/view/auth/register_screen.dart';
import 'package:ecommerce_app/view/shared/components/components.dart';
import 'package:ecommerce_app/view/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
                height: 395,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Welcome',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(RegisterScreen());
                          },
                          child: CustomText(
                            text: 'Sign up',
                            fontSize: 18,
                            color: PrimaryColor,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CustomText(
                      text: 'Sign in to Continue',
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    CustomText(
                      text: 'Email',
                      color: Colors.grey,
                    ),
                    defaultTextFormField(
                      controller: emailController,
                      validator: (value) {},
                      hint: 'Enter Your Email',
                      type: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    CustomText(
                      text: 'Password',
                      color: Colors.grey,
                    ),
                    defaultTextFormField(
                      controller: passController,
                      obscureText: true,
                      validator: (value) {},
                      hint: '********',
                      type: TextInputType.visiblePassword,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                        text: 'Forget Password?', allign: Alignment.topRight),
                    SizedBox(
                      height: 20,
                    ),
                    defaultButton(
                      onPressed: () {
                        controller.signInWithEmailandPass(
                            email: emailController.text,
                            pass: passController.text);
                      },
                      text: 'SIGN IN',
                    )
                  ],
                ),
              ),
            ),
          ),
        ])));
  }
}
