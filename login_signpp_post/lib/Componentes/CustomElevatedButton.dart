import 'package:flutter/material.dart';

class Customelevatedbutton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const Customelevatedbutton({super.key,required this.onPressed,required this.text});
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, child: Text(text,style: TextStyle(fontSize: 19,color: Colors.white,fontWeight: FontWeight.bold),),
      style: ElevatedButton.styleFrom(elevation: 3,backgroundColor: Colors.purple,minimumSize:Size(60,50))
     
    
    );
  }
}