import 'package:flutter/material.dart';
import 'package:practica_api/src/models/area.dart';
import 'package:practica_api/src/models/category.dart';
import 'package:practica_api/src/network/api.dart';
import 'package:practica_api/src/screens/receta.dart';
import 'package:practica_api/src/views/card_area.dart';
import 'package:practica_api/src/views/card_category.dart';

import 'meal_list.dart';

class Inicio extends StatefulWidget
{
  Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio>
{
  Api api;
  List<String> letters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","R","S","T","V","W","Y"];

  @override
  void initState()
  {
    super.initState();
    api = Api();
  }

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
      backgroundColor: Color.fromARGB(255, 231, 222, 189),
      body: ListView
      (
        children: 
        [
          Padding
          (
            padding: const EdgeInsets.all(10),
            child: Text("Search by first letter...")
          ),
          Container
          (
            height: 50,
            child: ListView.builder
            (
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index)
              {
                String letter = letters[index];
                return FlatButton
                (
                  child: Text(letter),
                  onPressed: ()
                  {
                    Navigator.push
                    (
                      context,
                      MaterialPageRoute(builder: (context) => MealList(category: null, area: null, letter: letter))
                    );
                  }
                );
              },
              itemCount: letters.length
            )
          ),
          SizedBox(height: 10),
          Padding
          (
            padding: const EdgeInsets.all(10),
            child: Text('Categories')
          ),
          Container
          (
            height: 150,
            child: FutureBuilder
            (
              future: api.getCategory(),
              builder: (BuildContext context, AsyncSnapshot<List<CATEGORY>> snapshot)
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
                    return _listCategory(snapshot.data);
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
            ),
          ),
          SizedBox(height: 10),
          Padding
          (
            padding: const EdgeInsets.all(10),
            child: Text('Areas')
          ),
          Container
          (
            height: 150,
            child: FutureBuilder
            (
              future: api.getArea(),
              builder: (BuildContext context, AsyncSnapshot<List<Area>> snapshot)
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
                    return _listArea(snapshot.data);
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
            ),
          ),
          SizedBox(height: 10),
          FlatButton
          (
            child: Text("???"),
            onPressed: ()
            {
              Navigator.push
              (
                context,
                MaterialPageRoute(builder: (context) => Receta(api: api,idMeal: null, random: true))
              );
            },
          )
        ]
      )
    );
  }

  Widget _listCategory(List<CATEGORY> categories)
  {
    return ListView.builder
    (
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index)
      {
        CATEGORY category = categories[index];
        return CardCategory
        (
          api: api,
          category: category
        );
      },
      itemCount: categories.length
    );
  }

  Widget _listArea(List<Area> areas)
  {
    return ListView.builder
    (
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index)
      {
        Area area = areas[index];
        return CardArea
        (
          api: api,
          area: area
        );
      },
      itemCount: areas.length
    );
  }
}