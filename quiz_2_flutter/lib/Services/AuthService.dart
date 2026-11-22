import 'package:dio/dio.dart';
import 'package:quiz_2_flutter/Models/AuthModel.dart';

class Authservice {

static Dio dio=Dio();

static Future<Authmodel> SignUpRequest(String Name,String Email,String Phone,String Password)async{
try{
  Response response =await dio.post("https://elsewedyteam.runasp.net/api/Register/AddUser",
data: {
  "Name":Name,
  "Email":Email,
  "Phone":Phone,
  "Password":Password});

return Authmodel.fromjson(response.data);
}on DioException catch(DioMessage){
  throw Exception(DioMessage);
}catch(e){
  throw Exception(e);
}

}


static Future<Authmodel> LoginRequest(String Email,String Password)async{
try{
  Response response =await dio.post("https://elsewedyteam.runasp.net/api/Login/CheckUser",
data: {
  
  "Email":Email,
  
  "Password":Password});

return Authmodel.fromjson(response.data);
}on DioException catch(DioMessage){
  throw Exception(DioMessage);
}catch(e){
  throw Exception(e);
}

}


}