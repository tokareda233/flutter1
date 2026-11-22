class Signupmodel {
String message;
bool status;
Signupmodel({required this.status,required this.message});

factory Signupmodel.fromJson(Map<String,dynamic>json){
  return Signupmodel(status: json["status"],message: json["message"]);
}



}