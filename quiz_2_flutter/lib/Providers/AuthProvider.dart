import 'package:flutter/foundation.dart';
import 'package:quiz_2_flutter/Models/AuthModel.dart';
import 'package:quiz_2_flutter/Services/AuthService.dart';

class Authprovider extends ChangeNotifier {

Authmodel? signUpmodel;
Authmodel? loginmodel;

signUpProviderRequest(String Name,String Email,String Phone,String Password)async{
  signUpmodel=await Authservice.SignUpRequest(Name, Email, Phone, Password);
}


loginProviderRequest(String Email,String Password)async{
  loginmodel=await Authservice.LoginRequest( Email,  Password);
}

}