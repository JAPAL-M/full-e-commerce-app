import 'package:ecommerce_app/model/ProductModel.dart';
import 'package:flutter/material.dart';

class DetailsProductScreen extends StatelessWidget {
  DetailsProductScreen({required this.productModel});
  ProductModel? productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.network(productModel!.cover.toString(),width: double.infinity,fit: BoxFit.cover,height: 196,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back_ios_new),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                        child: Icon(Icons.star_border,color: Colors.black,))
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Nike Dri-FIT Long Sleeve',style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(45)
                ),
                child: OutlinedButton(
                    onPressed: (){}, child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Size',style: TextStyle(color: Colors.black),),
                  Text(productModel!.size.toString(),style: TextStyle(color: Colors.black),)
                ],)),
              )
            ],
          )
        ],
      ),
    );
  }
}
