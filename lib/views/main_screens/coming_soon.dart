import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Coming Soon',
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
      ),
    );
  }
}
