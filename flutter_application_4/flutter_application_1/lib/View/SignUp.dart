import 'package:flutter/material.dart';
import 'package:flutter_application_1/View/Login.dart';

class SignUp extends StatelessWidget {
final TextEditingController text1=TextEditingController();
final TextEditingController text2=TextEditingController();
final TextEditingController text3=TextEditingController();
final TextEditingController text4=TextEditingController();
final GlobalKey<FormState> key1=GlobalKey<FormState>();

   SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Padding(
      
       padding: const EdgeInsets.all(10.0),
       child: Center(
       child:Column(
        children: [
          SizedBox(height: 50,),
          Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
          Text("Create Your Account",),
          SizedBox(height: 30,),
          Form(child:Column(
            key: key1,
            children: [
              TextFormField(
                controller: text1,
                validator: (value) {
       
                 if(value!.isEmpty){
                  return "Value Can not be null";
                 }
                   return null;
                },
                decoration: InputDecoration(
                 filled: true,
                 fillColor: const Color.fromARGB(255, 226, 132, 239),
                 prefixIcon: Icon(Icons.person,color:const Color.fromARGB(255, 138, 13, 172) ,),
                 hint:Text("UserName"),
                
                ), ),
                SizedBox(height: 20,),
                TextFormField(
                  validator: (value) {
       
                 if(value!.isEmpty){
                  return "Value Can not be null";
                 }
                 if(value.contains("@")==false){
                  return "Email format invalid";
                 }
                   return null;
                },
                  controller: text2,
                decoration: InputDecoration(
                 filled: true,
                 fillColor: const Color.fromARGB(255, 226, 132, 239),
                 prefixIcon: Icon(Icons.email,color:const Color.fromARGB(255, 138, 13, 172) ,),
                 hint:Text("Email"),
                
                ), ),
                SizedBox(height: 20,),
                TextFormField(
                   validator: (value) {
       
                 if(value!.isEmpty){
                  return "Value Can not be null";
                 }
                 if(value.length<6){
                  return "Not allowed less than 6 digets";
                 }
                  return null;
                },
                controller: text3,
                decoration: InputDecoration(
                 filled: true,
                 fillColor: const Color.fromARGB(255, 226, 132, 239),
                 prefixIcon: Icon(Icons.lock,color:const Color.fromARGB(255, 138, 13, 172) ,),
                 hint:Text("Password"),
                
                ), ),
                SizedBox(height: 20,),
                 
                TextFormField(
                  
                 validator: (value) {
       
                 if(value!.isEmpty){
                  return "Value Can not be null";
                 }
                 if(value.length<6){
                  return "Not allowed less than 6 digets";
                 }
                  return null;

                },
                controller: text4,
                decoration: InputDecoration(
                 filled: true,
                 fillColor: const Color.fromARGB(255, 226, 132, 239),
                 prefixIcon: Icon(Icons.lock,color:const Color.fromARGB(255, 138, 13, 172) ,),
                 hint:Text("Confirm Password"),
                
                ), ),
                SizedBox(height: 30,),
                ElevatedButton(onPressed: (){
                      if(key1.currentState!.validate()){
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Created Successfuly!!")));
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                      }

                }, child: Text("Sign Up",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 138, 13, 172),minimumSize: Size(400, 40))),
                Divider(thickness: 3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    SizedBox(width: 9,),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                    }, child: Text("Login",style:TextStyle(fontWeight: FontWeight.bold,color:const Color.fromARGB(255, 138, 13, 172))))
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