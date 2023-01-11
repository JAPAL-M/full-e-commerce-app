class CategoriesModel{
  String? name;
  String? pic;
  CategoriesModel.fromJson(Map<String,dynamic> json){
    name = json['name'];
    pic = json['pic'];
  }

  Map<String,dynamic> toMap(){
    return {
      'name' : name,
      'pic' : pic,
    };
  }
}