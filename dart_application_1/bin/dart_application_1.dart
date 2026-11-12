import 'dart:io';

import 'package:dart_application_1/dart_application_1.dart' as dart_application_1;

void main(List<String> arguments) {
  print('Hello world: ${dart_application_1.calculate()}!');


  int i=5;
  print('int is: ${i}');

   print('Please enter string');

  String? s=stdin.readLineSync();
  print('string is: ${s}');


}
