import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/controllers/bottom_nav_controller.dart';
import 'package:netflix_clone/controllers/home_controller.dart';
import 'package:netflix_clone/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    BottomNavController bottomNavController = Get.put(BottomNavController());
    return Obx(
      () => Scaffold(
        body: homeController.screens[bottomNavController.selectedIndex.value],
        backgroundColor: Colors.black,
        bottomNavigationBar: const CustomNavigationBar(),
      ),
    );
  }
}
