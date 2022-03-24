import 'dart:convert';

import 'package:http/http.dart' as http;

class Networking {
  List popular = [];
  List trending = [];

  static String popularURL =
      'https://api.themoviedb.org/3/movie/popular?api_key=3d2efec41fc6f02fceb55521eac92e7d';
  static String trendingURL =
      'https://api.themoviedb.org/3/trending/all/day?api_key=3d2efec41fc6f02fceb55521eac92e7d';

  Future getPopular() async {
    http.Response response = await http.get(Uri.parse(popularURL));
    if (response.statusCode == 200) {
      var data = response.body;
      var decodedData = json.decode(data);
      var popular = decodedData['results'];
      return popular;
    } else {
      throw 'An error occured!';
    }
  }

  Future getTrending() async {
    http.Response response = await http.get(Uri.parse(trendingURL));
    if (response.statusCode == 200) {
      var data = response.body;
      var decodedData = json.decode(data);
      var trending = decodedData['results'];
      return trending;
    } else {
      throw 'An error occured!';
    }
  }
}
