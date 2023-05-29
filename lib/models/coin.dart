class Coin {
  String symbol;
  String name;
  String image;
  double currentPrice;
  double priceChangePercentage;

  Coin({
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.priceChangePercentage,
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      symbol: json['symbol'],
      name: json['name'],
      image: json['image'],
      currentPrice: json['current_price'].toDouble(),
      priceChangePercentage: json['price_change_percentage_24h'].toDouble(),
    );
  }
}
