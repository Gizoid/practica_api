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
        vertical: 5
      ),
      decoration: BoxDecoration
      (
        borderRadius: BorderRadius.circular(15),
        boxShadow:
        [
          BoxShadow
          (
            color:Colors.orange[200],
            offset: Offset(0,.5),
            blurRadius: 5
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
              decoration: BoxDecoration
              (
                color: Colors.orange[200],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all
                (
                  width: 5.0,
                  color: Colors.brown
                )
              ),
              child: FadeInImage
              (
                placeholder: AssetImage('images/activity_indicator.gif'),
                image: AssetImage('images/${area.strArea}.png'),
                fadeInDuration: Duration(milliseconds: 500),
                fit: BoxFit.cover
              )
            ),
            Opacity
            (
              opacity: .5,
              child: Container
              (
                width: 250,
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
                        area.strArea,
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
                            MaterialPageRoute(builder: (context) => MealList(category: null, area: area, letter: null))
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