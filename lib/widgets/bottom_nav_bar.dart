import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/controllers/bottom_nav_controller.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomNavController bottomNavController = Get.put(BottomNavController());
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      child: BottomAppBar(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(right: 25, left: 25),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 14.0),
              child: Row(
                children: [
                  Obx(
                    () => IconBottomBar(
                        icon: Icons.home_filled,
                        onPressed: () {
                          bottomNavController.selectedIndex.value = 0;
                        },
                        selected: bottomNavController.selectedIndex == 0,
                        text: 'Home'),
                  ),
                  Obx(
                    () => IconBottomBar(
                        icon: Icons.videogame_asset_outlined,
                        onPressed: () {
                          bottomNavController.selectedIndex.value = 1;
                        },
                        selected: bottomNavController.selectedIndex == 1,
                        text: 'Games'),
                  ),
                  Obx(
                    () => IconBottomBar(
                        icon: Icons.video_library,
                        onPressed: () {
                          bottomNavController.selectedIndex.value = 2;
                        },
                        selected: bottomNavController.selectedIndex == 2,
                        text: 'Coming Soon'),
                  ),
                  Obx(
                    () => IconBottomBar(
                        icon: Icons.emoji_emotions_outlined,
                        onPressed: () {
                          bottomNavController.selectedIndex.value = 3;
                        },
                        selected: bottomNavController.selectedIndex == 3,
                        text: 'Fast Laughs'),
                  ),
                  Obx(
                    () => IconBottomBar(
                        icon: Icons.download_outlined,
                        onPressed: () {
                          bottomNavController.selectedIndex.value = 4;
                        },
                        selected: bottomNavController.selectedIndex == 4,
                        text: 'Downloads'),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
          ),
          height: 63,
        ),
        elevation: 0,
        color: Colors.transparent,
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {Key? key,
      required this.icon,
      required this.onPressed,
      required this.selected,
      required this.text})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 26,
            color: selected
                ? Colors.white
                : const Color.fromARGB(185, 158, 158, 158),
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 9,
            height: .1,
            color: selected
                ? Colors.white
                : const Color.fromARGB(185, 158, 158, 158),
          ),
        ),
      ],
    );
  }
}
