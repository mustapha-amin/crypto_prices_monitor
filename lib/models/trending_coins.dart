class CoinItem {
  final String id;
  final int coinId;
  final String name;
  final String symbol;
  final int marketCapRank;
  final String thumb;
  final String small;
  final String large;
  final String slug;
  final double priceBTC;
  final int score;

  CoinItem({
    required this.id,
    required this.coinId,
    required this.name,
    required this.symbol,
    required this.marketCapRank,
    required this.thumb,
    required this.small,
    required this.large,
    required this.slug,
    required this.priceBTC,
    required this.score,
  });

  factory CoinItem.fromJson(Map<String, dynamic> json) {
    final item = json['item'];
    return CoinItem(
      id: item['id'],
      coinId: item['coin_id'],
      name: item['name'],
      symbol: item['symbol'],
      marketCapRank: item['market_cap_rank'],
      thumb: item['thumb'],
      small: item['small'],
      large: item['large'],
      slug: item['slug'],
      priceBTC: item['price_btc'].toDouble(),
      score: item['score'],
    );
  }
}

class TrendingCoins {
  final List<CoinItem> coins;
  final List<dynamic> exchanges;

  TrendingCoins({
    required this.coins,
    required this.exchanges,
  });

  factory TrendingCoins.fromJson(Map<String, dynamic> json) {
    final coinsJson = json['coins'] as List<dynamic>;
    final coins = coinsJson
        .map((coinJson) => CoinItem.fromJson(coinJson as Map<String, dynamic>))
        .toList();

    final exchanges = json['exchanges'] as List<dynamic>;

    return TrendingCoins(
      coins: coins,
      exchanges: exchanges,
    );
  }
}
