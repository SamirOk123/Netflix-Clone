import 'package:flutter/material.dart';
import 'package:netflix_clone/cosntants.dart';
import 'package:netflix_clone/widgets/appbar_actions.dart';
import 'package:netflix_clone/widgets/backdrop_card.dart';
import 'package:netflix_clone/widgets/small_icon_button.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(
      {Key? key,
      required this.backdropPath,
      required this.overView,
      required this.title})
      : super(key: key);

  final String title;
  final String overView;
  final String backdropPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
        actions: const [AppBarActions()],
      ),
      body: Column(
        children: [
          BackDropCard(backgroundImage: backdropPath),
          Expanded(
            child: ListView(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 5.0, top: 13, right: 3, bottom: 4),
                      child: Image.asset(
                        'assets/icons/netflix_logo.png',
                        width: 23,
                        height: 23,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 11.0),
                      child: Text(
                        'FILM',
                        style: TextStyle(
                            color: kWhite,
                            fontSize: 10,
                            letterSpacing: 4.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, top: 10, bottom: 11),
                  child: Row(
                    children: const [
                      Text(
                        '2021',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        ' 13+ ',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            backgroundColor: Color.fromARGB(52, 158, 158, 158),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '1h 57m',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5), color: kWhite),
                  height: 45,
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  child: Center(
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow, color: kBlack),
                      label: const Text(
                        'Play',
                        style: TextStyle(color: kBlack),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(83, 158, 158, 158),
                  ),
                  height: 45,
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  child: Center(
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.download,
                        color: kWhite,
                      ),
                      label: const Text(
                        'Download',
                        style: TextStyle(color: kWhite),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 9.0, right: 9.0, top: 9.0),
                  child: Text(
                    overView,
                    style: const TextStyle(color: kWhite),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 27.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      SmallIconButton(icon: Icons.add, label: 'My List'),
                      SmallIconButton(
                          icon: Icons.thumb_up_alt_sharp, label: 'Rate'),
                      SmallIconButton(icon: Icons.share, label: 'Share'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
