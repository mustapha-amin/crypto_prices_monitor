import 'package:crypto_prices_monitor/screens/home.dart';
import 'package:crypto_prices_monitor/widgets/loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:crypto_prices_monitor/screens/trending.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black,
      tabBarTheme: TabBarTheme(
        overlayColor: MaterialStateColor.resolveWith((states) => Colors.black),
      ),
    ),
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}
