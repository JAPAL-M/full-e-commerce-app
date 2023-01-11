import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ecommerce_app/core/viewmodel/home_view_model.dart';
import 'package:ecommerce_app/model/CategoreyModel.dart';
import 'package:ecommerce_app/model/ProductModel.dart';
import 'package:ecommerce_app/view/auth/login_screen.dart';
import 'package:ecommerce_app/view/home/DetailsProduct.dart';
import 'package:ecommerce_app/view/shared/components/components.dart';
import 'package:ecommerce_app/view/shared/components/constant.dart';
import 'package:ecommerce_app/view/shared/network/local/cache_helper.dart';
import 'package:ecommerce_app/view/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ExplorerScreen extends StatelessWidget {
  var SearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => ConditionalBuilder(
          condition: controller.categories != null,
          builder: (context) => Scaffold(
                backgroundColor: Colors.white,
                body: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Color.fromRGBO(247, 247, 247, 1)),
                                child: TextFormField(
                                  controller: SearchController,
                                  keyboardType: TextInputType.text,
                                  validator: (String? value) {},
                                  decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      prefixIcon: Image.asset(
                                          'assets/Icons/Icon_Search.png')),
                                )),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              'Categories',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(
                              height: 21,
                            ),
                            Container(
                              width: double.infinity,
                              height: 130,
                              child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    buildCategory(controller.categories[index]),
                                separatorBuilder: (context, index) => SizedBox(
                                  width: 20,
                                ),
                                itemCount: controller.categories.length,
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Best Selling',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                Text('See all', style: TextStyle(fontSize: 16))
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              height: 319,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) => controller
                                              .products[index].best ==
                                          true
                                      ? InkWell(
                                    onTap: (){
                                      navigateto(context, DetailsProductScreen(productModel: controller.products[index],));
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
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          fallback: (context) => Center(child: CircularProgressIndicator())),
    );
  }

  Widget buildCategory(CategoriesModel? categoriesModel) => Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    blurRadius: .5,
                    color: Colors.grey.shade300,
                    spreadRadius: 0.5)
              ],
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30.0,
              child: Image.network(categoriesModel!.pic.toString()),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(categoriesModel.name.toString())
        ],
      );

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
            Text(productModel.price.toString(),
                style: TextStyle(fontSize: 16, color: PrimaryColor)),
          ],
        ),
      );
}
