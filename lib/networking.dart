import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/controllers/fast_laghs_controller.dart';

class Networking {
  FastLaughsController fastLaughsController = Get.put(FastLaughsController());
  
  List trending = [];
  List upcoming = [];

  static String popularURL =
      'https://api.themoviedb.org/3/movie/popular?api_key=3d2efec41fc6f02fceb55521eac92e7d';
  static String trendingURL =
      'https://api.themoviedb.org/3/trending/all/day?api_key=3d2efec41fc6f02fceb55521eac92e7d';
  static String upcomingURL =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=3d2efec41fc6f02fceb55521eac92e7d&language=en-US&page=1';

  Future getPopular() async {
    http.Response response = await http.get(Uri.parse(popularURL));
    if (response.statusCode == 200) {
      var data = response.body;
      var decodedData = json.decode(data);
     fastLaughsController. popular = decodedData['results'];
      return fastLaughsController. popular;
    } else {
      throw 'An error occured!';
    }
  }

  Future getTrending() async {
    http.Response response = await http.get(Uri.parse(trendingURL));
    if (response.statusCode == 200) {
      var data = response.body;
      var decodedData = json.decode(data);
      trending = decodedData['results'];
      return trending;
    } else {
      throw 'An error occured!';
    }
  }

  Future getUpcoming() async {
    http.Response response = await http.get(Uri.parse(upcomingURL));
    if (response.statusCode == 200) {
      var data = response.body;
      var decodedData = json.decode(data);
      upcoming = decodedData['results'];
      return upcoming;
    } else {
      throw 'An error occured!';
    }
  }
}
