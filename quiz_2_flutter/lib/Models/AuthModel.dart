class Authmodel{

bool status;
String message;
Authmodel({required this.message,required this.status});

factory Authmodel.fromjson(Map<String,dynamic>json){
  return Authmodel(message: json["message"],status: json["status"]);
}

}