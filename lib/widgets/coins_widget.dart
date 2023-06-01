import 'package:crypto_prices_monitor/models/trending_coins.dart';
import 'package:flutter/material.dart';

import '../models/coin.dart';

class CoinsWidget extends StatelessWidget {
  Coin coin;
  CoinsWidget({required this.coin, super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
      child: Container(
        width: size.width,
        height: size.height / 9,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [
              Colors.grey[900]!,
              Colors.grey[800]!,
            ],
            tileMode: TileMode.decal,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(coin.image!),
          ),
          title: Text(
            coin.name!,
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            coin.symbol!,
            style: const TextStyle(color: Colors.white),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${coin.priceChangePercentage24h}%",
                style: TextStyle(
                  color: coin.priceChangePercentage24h.toString()[0] == '-'
                      ? Colors.red
                      : Colors.green,
                  fontSize: 17,
                ),
              ),
              Text(
                "\$${coin.currentPrice}",
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
