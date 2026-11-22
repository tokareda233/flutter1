import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? TextController; 
  final IconData preIcon;
  final IconData? sufIcon;
  final String labell;
  final String? Function(String?)? validate;
  final VoidCallback? onPressedsuffix;
  final bool obsecure;
  const CustomTextField({super.key, required this.obsecure,required this.preIcon,required this.labell,this.sufIcon,this.validate,this.TextController, this.onPressedsuffix});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TextController,
       validator: validate,
       obscureText:obsecure ,
       decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 212, 187, 216).withValues(alpha: 0.2),
        label: Text(labell),
        prefixIcon: Icon(preIcon,color: Colors.purple,),
        suffixIcon: IconButton(onPressed: onPressedsuffix,icon: Icon(sufIcon),color: Colors.purple,),
        
        enabledBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
          color: Colors.purple,
         width: 1,
         ),),
         focusedBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
          color: Colors.purple,
         width: 1,
         ),),
       ),
 
    );
  }
}