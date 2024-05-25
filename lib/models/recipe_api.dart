// import 'dart:convert';
import 'dart:convert';

import 'package:food_recie/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https(
        'yummly2.p.rapidapi.com', '/feeds/list', {"limit": "24", "start": "0"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "888aea8a6cmsh83f783a3c61195bp1845cejsn799632cbbede",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body)as Map<String, dynamic>;
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}
