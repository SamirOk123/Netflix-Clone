import 'package:flutter/material.dart';
import 'package:netflix_clone/cosntants.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/icons/search.png',
          color: kWhite,
          height: 24,
          width: 24,
        ),
        const SizedBox(
          width: 25,
        ),
        Image.asset(
          'assets/icons/netflix_avatar.png',
          width: 24,
          height: 24,
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
