import 'package:flutter/material.dart';
import 'package:netflix_clone/cosntants.dart';

class SmallIconButton extends StatelessWidget {
  const SmallIconButton({Key? key, required this.icon, required this.label})
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
          size: 24,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.grey, fontSize: 9),
        ),
      ],
    );
  }
}
