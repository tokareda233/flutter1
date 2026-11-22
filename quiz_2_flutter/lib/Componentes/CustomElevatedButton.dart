import 'package:flutter/material.dart';

class Customelevatedbutton extends StatelessWidget {
  VoidCallback onPressed;
  String text;
   Customelevatedbutton({super.key,required this.onPressed,required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed:onPressed , child: Text(text,style:TextStyle(color: Colors.white)),style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange, ));
  }
}