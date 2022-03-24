import 'package:flutter/material.dart';
import 'package:netflix_clone/networking.dart';
import 'package:netflix_clone/widgets/my_icon_button.dart';

class FastLaughs extends StatelessWidget {
  const FastLaughs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder (
        future: Networking().getPopular(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List popular = snapshot.data as List;
            return PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: popular.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 280.0, left: 280),
                    child: Column(children: const [
                      MyIconButton(
                        icon: Icons.emoji_emotions,
                        label: 'LOL',
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      MyIconButton(
                        icon: Icons.add,
                        label: 'My List',
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      MyIconButton(
                        icon: Icons.send,
                        label: 'Share',
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      MyIconButton(
                        icon: Icons.play_arrow_rounded,
                        label: 'Play',
                      ),
                    ]),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          'http://image.tmdb.org/t/p/w500' +  popular[index]['poster_path']),
                        fit: BoxFit.cover),
                  ),
                );
              },
            );
          }else{
            return const Center(child: CircularProgressIndicator(color: Color.fromARGB(185, 158, 158, 158) ,),);
          }
        },
      ),
    );
  }
}
