import 'package:flutter/foundation.dart';
import 'package:login_signpp_post/Models/SignUpModel.dart';
import 'package:login_signpp_post/Services/AuthService.dart';
import 'package:login_signpp_post/Views/SignUp.dart';

class Loginprovider extends ChangeNotifier {

Signupmodel? signupmodel;

LoginRequestProvider(String Email,String Password)async{
  
 signupmodel= await AuthService.LoginRequestServic(Email, Password);
}

}