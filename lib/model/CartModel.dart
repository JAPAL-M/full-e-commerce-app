class CartModel{
  String? name , price , pic;
  int? quantity;
  CartModel({required this.name,required this.pic,required this.price,required this.quantity});
  CartModel.fromJson(Map<String,dynamic> json){
    name = json['name'];
    price = json['price'];
    pic = json['pic'];
    quantity = json['quantity'];
  }

  Map<String,dynamic> toMap(){
    return {
      'name' : name,
      'price' : price,
      'pic' : pic,
      'quantity' : quantity,
    };
  }
}