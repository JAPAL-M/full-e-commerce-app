import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/ProductModel.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../model/CartModel.dart';
import '../../view/shared/components/constant.dart';

class CartViewModel extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
  }
 CartViewModel(){
    GetCart();
    getProducts();
    GetFav();
 }
  void AddCart({ProductModel? productModel,Id}){
    CartModel cartModel = CartModel(name: productModel!.name, pic: productModel.pic, price: productModel.price, quantity: 1);
    FirebaseFirestore.instance.collection('users').doc(uId).collection('cart').doc(Id).set(cartModel.toMap()).then((value){

      GetCart();
      getProducts();
    });
  }

  List<CartModel> cart = [];
  List<String> cartId = [];
  void GetCart(){
    cart = [];
    cartId = [];
    FirebaseFirestore.instance.collection('users').doc(uId).collection('cart').get().then((value){
      getTotalPrice();
      value.docs.forEach((element) {
        cartId.add(element.id);
        cart.add(CartModel.fromJson(element.data()));
        print(cart.length);
      });
    });
  }


  decreaseQuantity({required int index})async{
    cart[index].quantity = cart[index].quantity!.toInt() + 1;
   await FirebaseFirestore.instance.collection('users').doc(uId).collection('cart').doc(cartId[index]).update({"quantity": cart[index].quantity}).then((value){
     totalPrice += (double.parse(cart[index].price!));
    });
    update();
  }

  increaseQuantity({required int index})async{
    cart[index].quantity = cart[index].quantity!.toInt() - 1;
   await FirebaseFirestore.instance.collection('users').doc(uId).collection('cart').doc(cartId[index]).update({"quantity": cart[index].quantity}).then((value){
     totalPrice -= (double.parse(cart[index].price!));
   });
    update();
  }

  List<ProductModel> products = [];
  List<String> productsId = [];
  void getProducts(){
    productsId = [];
    products = [];
    FirebaseFirestore.instance.collection('Products').get().then((value){
      getTotalPrice();
      value.docs.forEach((element) {
        productsId.add(element.id);
        print(element.id);
        products.add(ProductModel.fromJson(element.data()));
        update();
      });
    });
  }
  double totalPrice = 0.0;
  getTotalPrice(){
    for(int i = 0 ; i < cart.length ; i++) {
      totalPrice += (double.parse(cart[i].price!) * cart[i].quantity!);
      print('totalPrice $totalPrice');
      update();
    }
  }

  void deleteCart(ID)async{
   await FirebaseFirestore.instance.collection('users').doc(uId).collection('cart').doc(ID).delete().then((value){
      getTotalPrice();
    });
  }

  void AddFav({CartModel? Cart,Id}){
    CartModel cartModel = CartModel(name: Cart!.name, pic: Cart.pic, price: Cart.price, quantity: 1);
    FirebaseFirestore.instance.collection('users').doc(uId).collection('favorite').doc(Id).set(cartModel.toMap()).then((value){

      GetFav();
      getProducts();
    });
  }

  List<CartModel> fav = [];
  List<String> favId = [];
  void GetFav(){
    fav = [];
    favId = [];
    FirebaseFirestore.instance.collection('users').doc(uId).collection('favorite').get().then((value){
      value.docs.forEach((element) {
        favId.add(element.id);
        fav.add(CartModel.fromJson(element.data()));
      });
    });
  }

  void deleteFav(ID){
    FirebaseFirestore.instance.collection('users').doc(uId).collection('favorite').doc(ID).delete().then((value){

    });
  }
}