import 'package:crypto_price_monitor/service/http_service.dart';
import 'package:crypto_price_monitor/widgets/loading_shimmer.dart';
import 'package:flutter/material.dart';

class CoinsList extends StatefulWidget {
  const CoinsList({super.key});

  @override
  State<CoinsList> createState() => _CoinsListState();
}

class _CoinsListState extends State<CoinsList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(builder: (context, snapshot) {
        if (snapshot.hasData) {}
        return LoadingShimmer();
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          HttpService().getCoinsData();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
