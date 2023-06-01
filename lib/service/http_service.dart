import 'dart:convert';
import 'dart:developer';
import 'package:crypto_prices_monitor/models/coin.dart';
import 'package:crypto_prices_monitor/models/trending_coins.dart';
import 'package:http/http.dart';
import '../consts.dart';

const trendingCoinsUrl = 'https://api.coingecko.com/api/v3/search/trending';

class HttpService {
  static Future<List<Coin>> getCoinsData(String coin) async {
    String url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=';
    if (coin != "default") {
      url += coin;
    } else {
      for (var crypto in cryptos) {
        crypto != cryptos.last ? url += '$crypto%2C' : url += crypto;
      }
    }
    url +=
        '&order=market_cap_desc&per_page=100&page=1&sparkline=true&locale=en';
    var response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      log("successful");
      final coins = jsonDecode(response.body) as List<dynamic>;
      log(coins.length.toString());
      final coinsData = coins.map((e) => Coin.fromJson(e)).toList();
      log(coinsData.length.toString());
      return coinsData;
    } else {
      throw ("An error occured");
    }
  }

  static Future<TrendingCoins> getTrendingCoins() async {
    var response = await get(Uri.parse(trendingCoinsUrl));
    if (response.statusCode == 200) {
      return TrendingCoins.fromJson(jsonDecode(response.body));
    } else {
      throw ("An error occured");
    }
  }
}
