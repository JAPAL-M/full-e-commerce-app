import 'package:ecommerce_app/core/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/ProductModel.dart';
import '../shared/components/components.dart';
import '../shared/style/colors.dart';
import 'DetailsProduct.dart';

class AllProduct extends StatelessWidget {
  const AllProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
            builder: (controller) => Scaffold(
              backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  title: Text('All Product',style: TextStyle(fontSize: 20,color: Colors.black),),
                  centerTitle: true,
                  leading: InkWell(onTap: (){Navigator.pop(context);},child: Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
                ),
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => controller
                        .products[index].best ==
                        'true'
                        ? InkWell(
                        onTap: (){
                          navigateto(context, DetailsProductScreen(productModel: controller.products[index],Id: controller.productsId[index],));
                        },
                        child: buildProduct(controller.products[index]))
                        : Center(
                        child: Text(
                          'No Best Selling',
                          style: Theme.of(context)
                              .textTheme
                              .headline5,
                        )),
                    separatorBuilder: (context, index) =>
                        SizedBox(
                          width: 20,
                        ),
                    itemCount: controller.products.length),
              ),
            )
    );
  }
  Widget buildProduct(ProductModel? productModel) => Container(
    height: 319,
    width: 164,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: NetworkImage(productModel!.pic.toString())),
        SizedBox(
          height: 6,
        ),
        Text(productModel.name.toString(), style: TextStyle(fontSize: 16)),
        SizedBox(
          height: 5,
        ),
        Text(productModel.type.toString(),
            style: TextStyle(
                fontSize: 12, color: Color.fromRGBO(146, 146, 146, 1))),
        SizedBox(
          height: 5,
        ),
        Text('\$${productModel.price}',
            style: TextStyle(fontSize: 16, color: PrimaryColor)),
      ],
    ),
  );
}
