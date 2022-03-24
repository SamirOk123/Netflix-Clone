import 'package:flutter/material.dart';

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
          color: Colors.white,
          size: 26,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }
}
