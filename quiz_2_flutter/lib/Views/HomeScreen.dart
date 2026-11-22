import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:quiz_2_flutter/Providers/WeatherProvider.dart';
import 'package:quiz_2_flutter/Views/Details.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Weather App",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),

      body: Consumer<Weatherprovider>(
        builder: (context, value, child){

        if(value.weathermodel==null){
            value.getWeatherProvider();
          return Center(child: CircularProgressIndicator(),);
        }

          return ListView.builder(
            itemCount: value.weathermodel!.country.length
          ,
            itemBuilder: (context, index) => GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Details(name: value.weathermodel!.country[index]["name"], temp: value.weathermodel!.country[index]["tempreature"], weatherCondition: value.weathermodel!.country[index]["weatherCondition"]),));
              },
              child: Card(
              elevation: 3,
               child: ListTile(
              leading: Image.network("${value.weathermodel!.country[index]["countryImageUrl"]}"),
              title: Text("${value.weathermodel!.country[index]["name"]}",style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("${value.weathermodel!.country[index]["tempreature"]}°C"),
                           ),
                          
                          
                          ),
            ),
          );
        }
      

      
      
      ),
    );
  }
}

