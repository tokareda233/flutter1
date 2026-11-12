import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const  MyApp({super.key});

@override 
   Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppPar(),
    );
   }

}

class AppPar extends StatelessWidget{
   const  AppPar({super.key});

   
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        title:Text("Simple Example"),
         backgroundColor: const Color.fromARGB(255, 235, 101, 5),
         centerTitle: true,
         leading: Icon(Icons.menu),
         actions: [Icon(Icons.info),Icon(Icons.settings)],
        
         
        ),
        body:,
        

       
    
      );
  }
  
}
