import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Details extends StatelessWidget {
  String name;
  String weatherCondition;
  String temp;
   Details({super.key,required this.name,required this.temp,required this.weatherCondition});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        title: Text(name,style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Card(
            elevation: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(60.0),
                  child: CircleAvatar(child: Icon(Icons.cloud,size: 60,),radius: 80,backgroundColor: const Color.fromARGB(255, 242, 232, 244),),
                ),
                 SizedBox(height: 10,),
                Text(name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                 SizedBox(height: 15,),
                 Text("Weather: ${weatherCondition}",style: TextStyle(fontSize: 20),),
                SizedBox(height: 15,),
                 Text("Teamperature: ${temp}°C",style: TextStyle(fontSize: 20),),
              ],
            ),
          ),
        ),
      )
    );
  }
}
