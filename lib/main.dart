import 'package:crypto_prices_monitor/screens/home.dart';
import 'package:crypto_prices_monitor/widgets/loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:crypto_prices_monitor/screens/trending.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(Sizer(builder: (context, orientation, deviceType) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black12,
        tabBarTheme: TabBarTheme(
          overlayColor:
              MaterialStateColor.resolveWith((states) => Colors.black),
        ),
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }));
}
