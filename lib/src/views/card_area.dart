import 'package:flutter/material.dart';
import 'package:practica_api/src/models/area.dart';
import 'package:practica_api/src/network/api.dart';
import 'package:practica_api/src/screens/meal_list.dart';

class CardArea extends StatelessWidget
{
  const CardArea
  (
    {
      Key key,
      @required this.api,
      @required this.area
    }
  ) : super(key: key);

  final Api api;
  final Area area;
  
  @override
  Widget build(BuildContext context)
  {
    return Container
    (
      width: 200,
      height: 200,
      margin: EdgeInsets.symmetric
      (
        horizontal: 10,
        vertical: 10
      ),
      decoration: BoxDecoration
      (
        color: Colors.white,
        shape: BoxShape.rectangle,
        border: Border.all
        (
          width: 4,
          color: Color.fromARGB(255, 214, 199, 141)
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow:
        [
          BoxShadow
          (
            color:Colors.black54,
            offset: Offset(5,3),
            blurRadius: 5
          )
        ]
      ),
      child: FlatButton
      (
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          [
            Container
            (
              decoration: BoxDecoration
              (
                border: Border.all
                (
                  width: 1,
                  color: Color.fromARGB(255, 214, 199, 141)
                ),
              ),
              child: FadeInImage
              (
                height: 100,
                placeholder: AssetImage('images/loading.gif'),
                image: AssetImage('images/${area.strArea}.png'),
                fadeInDuration: Duration(milliseconds: 500),
                fit: BoxFit.cover
              )
            ),
            Text
            (
              area.strArea,
              style: TextStyle
              (
                color: Color.fromARGB(255, 216, 150, 83),
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            )
          ]
        ),
        onPressed: ()
        {
          Navigator.push
          (
            context,
            MaterialPageRoute(builder: (context) => MealList(category: null, area: area, letter: null))
          );
        }
      )
    );
  }
}