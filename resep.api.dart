import 'dart:convert';
import 'package:cook/model/resep.api.dart';
import 'package:http/http.dart' as http;
import 'package:cook/model/resep.dart';

class ResepApi {
// const req = unirest("GET", "https://yummly2.p.rapidapi.com/feeds/list");

// req.query({
// 	"limit": "24",
// 	"start": "0"
// });

// req.headers({
  // "X-RapidAPI-Key": "a6367a9620msh6775ed1035008afp15e53cjsna34505081f8c",
  // "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
  // "useQueryString": true
// });

  static Future<List<Resep>> getResep() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"start": "0", "limit": "18", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "a6367a9620msh6775ed1035008afp15e53cjsna34505081f8c",
      "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);

    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }
    return Resep.resepFromSnapshot(_temp);
  }
}
