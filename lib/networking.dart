import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/controllers/fast_laghs_controller.dart';

class Networking {
  //dependency injection
  FastLaughsController fastLaughsController = Get.put(FastLaughsController());

  //Lists for assigning json decoded data
  List trending = [];
  List upcoming = [];
  List popularTvShows = [];
  List topRatedTvShows = [];
  List topRatedMovies = [];

  //URLs
  static String popularURL =
      'https://api.themoviedb.org/3/movie/popular?api_key=3d2efec41fc6f02fceb55521eac92e7d';
  static String trendingURL =
      'https://api.themoviedb.org/3/trending/all/day?api_key=3d2efec41fc6f02fceb55521eac92e7d';
  static String upcomingURL =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=3d2efec41fc6f02fceb55521eac92e7d&language=en-US&page=1';

  static String topRatedTvShowsURL =
      'https://api.themoviedb.org/3/tv/top_rated?api_key=3d2efec41fc6f02fceb55521eac92e7d&language=en-US&page=1';

  static String topRatedMoviesURL =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=3d2efec41fc6f02fceb55521eac92e7d&language=en-US&page=1';
  //Methods for fetch data
  Future getPopular() async {
    http.Response response = await http.get(Uri.parse(popularURL));
    if (response.statusCode == 200) {
      var data = response.body;
      var decodedData = json.decode(data);
      fastLaughsController.popular = decodedData['results'];
      return fastLaughsController.popular;
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

  Future getTopRatedTvShows() async {
    http.Response response = await http.get(Uri.parse(topRatedTvShowsURL));
    if (response.statusCode == 200) {
      var data = response.body;
      var decodedData = json.decode(data);
      topRatedTvShows = decodedData['results'];
      return topRatedTvShows;
    } else {
      throw 'An error occured!';
    }
  }

  Future getTopRatedMovies() async {
    http.Response response = await http.get(Uri.parse(topRatedMoviesURL));
    if (response.statusCode == 200) {
      var data = response.body;
      var decodedData = json.decode(data);
      topRatedMovies = decodedData['results'];
      return topRatedMovies;
    } else {
      throw 'An error occured!';
    }
  }
}
