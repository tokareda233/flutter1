import 'package:flutter/material.dart';
import 'package:login_signpp_post/Componentes/CustomElevatedButton.dart';
import 'package:login_signpp_post/Componentes/CustomTextFormField.dart';
import 'package:login_signpp_post/Providers/LoginProvider.dart';
import 'package:login_signpp_post/Providers/PasswordProvider.dart';
import 'package:login_signpp_post/Views/SignUp.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
   GlobalKey<FormState>formKey =GlobalKey<FormState>();
   TextEditingController EmailController=TextEditingController();
   TextEditingController PasswordController=TextEditingController();
   
  Login({super.key});
  @override
  Widget build(BuildContext context) {
    Passwordprovider providerob = Provider.of<Passwordprovider>(context);
    Loginprovider LoginObj =Provider.of<Loginprovider>(context);
     return Scaffold(
         body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key:formKey ,
              child: Column(
                children: [
                  SizedBox(height: 120,),
                  Text("Welcome back",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                  Text("Enter your credentials to login"),
                  SizedBox(height: 30,),
                 
                  CustomTextField(obsecure: false,preIcon: Icons.email, labell: "Email",TextController: EmailController,
                   validate:(EmailController){
                    if(EmailController==null){
                      return "value can not be null";
                    }
                    if(EmailController.isEmpty){
                      return "value can not be empty";
                    }
                    if(EmailController.contains("@")==false){
                      return "Invalid email format";
                    }
                    return null;
                  },
                  ),
                  SizedBox(height: 10,),
                  CustomTextField(preIcon: Icons.lock, labell: "Password",
                  sufIcon: providerob.ishidden? Icons.visibility_off:Icons.visibility,
                  onPressedsuffix: providerob.toggle,
                  obsecure: providerob.ishidden?true:false,
                  TextController: PasswordController,
                   validate:(PasswordController){
                    if(PasswordController==null){
                      return "value can not be null";
                    }
                    if(PasswordController.isEmpty){
                      return "value can not be empty";
                    }
                    if(PasswordController.length<6){
                      return "Enter more than 6 characters";
                    }
                    return null;
                  },
                  ),
                 SizedBox(height: 10,),
                 Row(
                   children: [
                     RadioMenuButton(value: "Male", groupValue: providerob.gender, onChanged: providerob.Gender, child: Text("Male")),
                     SizedBox(width: 4,),
                      RadioMenuButton(value: "Female", groupValue: providerob.gender, onChanged: providerob.Gender, child: Text("Female")),
                   ],
                 ),
                
                  SizedBox(height:30,),
                  Customelevatedbutton(onPressed: ()async{
                    if(formKey.currentState!.validate()){
                        await LoginObj.LoginRequestProvider(EmailController.text, PasswordController.text);

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(LoginObj.signupmodel!.message)));
                
                     
                    }
                  },text: "Login",),
                  SizedBox(height:40,),
                  Divider(endIndent:20 , indent: 20,),
                  SizedBox(height:30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Do not have an account? "),
                      SizedBox(width: 3,),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                      }, child: Text("Sign Up",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold,fontSize: 17),))
                    ],
                  )
                ],
              ),
            ),
          ),
         ),
       
    );
  }
}