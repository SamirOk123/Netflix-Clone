import 'package:flutter/material.dart';
import 'package:netflix_clone/cosntants.dart';

class BackDropCard extends StatelessWidget {
  const BackDropCard({Key? key, required this.backgroundImage})
      : super(key: key);

  final String backgroundImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: kWhite, width: 1),
            color: kBlack,
          ),
          child: const Icon(
            Icons.play_arrow,
            color: kWhite,
            size: 33,
          ),
        ),
      ),
      width: double.infinity,
      height: 190,
      decoration: BoxDecoration(
        color: kBlack,
        image: DecorationImage(
            image: NetworkImage(
              backgroundImage,
            ),
            fit: BoxFit.cover),
      ),
    );
  }
}
