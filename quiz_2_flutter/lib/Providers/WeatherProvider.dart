import 'package:flutter/foundation.dart';
import 'package:quiz_2_flutter/Models/WeatherModel.dart';
import 'package:quiz_2_flutter/Services/WeatherService.dart';

class Weatherprovider extends ChangeNotifier {

  Weathermodel? weathermodel;
  getWeatherProvider()async{
weathermodel=await Weatherservice.GetWhether();
notifyListeners();
  }
}