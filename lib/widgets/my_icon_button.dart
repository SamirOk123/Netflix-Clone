import 'package:flutter/material.dart';
import 'package:netflix_clone/cosntants.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({Key? key, required this.icon, required this.label})
      : super(key: key);

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhite,
          size: 26,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: const TextStyle(color:kWhite, fontSize: 16),
        ),
      ],
    );
  }
}
