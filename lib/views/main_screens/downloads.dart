import 'package:flutter/material.dart';
import 'package:netflix_clone/cosntants.dart';
import 'package:netflix_clone/networking.dart';
import 'package:netflix_clone/widgets/appbar_actions.dart';

class Downloads extends StatelessWidget {
  const Downloads({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: ((context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              snap: true,
              backgroundColor: kBlack,
              floating: true,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: AppBar(
                  backgroundColor: kBlack,
                  title: const Text(
                    "Downloads",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  actions: const [
                    AppBarActions(),
                  ],
                ),
              ),
            )
          ];
        }),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14.0, top: 10.0),
              child: Row(
                children: const [
                  Icon(
                    Icons.settings,
                    color: Color.fromARGB(193, 255, 255, 255),
                    size: 18,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Smart Downloads',
                    style: TextStyle(
                      color: Color.fromARGB(193, 255, 255, 255),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 14, top: 38),
              child: Text(
                'Introducing Downloads for you',
                style: TextStyle(
                    color: kWhite, fontWeight: FontWeight.bold, fontSize: 21),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 14, top: 20),
              child: Text(
                kDownloadScreenText,
                style: TextStyle(
                  color: Color.fromARGB(193, 255, 255, 255),
                ),
              ),
            ),
            FutureBuilder(
              future: Networking().getTrending(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List trending = snapshot.data as List;
                  return Center(
                    child: Stack(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20.0, top: 27.0),
                          child: Center(
                            child: CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(69, 158, 158, 158),
                              radius: 107,
                            ),
                          ),
                        ),
                        Transform.rotate(
                          angle: 50,
                          child: Container(
                            margin: const EdgeInsets.only(top: 85, left: 50),
                            width: 110,
                            height: 155,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    kImageURL + trending[6]['poster_path'],
                                  ),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromARGB(69, 158, 158, 158),
                            ),
                          ),
                        ),
                        Transform.rotate(
                          angle: 31.72,
                          child: Container(
                            margin: const EdgeInsets.only(top: 46, left: 198),
                            width: 110,
                            height: 155,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    kImageURL + trending[4]['poster_path'],
                                  ),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromARGB(69, 158, 158, 158),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 55, left: 118),
                          width: 125,
                          height: 170,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  kImageURL + trending[3]['poster_path'],
                                ),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(69, 158, 158, 158),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                    colors: [Colors.blue.shade700, Colors.blue.shade900]),
              ),
              height: 41,
              margin: const EdgeInsets.only(left: 12, right: 12),
              child: const Center(
                child: Text(
                  'Set Up',
                  style: TextStyle(color: kWhite),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80.0, right: 80.0),
              child: SizedBox(
                height: 35,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(41, 158, 158, 158)),
                  onPressed: () {},
                  child: const Text(
                    'Find More to Download',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
