class UserModel{
  String? email;
  String? statusAccount;
  String? name;
  String? id;
  String? pic;
  UserModel({required this.email,required this.id,required this.name,required this.pic,this.statusAccount});
  UserModel.fromJson(Map<String,dynamic> json){
    email = json['email'];
    id = json['id'];
    name = json['name'];
    statusAccount = json['statusAccount'];
    pic = json['pic'];
  }
  Map<String,dynamic> toMap(){
 return {
   'email' : email,
   'id' : id,
   'name' : name,
   'statusAccount' : statusAccount,
   'pic' : pic,
 };
}
}


