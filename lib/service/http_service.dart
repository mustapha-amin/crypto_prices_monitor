import 'dart:convert';
import 'dart:developer';

import 'package:crypto_prices_monitor/models/trending_coins.dart';
import 'package:http/http.dart';

import '../consts.dart';

const coinsListUrl =
    'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=bitcoin%2Cethereum%2Ctron&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en';

const trendingCoinsUrl = 'https://api.coingecko.com/api/v3/search/trending';

class HttpService {
  getCoinsData() async {
    String url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=';
    for (var crypto in cryptos) {
      cryptos.indexOf(crypto) != cryptos.length - 1
          ? url += '$crypto%2C'
          : url += crypto;
    }
    url +=
        '&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en';
    var response = await get(Uri.parse(coinsListUrl));
    if (response.statusCode == 200) {
      log(response.body);
    } else {
      log(response.body);
    }
  }

  Future<TrendingCoins> getTrendingCoins() async {
    var response = await get(Uri.parse(trendingCoinsUrl));
    if (response.statusCode == 200) {
      return TrendingCoins.fromJson(jsonDecode(response.body));
    } else {
      log(response.body);
      throw ("An error occured");
    }
  }
}
