import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

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

kTextStyle(double size, {Color? color, bool isBold = false}) {
  return GoogleFonts.lato(
    color: color ?? Colors.white,
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    fontSize: size.sp,
  );
}

extension MoneyFormatter on num {
  String get formatToMoney {
    var formatter = NumberFormat.simpleCurrency(locale: 'en_Us');
    return formatter.format(this);
  }
}
