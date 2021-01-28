import 'package:flutter/material.dart';
import 'package:practica_api/src/models/category.dart';
import 'package:practica_api/src/network/api.dart';
import 'package:practica_api/src/screens/meal_list.dart';

class CardCategory extends StatelessWidget
{
  const CardCategory
  (
    {
      Key key,
      @required this.api,
      @required this.category
    }
  ) : super(key: key);

  final Api api;
  final CATEGORY category;
  
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
        color: Colors.deepOrange[100],
        shape: BoxShape.rectangle,
        border: Border.all
        (
          width: 5.0,
          color: Colors.brown
        ),
        borderRadius: BorderRadius.circular(15),
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
              child: FadeInImage
              (
                placeholder: AssetImage('images/activity_indicator.gif'),
                image: NetworkImage('${category.strCategoryThumb}'),
                fadeInDuration: Duration(milliseconds: 500),
                fit: BoxFit.cover
              )
            ),
            Text
            (
              category.strCategory,
              style: TextStyle
              (
                color: Colors.brown[800],
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
            MaterialPageRoute(builder: (context) => MealList(category: category, area: null, letter: null))
          );
        }
      )
    );
  }
}