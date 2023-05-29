import 'package:countries_info/screens/home.dart';
import 'package:countries_info/widgets/loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:countries_info/screens/trending.dart';

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
