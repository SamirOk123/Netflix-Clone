import 'package:flutter/material.dart';
import 'package:netflix_clone/cosntants.dart';
import 'package:netflix_clone/widgets/appbar_actions.dart';

class Games extends StatelessWidget {
  const Games({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBlack,
          title: const Text(
            "Games",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          actions: const [
            AppBarActions(),
          ],
        ),
        backgroundColor: kBlack,
        body: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: MediaQuery.of(context).size.height * 0.70,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: NetworkImage(kGamesLarge),
                              fit: BoxFit.cover),
                          color: kBlack,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 250),
                      child: Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(kGamesSmall),
                                  fit: BoxFit.cover),
                            ),
                            width: 135,
                            height: 135,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Arcanium: Rise of Akhan',
                            style: TextStyle(
                                color: kWhite,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 17.0, right: 180),
              child: Text(
                "All Mobile Games",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20, color: kWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
