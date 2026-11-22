import 'package:flutter/material.dart';

class Passwordprovider extends ChangeNotifier{
bool ishidden=false;
String gender="";

void toggle(){
  ishidden=!ishidden;
  notifyListeners();
}
void Gender(value){
  gender=value;
  notifyListeners();
}

}