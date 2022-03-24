import 'package:get/get.dart';
import 'package:netflix_clone/views/main_screens/coming_soon.dart';
import 'package:netflix_clone/views/main_screens/downloads.dart';
import 'package:netflix_clone/views/main_screens/fast_laughs.dart';
import 'package:netflix_clone/views/main_screens/games.dart';
import 'package:netflix_clone/views/main_screens/home.dart';

class HomeController extends GetxController {
  final List screens = [
    const Home(),
    const Games(),
    const ComingSoon(),
    const FastLaughs(),
    const Downloads(),
  ].obs;
}
