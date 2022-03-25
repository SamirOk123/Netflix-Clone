import 'package:flutter/material.dart';

class Games extends StatelessWidget {
  const Games({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              "Games",
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
          ),
          backgroundColor: Colors.black,
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
                                image: NetworkImage(
                                    'https://steamuserimages-a.akamaihd.net/ugc/1767071068001218293/13ACF27F8B59F8F67DD446E6727BFF052F83DA60/?imw=5000&imh=5000&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false'),
                                fit: BoxFit.cover),
                            color: Colors.black,
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
                                    image: NetworkImage(
                                        'https://help.nflxext.com/1f770e14-eb11-4cdd-aadf-8a4365728bfa_arcanium_appicon_EN.png'),
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
                                  color: Colors.white,
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
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              )
            ],
          )),
    );
  }
}
