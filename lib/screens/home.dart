import 'package:crypto_prices_monitor/models/trending_coins.dart';
import 'package:crypto_prices_monitor/screens/coins_list.dart';
import 'package:crypto_prices_monitor/screens/search_screen.dart';
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SearchScreen();
                  }));
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white60,
                ),
              ),
            ),
          ],
          bottom: TabBar(
            dividerColor: Colors.grey[600],
            indicatorColor: Colors.amber[900],
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.amber[900],
            tabs: const [
              Tab(
                icon: Icon(Icons.monetization_on, color: Colors.white),
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
