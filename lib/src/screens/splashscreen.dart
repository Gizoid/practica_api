import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'inicio.dart';

class splashscreen extends StatefulWidget
{
  splashscreen({Key key}) : super(key: key);

  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen>
{
  ImageProvider<Object> imageBackground;
  @override
  Widget build(BuildContext context)
  {
    return SplashScreen
    (
      seconds: 3,
      navigateAfterSeconds: Inicio(),
      imageBackground: AssetImage("images/Chefcito.jpg"),
      useLoader: false
    );
  }
}