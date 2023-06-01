import 'package:flutter/material.dart';

List<String> cryptos = [
  'bitcoin',
  'ethereum',
  'binancecoin',
  'tether',
  'xrp',
  'cardano',
  'dogecoin',
  'usd-coin',
  'polkadot',
  'binance-usd',
  'bitcoin-cash',
  'litecoin',
  'uniswap',
  'chainlink',
  'vechain',
  'stellar',
  'wrapped-bitcoin',
  'theta-token',
  'ethereum-classic',
  'filecoin',
];

kTextStyle(double size, [Color? color, bool isBold = false]) {
  return TextStyle(
    color: color ?? Colors.white,
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    fontSize: size,
  );
}
