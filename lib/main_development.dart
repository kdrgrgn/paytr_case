import 'package:flutter/material.dart';
import 'package:paytr_case/main.dart';


const String flavorName = 'development';
void main() async {
  await init(flavorName: flavorName);

runApp(MyApp());
}
