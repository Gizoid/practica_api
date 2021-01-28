import 'package:flutter/material.dart';
import 'package:practica_api/src/models/meal.dart';
import 'package:practica_api/src/network/api.dart';
import 'package:url_launcher/url_launcher.dart';

class Receta extends StatelessWidget
{
  Api api;
  String idMeal;
  bool random;
  Meal meal;
  int n=1;
  Receta({Key key, this.api, this.idMeal, this.random}) : super(key: key);

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
            "Recipe",
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
        future: mealType(random),
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
              return _listInfo(snapshot.data);
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

  Future<List<Meal>> mealType(bool random)
  {
    if(random)
    {
      return api.getRandomMeal();
    }
    else
    {
      return api.getMeal(idMeal);
    }
  }

  Widget _listInfo(List<Meal> meals)
  {
    return ListView.builder
    (
      itemBuilder: (context, index)
      {
        Meal meal = meals[index];
        return Column
        (
          children: 
          [
            Image.network('${meal.strMealThumb}'),
            SizedBox(height: 20),
            Text(meal.strMeal, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text("Area:   ${meal.strArea}"),
            SizedBox(height: 10),
            Text("Category:   ${meal.strCategory}"),
            SizedBox(height: 20),
            Text("Ingredients:"),
            SizedBox(height: 10),
            Padding
            (
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row
              (
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:
                [
                  ingredients
                  (
                    1,
                    [
                      meal.strIngredient1,
                      meal.strIngredient2,
                      meal.strIngredient3,
                      meal.strIngredient4,
                      meal.strIngredient5,
                      meal.strIngredient6,
                      meal.strIngredient7,
                      meal.strIngredient8,
                      meal.strIngredient9,
                      meal.strIngredient10,
                      meal.strIngredient11,
                      meal.strIngredient12,
                      meal.strIngredient13,
                      meal.strIngredient14,
                      meal.strIngredient15,
                      meal.strIngredient16,
                      meal.strIngredient17,
                      meal.strIngredient18,
                      meal.strIngredient19,
                      meal.strIngredient20
                    ]
                  ),
                  SizedBox(width: 5),
                  ingredients(2, null),
                  SizedBox(width: 5),
                  ingredients
                  (
                    3,
                    [
                      meal.strMeasure1,
                      meal.strMeasure2,
                      meal.strMeasure3,
                      meal.strMeasure4,
                      meal.strMeasure5,
                      meal.strMeasure6,
                      meal.strMeasure7,
                      meal.strMeasure8,
                      meal.strMeasure9,
                      meal.strMeasure10,
                      meal.strMeasure11,
                      meal.strMeasure12,
                      meal.strMeasure13,
                      meal.strMeasure14,
                      meal.strMeasure15,
                      meal.strMeasure16,
                      meal.strMeasure17,
                      meal.strMeasure18,
                      meal.strMeasure19,
                      meal.strMeasure20
                    ]
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text("Instructions:\n\n"),
            Padding
            (
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text
              (
                meal.strInstructions,
                textAlign: TextAlign.justify
              )
            ),
            SizedBox(height: 20),
            Row
            (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:
              [
                button(meal.strYoutube,1),
                button(meal.strSource,2)
              ]
            ),
            SizedBox(height: 20)
          ]
        );
      },
      itemCount: meals.length
    );
  }

  Text ingredients(int col, List<String> list)
  {
    Text text;
    String str="";
    for(int i=1;i<=n;i++)
    {
      switch(col)
      {
        case 1:
          if(list[i] != null && list[i] != "")
          {
            str+=list[i]+"\n";
            n++;
          }
          else
          {
            n--;
          }
          text = Text(str, textAlign: TextAlign.left);
          break;
        case 2:
          str+="---------->\n";
          text = Text(str, textAlign: TextAlign.center);
          break;
        case 3:
          str+=list[i]+"\n";
          text = Text(str, textAlign: TextAlign.right);
      }
    }
    return text;
  }

  Widget button(String url, int n)
  {
    FlatButton button;
    Column column;
    if(n == 1)
    {
      column = Column
      (
        children:
        [
          Image.asset('images/logoYT.png', height: 50),
          Text("Watch video")
        ]
      );
    }
    else
    {
      column = Column
      (
        children:
        [
          Icon(Icons.link, size: 50),
          Text("Source")
        ]
      );
    }
    if(url != null && url != "")
    {
      button = FlatButton
      (
        onPressed: () => abrirWeb(url),
        child: column
      );
    }
    else
    {
      return SizedBox(width:0);
    }
    return button;
  }

  abrirWeb(String url) async
  {
    if(await canLaunch(url))
    {
      await launch(url);
    }
  }
}