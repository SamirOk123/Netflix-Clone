import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/cosntants.dart';
import 'package:netflix_clone/networking.dart';
import 'package:netflix_clone/views/detail_page.dart';
import 'package:netflix_clone/widgets/poster_card.dart';
import 'package:netflix_clone/widgets/small_icon_button.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final ValueNotifier scrollNotifier = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (
        BuildContext context,
        index,
        _,
      ) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: SafeArea(
            child: Scaffold(
              backgroundColor: kBlack,
              body: Stack(
                children: [
                  ListView(
                    children: [
                      Stack(
                        children: [
                          // FutureBuilder(future: Networking().getTrending(),builder: (context,snapshot){
                          //   if (snapshot.hasData){
                          //     List trending = snapshot.data as List;
                          //     return Container(
                          //   width: double.infinity,
                          //   height: 500,
                          //   decoration:  BoxDecoration(
                          //     image: DecorationImage(
                          //         image: NetworkImage( kImageURL + trending[11]['poster_path'],),
                          //         fit: BoxFit.cover),
                          //   ),
                          // );
                          //   } else  {
                          //     return const SizedBox();
                          //   }
                          // }),
                          Container(
                            width: double.infinity,
                            height: 500,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(kHomeImage),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 320, left: 140),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0, top: 13, right: 3, bottom: 4),
                                  child: Image.asset(
                                    'assets/icons/netflix_logo.png',
                                    width: 18,
                                    height: 18,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 11.0),
                                  child: Text(
                                    'SERIES',
                                    style: TextStyle(
                                        color: kWhite,
                                        fontSize: 8,
                                        letterSpacing: 3.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 440.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SmallIconButton(
                                    icon: Icons.check, label: 'My List'),
                                TextButton.icon(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(kWhite)),
                                  icon: const Padding(
                                    padding: EdgeInsets.only(
                                        left: 10, top: 0, bottom: 0),
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: kBlack,
                                    ),
                                  ),
                                  label: const Padding(
                                    padding: EdgeInsets.only(
                                        right: 10, top: 0, bottom: 0),
                                    child: Text(
                                      'Play',
                                      style: TextStyle(
                                          color: kBlack,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const SmallIconButton(
                                    icon: Icons.info, label: 'Info')
                              ],
                            ),
                          )
                        ],
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.only(top: 18.0, left: 8.0, bottom: 4),
                        child: Text('Trending Now', style: kHomeHeaderStyle),
                      ),
                      LimitedBox(
                        maxHeight: 160,
                        child: FutureBuilder(
                            future: Networking().getTopRatedMovies(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                List trending = snapshot.data as List;
                                return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: trending.length,
                                    itemBuilder: (context, index) {
                                      return PosterCard(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => DetailPage(
                                                  backdropPath: kImageURL +
                                                      trending[index]
                                                          ['backdrop_path'],
                                                  overView: trending[index]
                                                      ['overview'],
                                                  title: trending[index]
                                                      ['title']),
                                            ),
                                          );
                                        },
                                        posterPath: kImageURL +
                                            trending[index]['poster_path'],
                                      );
                                    });
                              } else {
                                return const SizedBox();
                              }
                            }),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.only(top: 15.0, left: 8.0, bottom: 4),
                        child: Text('Only on Netflix', style: kHomeHeaderStyle),
                      ),
                      LimitedBox(
                        maxHeight: 160,
                        child: FutureBuilder(
                            future: Networking().getUpcoming(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                List upcoming = snapshot.data as List;
                                return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: upcoming.length,
                                    itemBuilder: (context, index) {
                                      return Stack(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => DetailPage(
                                                      backdropPath: kImageURL +
                                                          upcoming[index]
                                                              ['backdrop_path'],
                                                      overView: upcoming[index]
                                                          ['overview'],
                                                      title: upcoming[index]
                                                          ['title']),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.all(5),
                                              width: 104,
                                              height: 140,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                      kImageURL +
                                                          upcoming[index]
                                                              ['poster_path'],
                                                    ),
                                                    fit: BoxFit.cover),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0, top: 10.0),
                                            child: Image.asset(
                                              'assets/icons/netflix_logo.png',
                                              width: 16,
                                              height: 16,
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              } else {
                                return const SizedBox();
                              }
                            }),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.only(top: 15.0, left: 8.0, bottom: 4),
                        child: Text('Top 10 in India Today',
                            style: kHomeHeaderStyle),
                      ),
                      LimitedBox(
                        maxHeight: 160,
                        child: FutureBuilder(
                          future: Networking().getTopRatedTvShows(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List topRatedTv = snapshot.data as List;
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 37,
                                            height: 155,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => DetailPage(
                                                      backdropPath: kImageURL +
                                                          topRatedTv[index]
                                                              ['backdrop_path'],
                                                      overView:
                                                          topRatedTv[index]
                                                              ['overview'],
                                                      title: topRatedTv[index]
                                                          ['title']),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 5.0, top: 5.0),
                                              width: 104,
                                              height: 155,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                      kImageURL +
                                                          topRatedTv[index]
                                                              ['poster_path'],
                                                    ),
                                                    fit: BoxFit.cover),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 3.0, top: 60),
                                        child: BorderedText(
                                          strokeWidth: 3.0,
                                          strokeColor: kWhite,
                                          child: Text(
                                            '${index + 1}',
                                            style: const TextStyle(
                                              color: kBlack,
                                              fontSize: 100,
                                              fontWeight: FontWeight.bold,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                        ),
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
                      const Padding(
                        padding:
                            EdgeInsets.only(top: 15.0, left: 8.0, bottom: 4),
                        child:
                            Text('Popular on Netflix', style: kHomeHeaderStyle),
                      ),
                      LimitedBox(
                        maxHeight: 160,
                        child: FutureBuilder(
                          future: Networking().getPopular(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List popularTv = snapshot.data as List;
                             
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: popularTv.length,
                                itemBuilder: (context, index) {
                                  return PosterCard(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailPage(
                                              backdropPath: kImageURL +
                                                  popularTv[index]
                                                      ['backdrop_path'],
                                              overView: popularTv[index]
                                                  ['overview'],
                                              title: popularTv[index]['title']),
                                        ),
                                      );
                                    },
                                    posterPath: kImageURL +
                                        popularTv[index]['poster_path'],
                                  );
                                },
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  scrollNotifier.value
                      ? Container(
                          width: double.infinity,
                          height: 109,
                          color: kBlack.withOpacity(0.4),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 6.5),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 9.0, top: 4.0),
                                      child: Image.asset(
                                        'assets/icons/netflix_logo.png',
                                        width: 39,
                                        height: 39,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/icons/search.png',
                                          color: kWhite,
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
                                    ),
                                  ],
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 19.0),
                                child: Row(
                                  children: [
                                    const Text(
                                      'Tv Shows',
                                      style: TextStyle(
                                          color: kWhite,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const Text(
                                      'Movies',
                                      style: TextStyle(
                                          color: kWhite,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          'Categories',
                                          style: TextStyle(
                                              color: kWhite,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          size: 24,
                                          color: kWhite,
                                        )
                                      ],
                                    ),
                                  ],
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
