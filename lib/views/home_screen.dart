import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/controllers/bottom_nav_controller.dart';
import 'package:netflix_clone/controllers/home_controller.dart';
import 'package:netflix_clone/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    BottomNavController bottomNavController = Get.put(BottomNavController());
    return Obx(
      () => Scaffold(
        body: homeController
            .screens[bottomNavController.selectedIndex.value],
        backgroundColor: Colors.black,
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }
}

// BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.black,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white.withOpacity(.60),
//         selectedFontSize: 14,
//         unselectedFontSize: 14,
//         onTap: (value) {
//           // Respond to item press.
//         },
//         items: const [
//           BottomNavigationBarItem(
//             label: 'Home',
//             icon: Icon(Icons.home_filled),
//           ),
//           BottomNavigationBarItem(
//             label: 'Games',
//             icon: Icon(Icons.videogame_asset_outlined),
//           ),
//           BottomNavigationBarItem(
//             label: 'Coming Soon',
//             icon: Icon(Icons.video_library),
//           ),
//           BottomNavigationBarItem(
//             label: 'Fast Laughs',
//             icon: Icon(Icons.emoji_emotions_outlined),
//           ),
//           BottomNavigationBarItem(
//             label: 'Downloads',
//             icon: Icon(Icons.download_outlined),
//           ),
//         ],
//       ),