import 'package:crypto_prices_monitor/screens/coin_detail.dart';
import 'package:crypto_prices_monitor/service/http_service.dart';
import 'package:crypto_prices_monitor/widgets/loading_shimmer.dart';
import 'package:flutter/material.dart';
import '../models/coin.dart';
import '../widgets/coins_widget.dart';

class CoinsList extends StatefulWidget {
  const CoinsList({super.key});

  @override
  State<CoinsList> createState() => _CoinsListState();
}

class _CoinsListState extends State<CoinsList>
    with AutomaticKeepAliveClientMixin {
  late Future<List<Coin>>? coinslist;

  @override
  void initState() {
    coinslist = HttpService.getCoinsData("default");
    super.initState();
  }

  Future<void> _refresh() async {
    setState(() {
      coinslist = null;
    });
    await Future.delayed(const Duration(seconds: 1));
    coinslist = HttpService.getCoinsData("default");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: coinslist,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Coin> coins = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: RefreshIndicator(
                color: Colors.orange[900],
                onRefresh: _refresh,
                child: ListView.builder(
                  itemCount: coins.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 2,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return CoinDetail(
                              coin: coins[index],
                            );
                          }));
                        },
                        child: CoinsWidget(
                          coin: coins[index],
                        ),
                      ),
                    );
                  },
                ),
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
