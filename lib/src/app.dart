import 'package:flutter/material.dart';
import 'package:practica_api/src/screens/splashscreen.dart';

class MyApp extends StatelessWidget
{
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      routes:
      {
        
      },
      home: splashscreen()
    );
  }
}