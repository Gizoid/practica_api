import 'package:flutter/material.dart';
import 'package:practica_api/src/models/area.dart';
import 'package:practica_api/src/models/category.dart';
import 'package:practica_api/src/models/meal.dart';
import 'package:practica_api/src/network/api.dart';
import 'package:practica_api/src/views/card_meal.dart';

class MealList extends StatefulWidget
{
  CATEGORY category;
  Area area;
  String letter;
  MealList({Key key, this.category, this.area, this.letter}) : super(key: key);

  @override
  _MealListState createState() => _MealListState(category: category, area: area, letter: letter);
}

class _MealListState extends State<MealList>
{
  Api api;

  @override
  void initState()
  {
    super.initState();
    api = Api();
  }

  CATEGORY category;
  Area area;
  String letter;

  _MealListState({this.category, this.area, this.letter});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Container
        (
          decoration: BoxDecoration
          (
            color: Colors.white,
            border: Border.all
            (
              width: 3,
              color: Color.fromARGB(255, 214, 199, 141)
            )
          ),
          width: 600,
          height: 40,
          alignment: Alignment.center,
          child: Text
          (
            "Meals",
            textAlign: TextAlign.center,
            style: TextStyle
            (
              fontWeight: FontWeight.w900,
              color: Color.fromARGB(255, 216, 150, 83)
            )
          )
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 224, 144, 143)
      ),
      body: FutureBuilder
      (
        future: api.getMeals(category,area,letter),
        builder: (BuildContext context, AsyncSnapshot<List<Meal>> snapshot)
        {
          if(snapshot.hasError)
          {
            return Center
            (
              child: Text("Has error in this request :(")
            );
          }
          else
          {
            if(snapshot.connectionState == ConnectionState.done)
            {
              return _listMeal(snapshot.data);
            }
            else
            {
              return Center
              (
                child: CircularProgressIndicator()
              );
            }
          }
        }
      )
    );
  }

  Widget _listMeal(List<Meal> meals)
  {
    return ListView.builder
    (
      itemBuilder: (context, index)
      {
        Meal meal = meals[index];
        return CardMeal
        (
          api: api,
          meal: meal
        );
      },
      itemCount: meals.length
    );
  }
}