import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_2_flutter/Componentes/CustomElevatedButton.dart';
import 'package:quiz_2_flutter/Componentes/CustomTextFormField.dart';
import 'package:quiz_2_flutter/Providers/AuthProvider.dart';
import 'package:quiz_2_flutter/Views/HomeScreen.dart';
import 'package:quiz_2_flutter/Views/SignUp.dart';

class Login extends StatelessWidget {
   GlobalKey<FormState> formKey=GlobalKey<FormState>();
  TextEditingController EmailController=TextEditingController();
  TextEditingController PasswordController=TextEditingController();
   Login({super.key});

  @override
  Widget build(BuildContext context) {
     Authprovider authproviderobj=Provider.of<Authprovider>(context,listen: false);
    return Scaffold(

      appBar: AppBar(
        title: Text("Login",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
          
          children: [
            SizedBox(height: 50,),
            CircleAvatar(child: Icon(Icons.laptop_mac_outlined,size: 65,),radius: 75,backgroundColor: const Color.fromARGB(255, 233, 228, 228),),
            SizedBox(height: 20,),
            Form(
              key: formKey,
              child: Column(
                children: [
                 
                 
                   Customtextformfield(Label: "Email", controller: EmailController, preIcon: Icons.email,
                  validator: (EmailController){
                    if(EmailController==null){
                      return "Value Can not be null";
                    }
                    if(EmailController.isEmpty){
                      return "Value Can not be empty";
                    }
                    if(!EmailController.contains("@")){
                      return "Invalid Email Format";
                    }
                    return null;
                  }
                  ),
                  
                  SizedBox(height: 15,),
                  Customtextformfield(Label: "Password", controller: PasswordController,suxIcon: Icons.visibility_off, preIcon: Icons.lock,
                  validator: (PasswordController){
                    if(PasswordController==null){
                      return "Value Can not be null";
                    }
                    if(PasswordController.isEmpty){
                      return "Value Can not be empty";
                    }
                    if(PasswordController.length<6){
                      return "Enter more than 6 degits";
                    }
                    return null;
                  }
                  ),
                  
                  SizedBox(height: 35,),
                  Customelevatedbutton(onPressed: ()async{
                    if(formKey.currentState!.validate()){
                      await authproviderobj.loginProviderRequest( EmailController.text, PasswordController.text);

                      if(authproviderobj.loginmodel!.status==true){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen(),));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(authproviderobj.loginmodel!.message)));
                      }else{
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(authproviderobj.loginmodel!.message)));
                      }
                    }

                    
                  }, text: "Login"),

                 


                ],
              ),
            ),
             SizedBox(height: 20,),
             Text("Forget Password?",style: TextStyle(color:Colors.deepOrange,fontWeight: FontWeight.bold ),),
             SizedBox(height: 55,),
             Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 
                  Text("Do not have an account?  ",style: TextStyle(fontWeight: FontWeight.bold),),
                  TextButton(onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => Signup(),));
                  }, child: Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange),),)
                ],
              ),
            )
          ],
         ),
       ),
      ),
    );
  }
}