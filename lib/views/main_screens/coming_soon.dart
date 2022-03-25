import 'package:flutter/material.dart';
import 'package:netflix_clone/networking.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              title: const Text(
                "Coming Soon",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              actions: [
                Image.asset(
                  'assets/icons/search.png',
                  color: Colors.white,
                  height: 24,
                  width: 24,
                ),
                const SizedBox(
                  width: 25,
                ),
                Image.asset(
                  'assets/icons/netflix_avatar.png',
                  width: 24,
                  height: 24,
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
              floating: true,
              snap: true,
              backgroundColor: Colors.black,
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
                        Container(
                          child: Center(
                            child: Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                color: Colors.black38,
                              ),
                              child: const Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 33,
                              ),
                            ),
                          ),
                          width: double.infinity,
                          height: 190,
                          decoration:  BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                image: NetworkImage(
                                     'http://image.tmdb.org/t/p/w500' +
                                            upcoming[index]['backdrop_path'],),
                                fit: BoxFit.cover),
                          ),
                        ),
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
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Remind Me',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 9),
                                ),
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.info,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Info',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 9),
                                ),
                              ],
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        Container(
                          child:  Text(
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
                          child:  Text(
                         upcoming[index]['overview'] ,
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
