import 'package:crypto_prices_monitor/screens/coin_detail.dart';
import 'package:crypto_prices_monitor/service/http_service.dart';
import 'package:crypto_prices_monitor/widgets/coins_widget.dart';
import 'package:crypto_prices_monitor/widgets/loading_shimmer.dart';
import 'package:flutter/material.dart';

import '../models/coin.dart';

class SearchDetail extends StatefulWidget {
  String? coinName;
  SearchDetail({this.coinName, super.key});

  @override
  State<SearchDetail> createState() => _SearchDetailState();
}

class _SearchDetailState extends State<SearchDetail> {
  late Future<List<Coin>> coin = HttpService.getCoinsData(widget.coinName!);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Colors.white70,
      ),
      body: FutureBuilder(
        future: coin,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Coin coin = snapshot.data![0];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CoinDetail(
                          coin: coin,
                        );
                      }));
                    },
                    child: CoinsWidget(coin: coin),
                  )
                ],
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: LoadingShimmer(
              count: 1,
            ),
          );
        },
      ),
    );
  }
}
