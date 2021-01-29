import 'package:flutter/material.dart';
import 'package:practica_api/src/models/meal.dart';
import 'package:practica_api/src/network/api.dart';
import 'package:practica_api/src/screens/receta.dart';

class CardMeal extends StatelessWidget
{
  const CardMeal
  (
    {
      Key key,
      @required this.api,
      @required this.meal
    }
  ) : super(key: key);

  final Api api;
  final Meal meal;
  
  @override
  Widget build(BuildContext context)
  {
    return Column
    (
      children: 
      [
        Container
        (
          width: 250,
          height: 250,
          margin: EdgeInsets.only(top: 15),
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
            child: ClipRRect
            (
              borderRadius: BorderRadius.circular(5),
              child: FadeInImage
              (
                height: 200,
                placeholder: AssetImage('images/loading.gif'),
                image: NetworkImage('${meal.strMealThumb}'),
                fadeInDuration: Duration(milliseconds: 500),
                fit: BoxFit.cover
              )
            ),
            onPressed: ()
            {
              Navigator.push
              (
                context,
                MaterialPageRoute(builder: (context) => Receta(api: api, idMeal: meal.idMeal, random: false))
              );
            }
          )
        ),
        Padding
        (
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text
          (
            meal.strMeal,
            style: TextStyle
            (
              color: Color.fromARGB(255, 216, 150, 83),
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center
          )
        )
      ]
    );
  }
}