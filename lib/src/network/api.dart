import 'dart:convert';
import "package:http/http.dart" show Client;
import 'package:practica_api/src/models/area.dart';
import 'package:practica_api/src/models/category.dart';
import 'package:practica_api/src/models/meal.dart';

class Api
{
  final String URL_CATEGORY = "https://www.themealdb.com/api/json/v1/1/categories.php";
  final String URL_AREA = "https://www.themealdb.com/api/json/v1/1/list.php?a=list";
  final String URL_MEAL_LETTER = "https://www.themealdb.com/api/json/v1/1/search.php?f=";
  final String URL_MEAL_CAT = "https://www.themealdb.com/api/json/v1/1/filter.php?c=";
  final String URL_MEAL_AREA = "https://www.themealdb.com/api/json/v1/1/filter.php?a=";
  final String URL_MEAL = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=";
  final String URL_RANDOM = "https://www.themealdb.com/api/json/v1/1/random.php";
  Client http = new Client();

  Future<List<CATEGORY>> getCategory() async
  {
    final response = await http.get(URL_CATEGORY);
    if(response.statusCode == 200)
    {
      var categories = jsonDecode(response.body)['categories'] as List;
      List<CATEGORY> listCategories = categories.map((category) => CATEGORY.fromJSON(category)).toList();
      return listCategories;
    }
    else
    {
      return null;
    }
  }

  Future<List<Area>> getArea() async
  {
    final response = await http.get(URL_AREA);
    if(response.statusCode == 200)
    {
      var areas = jsonDecode(response.body)['meals'] as List;
      List<Area> listAreas = areas.map((area) => Area.fromJSON(area)).toList();
      return listAreas;
    }
    else
    {
      return null;
    }
  }

  Future<List<Meal>> getMeals(CATEGORY category, Area area, String letter) async
  {
    dynamic response;
    if(letter != null)
    {
      response = await http.get(URL_MEAL_LETTER+letter);
    }
    if(category != null)
    {
      response = await http.get(URL_MEAL_CAT+category.strCategory);
    }
    if(area != null)
    {
      response = await http.get(URL_MEAL_AREA+area.strArea);
    }
    if(response.statusCode == 200)
    {
      var meals = jsonDecode(response.body)['meals'] as List;
      List<Meal> listMeals = meals.map((meal) => Meal.fromJSON(meal)).toList();
      return listMeals;
    }
    else
    {
      return null;
    }
  }

  Future<List<Meal>> getMeal(String idMeal) async
  {
    dynamic response = await http.get(URL_MEAL+idMeal);
    if(response.statusCode == 200)
    {
      var m = jsonDecode(response.body)['meals'] as List;
      List<Meal> listMeals = m.map((meal) => Meal.fromJSON_R(meal)).toList();
      return listMeals;
    }
    else
    {
      return null;
    }
  }
  
  Future<List<Meal>> getRandomMeal() async
  {
    final response = await http.get(URL_RANDOM);
    if(response.statusCode == 200)
    {
      var meals = jsonDecode(response.body)['meals'] as List;
      List<Meal> listMeals = meals.map((meal) => Meal.fromJSON_R(meal)).toList();
      return listMeals;
    }
    else
    {
      return null;
    }
  }
}