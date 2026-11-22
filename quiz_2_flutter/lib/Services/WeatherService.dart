import 'package:dio/dio.dart';
import 'package:quiz_2_flutter/Models/WeatherModel.dart';

class Weatherservice {

static Dio dio=Dio();

static Future<Weathermodel> GetWhether()async{

  Response response =await dio.get("https://iats.runasp.net/api/Country/GetCountries");

  return Weathermodel.fromJson(response.data);
}

}