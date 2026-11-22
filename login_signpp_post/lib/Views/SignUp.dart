import 'package:flutter/material.dart';
import 'package:login_signpp_post/Componentes/CustomElevatedButton.dart';
import 'package:login_signpp_post/Componentes/CustomTextFormField.dart';
import 'package:login_signpp_post/Providers/SignUpProvider.dart';
import 'package:login_signpp_post/Views/Login.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  GlobalKey<FormState>formKey =GlobalKey<FormState>();
   TextEditingController UserNameController=TextEditingController();
   TextEditingController EmailController=TextEditingController();
   TextEditingController PasswordController=TextEditingController();
   TextEditingController PhoneController=TextEditingController();
   SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Signupprovider providerobj =Provider.of<Signupprovider>(context,listen: false);
    return Scaffold(
         body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key:formKey ,
              child: Column(
                children: [
                  SizedBox(height: 75,),
                  Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                  Text("Create your account"),
                  SizedBox(height: 30,),
                  CustomTextField(obsecure: false,preIcon: Icons.person, labell: "UserName",TextController: UserNameController,
                  validate:(UserNameController){
                    if(UserNameController==null){
                      return "value can not be null";
                    }
                    if(UserNameController.isEmpty){
                      return "value can not be empty";
                    }
                    return null;
                  },
                  ),
                  SizedBox(height: 10,),
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
                  CustomTextField(obsecure: false,preIcon: Icons.lock, labell: "Password",sufIcon: Icons.remove_red_eye_outlined,TextController: PasswordController,
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
                  CustomTextField(obsecure: false,preIcon: Icons.lock, labell: "Phone",TextController: PhoneController,
                   validate:(PhoneController){
                    if(PhoneController==null){
                      return "value can not be null";
                    }
                    if(PhoneController.isEmpty){
                      return "value can not be empty";
                    }
                    if(PhoneController.length<11){
                      return "phone must be 11 characters";
                    }
                    return null;
                  },
                  ),
                  SizedBox(height:30,),
                  Customelevatedbutton(onPressed: ()async{
                    if(formKey.currentState!.validate()){
                   await providerobj.signUpRequestprovider(UserNameController.text, EmailController.text, PasswordController.text, PhoneController.text);
                    
                    if(providerobj.signupmodel!.status==true){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("${providerobj.signupmodel!.message}")));
                    }else{
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("${providerobj.signupmodel!.message}")));
                    }
                   
                    }
                   
                    
                  },text: "Sign Up",),
                  SizedBox(height:40,),
                  Divider(endIndent:20 , indent: 20,),
                  SizedBox(height:30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Already have an account? "),
                      SizedBox(width: 3,),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                      }, child: Text("Login",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold,fontSize: 17),))
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