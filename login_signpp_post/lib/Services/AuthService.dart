import 'package:dio/dio.dart';
import 'package:login_signpp_post/Models/SignUpModel.dart';

class  AuthService{

static  Dio dio =Dio(); 
static Future<Signupmodel> signUpRequestServic(String Name,String Email,String Password,String Phone)async{

  try{

    Response response =await dio.post("https://elsewedyteam.runasp.net/api/Register/AddUser",
  data: {
    "Name":Name,
    "Email":Email,
    "Phone":Phone,
    "Password":Password
  });
  return Signupmodel.fromJson(response.data);
  }on DioException catch(dioErorrMessage){
    throw Exception(dioErorrMessage);

  }catch(ErorrMesage){
    throw Exception(ErorrMesage);
  }
}

static Future<Signupmodel> LoginRequestServic(String Email,String Password)async{

  try{

    Response response =await dio.post("https://elsewedyteam.runasp.net/api/Login/CheckUser",
  data: {
    
    "Email":Email,
   
    "Password":Password
  });
  return Signupmodel.fromJson(response.data);
  }on DioException catch(dioErorrMessage){
    throw Exception(dioErorrMessage);

  }catch(ErorrMesage){
    throw Exception(ErorrMesage);
  }
}

}