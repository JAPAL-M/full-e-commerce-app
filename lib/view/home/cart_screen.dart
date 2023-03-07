import 'package:ecommerce_app/core/viewmodel/cart_view_model.dart';
import 'package:ecommerce_app/core/viewmodel/home_view_model.dart';
import 'package:ecommerce_app/model/CartModel.dart';
import 'package:ecommerce_app/model/ProductModel.dart';
import 'package:ecommerce_app/view/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_dismissible_tile/flutter_dismissible_tile.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../shared/style/colors.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: CartViewModel(),
      builder: (controller) => controller.cart.length == 0 ? Align(alignment: AlignmentDirectional.center,child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        SvgPicture.asset('assets/Icons/undraw_empty_cart_co35.svg',width: 200,height: 200,),
        Text('Cart Empty',style: TextStyle(fontSize: 25),)
      ],)) : Scaffold(
        bottomNavigationBar: Card(
          margin: EdgeInsets.zero,
          color: Colors.white,
          elevation: 30,
          child: BottomNavigationBar(
              backgroundColor: Colors.white, items: [
            BottomNavigationBarItem(
                icon: TextButton(
                  onPressed: () {},
                  child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TOTAL',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            GetBuilder<CartViewModel>(
                              init: CartViewModel(),
                              builder: (control) => Text(
                                '\$${control.totalPrice}',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: PrimaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: TextButton(
                  onPressed: () {},
                  child: Container(
                    height: 50,
                      width: 146,
                      child: defaultButton(onPressed: () {}, text: 'CHECKOUT')),
                ),
                label: '')
          ]),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(bottom: 15.0, left: 15, right: 15),
          child: ListView.separated(
              itemBuilder: (context, index) =>
                  Dismissible(
                      onDismissed: (direction) {
                        if(direction == DismissDirection.startToEnd){

                        }else{
                          controller.deleteCart(controller.cartId[index]);
                          controller.GetCart();
                          controller.getTotalPrice();
                        }
                      },
                      key: Key(index.toString()),
                      background: backDism(Icons.star, Colors.yellow,AlignmentDirectional.centerStart),
                      secondaryBackground: backDism(Icons.delete_outline, Colors.red,AlignmentDirectional.centerEnd),
                  child: buildCart(controller.cart[index],index)
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 15,
                  ),
              itemCount: controller.cart.length),
        ),
      ),
    );
  }


  Widget buildCart(CartModel? cart,int index) => Container(
        width: 343,
        height: 120,
        child: Row(
          children: [
            Image.network(
              cart!.pic.toString(),
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  cart.name.toString(),
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '\$${cart.price}',
                  style: TextStyle(fontSize: 16, color: PrimaryColor),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  alignment: AlignmentDirectional.center,
                  height: 30,
                  width: 110,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(4)),
                  child: GetBuilder<CartViewModel>(
                    init: CartViewModel(),
                    builder: (controller) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {
                              controller.decreaseQuantity(index: index);
                            },
                            child: Image.asset('assets/Icons/plus.png',width: 20,height: 20,)),
                        Text(cart.quantity.toString()),
                        InkWell(
                            onTap: () {
                              controller.increaseQuantity(index: index);
                            },
                            child: Image.asset('assets/Icons/minus.png',width: 20,height: 20,)),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );

  Widget backDism(icon,color,align) => Container(
  color: color,
  child: Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20.0),
  child: Align(alignment: align,child: Icon(icon,color: Colors.white,)),
  ),
  );
}
