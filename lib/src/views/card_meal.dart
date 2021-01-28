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
    return Container
    (
      margin: EdgeInsets.symmetric
      (
        horizontal: 10,
        vertical: 5
      ),
      decoration: BoxDecoration
      (
        borderRadius: BorderRadius.circular(15),
        boxShadow:
        [
          BoxShadow
          (
            color:Colors.black54,
            offset: Offset(0,.5),
            blurRadius: 1
          )
        ]
      ),
      child: ClipRRect
      (
        borderRadius: BorderRadius.circular(10),
        child: Stack
        (
          alignment: Alignment.bottomCenter,
          children: 
          [
            Container
            (
              child: FadeInImage
              (
                placeholder: AssetImage('images/activity_indicator.gif'),
                image: NetworkImage('${meal.strMealThumb}'),
                fadeInDuration: Duration(milliseconds: 500)
              )
            ),
            Opacity
            (
              opacity: .5,
              child: Container
              (
                height: 50,
                color: Colors.black,
                child: Padding
                (
                  padding: const EdgeInsets.all(10),
                  child: Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                    [
                      Text
                      (
                        meal.strMeal,
                        style: TextStyle
                        (
                          color: Colors.white
                        ),
                      ),
                      FlatButton
                      (
                        child: Icon
                        (
                          Icons.chevron_right,
                          color: Colors.white
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
                    ]
                  )
                )
              )
            )
          ]
        )
      )
    );
  }
}