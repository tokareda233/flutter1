import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_2_flutter/Componentes/CustomElevatedButton.dart';
import 'package:quiz_2_flutter/Componentes/CustomTextFormField.dart';
import 'package:quiz_2_flutter/Providers/AuthProvider.dart';
import 'package:quiz_2_flutter/Views/Login.dart';

class Signup extends StatelessWidget {
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  TextEditingController UserNameController=TextEditingController();
  TextEditingController EmailController=TextEditingController();
  TextEditingController PasswordController=TextEditingController();
  TextEditingController ConfirmPasswordController=TextEditingController();
  TextEditingController PhoneController=TextEditingController();
   Signup({super.key});

  @override
  Widget build(BuildContext context) {
    Authprovider authproviderobj=Provider.of<Authprovider>(context,listen: false);
    return Scaffold(

      appBar: AppBar(
        title: Text("Sign Up",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
          
          children: [
            SizedBox(height: 25,),
            CircleAvatar(child: Icon(Icons.person_add_alt,size: 50,),radius: 60,backgroundColor: const Color.fromARGB(255, 233, 228, 228),),
            SizedBox(height: 10,),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Customtextformfield(Label: "UserName", controller: UserNameController, preIcon: Icons.person,
                  validator: (UserNameController){
                    if(UserNameController==null){
                      return "Value Can not be null";
                    }
                    if(UserNameController.isEmpty){
                      return "Value Can not be empty";
                    }
                    return null;
                  }
                  ),
                  SizedBox(height: 6,),
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
                  SizedBox(height: 6,),
                  Customtextformfield(Label: "phone", controller: PhoneController, preIcon: Icons.lock,
                  validator: (PhoneController){
                    if(PhoneController==null){
                      return "Value Can not be null";
                    }
                    if(PhoneController.isEmpty){
                      return "Value Can not be empty";
                    }
                    if(PhoneController.length<11){
                      return "must be more than 11 degits";
                    }
                    return null;
                  }
                  ),
                  SizedBox(height: 6,),
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
                  SizedBox(height: 6,),
                   Customtextformfield(Label: "ConfirmPassword", controller: ConfirmPasswordController,suxIcon: Icons.visibility_off, preIcon: Icons.lock,
                  validator: (ConfirmPasswordController){
                    if(ConfirmPasswordController==null){
                      return "Value Can not be null";
                    }
                    if(ConfirmPasswordController.isEmpty){
                      return "Value Can not be empty";
                    }
                    if(ConfirmPasswordController!=PasswordController.text){
                      return "Un Matched Password";
                    }
                    return null;
                  }
                  ),
                  SizedBox(height: 15,),
                  Customelevatedbutton(onPressed: ()async{
                    if(formKey.currentState!.validate()){
                      await authproviderobj.signUpProviderRequest(UserNameController.text, EmailController.text, PhoneController.text, PasswordController.text);

                      if(authproviderobj.signUpmodel!.status==true){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(authproviderobj.signUpmodel!.message)));
                      }else{
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(authproviderobj.signUpmodel!.message)));
                      }
                    }

                    
                  }, text: "Sign Up"),

                 


                ],
              ),
            ),
           
             Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  Text("Already have an account?  ",style: TextStyle(fontWeight: FontWeight.bold),),
                  TextButton(onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                  }, child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange),),)
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