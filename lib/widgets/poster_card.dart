import 'package:flutter/material.dart';

class PosterCard extends StatelessWidget {
  const PosterCard({Key? key, required this.onTap, required this.posterPath})
      : super(key: key);
  final String posterPath;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        width: 104,
        height: 110,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(posterPath), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
