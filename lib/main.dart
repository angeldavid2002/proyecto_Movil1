import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_web/vistas/registroTendero.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tu tendero amigo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: RegistroTendero(),
    );
  }
}
