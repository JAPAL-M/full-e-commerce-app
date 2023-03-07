class ProductModel{
  String? name , color , price , pic , cover , description , size , status , type, categorey , best;
  bool? fav;
  ProductModel({required this.cover,required this.categorey,required this.name,required this.pic,required this.best,required this.color,required this.description,this.fav,required this.price,required this.size,required this.status,required this.type});
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
    categorey = json['categorey'];
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
      'categorey' : categorey,
    };
  }
}