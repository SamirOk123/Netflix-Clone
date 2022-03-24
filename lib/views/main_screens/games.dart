import 'package:flutter/material.dart';

class Games extends StatelessWidget {
  const Games({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Games',
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
      ),
    );
  }
}
