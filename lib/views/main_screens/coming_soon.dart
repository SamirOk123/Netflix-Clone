import 'package:flutter/material.dart';
import 'package:netflix_clone/cosntants.dart';
import 'package:netflix_clone/networking.dart';
import 'package:netflix_clone/widgets/appbar_actions.dart';
import 'package:netflix_clone/widgets/backdrop_card.dart';
import 'package:netflix_clone/widgets/small_icon_button.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlack,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverAppBar(
              title: Text(
                "Coming Soon",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              actions: [
                AppBarActions(),
              ],
              floating: true,
              snap: true,
              backgroundColor: kBlack,
            ),
          ],
          body: FutureBuilder(
            future: Networking().getUpcoming(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List upcoming = snapshot.data as List;
                return ListView.builder(
                  itemCount: upcoming.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        BackDropCard(
                            backgroundImage:
                                kImageURL + upcoming[index]['backdrop_path']),
                        Row(
                          children: [
                            SizedBox(
                              width: 150,
                              height: 100,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Text(
                                  upcoming[index]['title'],
                                  style: const TextStyle(
                                      color: kWhite,
                                      fontSize: 22,
                                      fontFamily: 'Samir',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const SmallIconButton(
                                icon: Icons.notifications, label: 'Remind Me'),
                            const SmallIconButton(
                                icon: Icons.info, label: 'Info'),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        ),
                        Container(
                          child: Text(
                            'Coming on ${upcoming[index]['release_date']}',
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          padding: const EdgeInsets.only(right: 192),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Text(
                            upcoming[index]['overview'],
                            style: const TextStyle(color: Colors.grey),
                          ),
                          padding: const EdgeInsets.only(left: 13),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 13.0),
                          child: Row(
                            children: const [
                              Text(
                                'Crime',
                                style: TextStyle(color: kWhite),
                              ),
                              Text(
                                ' . ',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                'Drama',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                ' . ',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                'Thriller',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                      ],
                    );
                  },
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
