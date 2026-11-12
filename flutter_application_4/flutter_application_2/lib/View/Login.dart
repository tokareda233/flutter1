import 'package:flutter/material.dart';
import 'package:flutter_application_2/View/HomePage.dart';

class Login extends StatelessWidget {
final TextEditingController text1=TextEditingController();
final TextEditingController text2=TextEditingController();
final GlobalKey<FormState> key1=GlobalKey<FormState>();

   Login({super.key});

  final String email="Toka@gmail.com";
  final String password="12345689";

  @override
  Widget build(BuildContext context) {
        return Scaffold(
     body: Padding(
      
       padding: const EdgeInsets.all(10.0),
       child: Center(
       child:Column(
        children: [
          SizedBox(height: 50,),
          Text("Welcome Back",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
          Text("Enter your credential to login",),
          SizedBox(height: 30,),
          Form(
             key: key1,
            child:Column(
           
            children: [
              TextFormField(
                controller: text1,
                validator: (value) {
                 if(value==null){
                  return "value can not be null";
                 }
                 if(value!=email){
                  return "Email in correct";
                 }
                   return null;
                },
                decoration: InputDecoration(
                 filled: true,
                 fillColor: const Color.fromARGB(255, 226, 132, 239),
                 prefixIcon: Icon(Icons.person,color:const Color.fromARGB(255, 138, 13, 172) ,),
                 hint:Text("Email"),
                 border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(19.0),
                  borderSide: BorderSide.none
                 )
                
                ), ),
                SizedBox(height: 20,),
              
             
                TextFormField(
                   validator: (value) {
                if(value==null){
                  return "value can not be null";
                 }
                  if(value!=password){
                  return "password in correct";
                 }
                   return null;
                },
                controller: text2,
                decoration: InputDecoration(
                 filled: true,
                 fillColor: const Color.fromARGB(255, 226, 132, 239),
                 prefixIcon: Icon(Icons.lock,color:const Color.fromARGB(255, 138, 13, 172) ,),
                 hint:Text("Password"),
                 border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(19.0),
                  borderSide: BorderSide.none
                 )
                
                ), ),
                
                SizedBox(height: 30,),
                ElevatedButton(onPressed: (){
                      if(key1.currentState!.validate()){
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successfuly!!")));
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                      }

                }, child: Text("Login",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 138, 13, 172),minimumSize: Size(400, 40))),
                Divider(thickness: 3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Don not have an account?"),
                    SizedBox(width: 9,),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                    }, child: Text("Sign Up",style:TextStyle(fontWeight: FontWeight.bold,color:const Color.fromARGB(255, 138, 13, 172))))
                  ],
                )
            ],
          )
          
          
          )
       
        ],
       
       
       ),
       
       ),
     ),


    );
  }
}