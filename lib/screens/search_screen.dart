import 'dart:developer';
import 'package:crypto_prices_monitor/consts.dart';
import 'package:crypto_prices_monitor/screens/search_detail.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<String> results = [];

  void search(String query) {
    results.clear();
    for (var item in cryptoList) {
      if (item.toLowerCase().contains(query.toLowerCase()) &&
          searchController.text.isNotEmpty) {
        results.add(item);
        if (item.startsWith(query)) {
          item == query ? results.insert(0, item) : results.insert(0, item);
        }
      }
    }
    log(results.length.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          foregroundColor: Colors.white70,
          actions: [
            SizedBox(
              width: 90.w,
              height: 10.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: SearchBar(
                  backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Colors.grey[800]!,
                  ),
                  textStyle: MaterialStateProperty.resolveWith(
                    (states) => kTextStyle(17.sp),
                  ),
                  controller: searchController,
                  trailing: const [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ],
                  onChanged: (value) => search(value),
                ),
              ),
            ),
          ],
        ),
        body: results.isEmpty
            ? const SizedBox()
            : Scaffold(
                body: ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SearchDetail(
                              coinName: results[index],
                            );
                          }));
                        },
                        child: ListTile(
                          title: Text(
                            results[index],
                            style: kTextStyle(13.sp),
                          ),
                        ),
                      );
                    }),
              ),
      ),
    );
  }
}
