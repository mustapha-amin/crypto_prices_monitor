import 'package:crypto_prices_monitor/screens/coins_list.dart';
import 'package:crypto_prices_monitor/service/http_service.dart';
import 'package:crypto_prices_monitor/widgets/trending_coins_widget.dart';
import 'package:crypto_prices_monitor/widgets/loading_shimmer.dart';
import 'package:flutter/material.dart';

import '../models/trending_coins.dart';

class Trending extends StatefulWidget {
  const Trending({super.key});

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending>
    with AutomaticKeepAliveClientMixin {
  late TextEditingController countryController;
  late Future<TrendingCoins> coins;

  @override
  void initState() {
    coins = HttpService.getTrendingCoins();
    countryController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: coins,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<CoinItem> coins = snapshot.data.coins;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: ListView.builder(
                itemCount: coins.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 2,
                    ),
                    child: TrendingCoinsWidget(
                      coin: coins[index],
                    ),
                  );
                },
              ),
            );
          }
          return LoadingShimmer();
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
