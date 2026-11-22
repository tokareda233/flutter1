import 'package:flutter/material.dart';

class Customtextformfield extends StatelessWidget {
  String Label;
  IconData preIcon;
  IconData? suxIcon;
  String? Function(String?)? validator;
  TextEditingController controller;
   Customtextformfield({super.key,required this.Label,required this.controller,required this.preIcon, this.suxIcon,this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator:validator ,
      decoration: InputDecoration(
      label: Text(Label),
      prefixIcon: Icon(preIcon,),
      suffixIcon: Icon(suxIcon,),
      filled: true,
      fillColor: const Color.fromARGB(255, 241, 238, 238),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: Colors.white
        )
        
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: Colors.white
        )
      )
    
    ),



    );
  }
}