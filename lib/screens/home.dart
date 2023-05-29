import 'package:countries_info/models/trending_coins.dart';
import 'package:countries_info/screens/coins_list.dart';
import 'package:flutter/material.dart';

import 'trending.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            SizedBox(
              width: size.width,
              height: size.height / 15,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 3,
                ),
                child: SearchBar(
                  backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Colors.grey[800]!,
                  ),
                  trailing: const [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.amber[900],
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.amber[900],
            tabs: const [
              Tab(
                icon: Icon(Icons.money_rounded, color: Colors.white),
                text: "Coins list",
              ),
              Tab(
                icon: Icon(Icons.trending_up, color: Colors.white),
                text: "Trending",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CoinsList(),
            Trending(),
          ],
        ),
      ),
    );
  }
}
