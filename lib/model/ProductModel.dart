class ProductModel{
  String? name , color , price , pic , cover , description , size , status , type;
  bool? fav , best;

  ProductModel.fromJson(Map<String,dynamic> json){
    name = json['name'];
    color = json['color'];
    price = json['price'];
    pic = json['pic'];
    cover = json['cover'];
    description = json['description'];
    size = json['size'];
    status = json['status'];
    type = json['type'];
    fav = json['fav'];
    best = json['Best'];
  }

  Map<String,dynamic> toMap(){
    return {
      'name' : name,
      'color' : color,
      'price' : price,
      'pic' : pic,
      'cover' : cover,
      'description' : description,
      'size' : size,
      'status' : status,
      'type' : type,
      'fav' : fav,
      'Best' : best,
    };
  }
}