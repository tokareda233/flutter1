import 'package:flutter/foundation.dart';
import 'package:login_signpp_post/Models/SignUpModel.dart';
import 'package:login_signpp_post/Services/AuthService.dart';


class Signupprovider extends ChangeNotifier {

Signupmodel? signupmodel;

signUpRequestprovider(String Name,String Email,String Password,String Phone)async{

signupmodel=await AuthService.signUpRequestServic(Name, Email, Password, Phone);

}

}