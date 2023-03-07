import 'package:ecommerce_app/core/viewmodel/cart_view_model.dart';
import 'package:ecommerce_app/core/viewmodel/home_view_model.dart';
import 'package:ecommerce_app/model/ProductModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hexcolor/hexcolor.dart';

import '../shared/components/components.dart';
import '../shared/style/colors.dart';

class DetailsProductScreen extends StatelessWidget {
  DetailsProductScreen({required this.productModel,required this.Id});

  String? Id;
  ProductModel? productModel;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.network(
                  productModel!.cover.toString(),
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 196,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(onTap: (){Navigator.pop(context);},child: Icon(Icons.arrow_back_ios_new)),
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.star_border,
                            color: Colors.black,
                          ))
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Nike Dri-FIT Long Sleeve',
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildCont('Size', productModel!.size.toString()),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            padding: EdgeInsets.only(left: 16),
                            height: 40,
                            width: 160,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Color'),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Container(
                                    width: 22,
                                    height: 22,
                                    decoration: BoxDecoration(
                                        color: HexColor(
                                            productModel!.color.toString()),
                                        borderRadius: BorderRadius.circular(45)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      'Details',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      productModel!.description.toString(),
                      style: TextStyle(height: 2.4),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.zero,
              elevation: 15,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'PRICE',
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
                        ),
                        Text(
                          '\$${productModel!.price}',
                          style: TextStyle(fontSize: 18, color: PrimaryColor,fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 146,
                      child: GetBuilder<CartViewModel>(
                        init: CartViewModel(),
                        builder: (control) => MaterialButton(
                          onPressed: () {
                            control.AddCart(productModel: productModel,Id: Id);
                          },
                          child: Text(
                            'ADD',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: PrimaryColor,
                        ),
                      ),
                    )
                  ],
                ),
                height: 84,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCont(text1, text2) => Container(
        padding: EdgeInsets.only(left: 16),
        height: 40,
        width: 160,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text1),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Text(
                text2,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
}
