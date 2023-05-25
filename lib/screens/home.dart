import 'package:flutter/material.dart';
import 'package:countries_info/models/country_model.dart';
import 'package:countries_info/service/http_service.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<CountryModel>> countries;
  @override
  void initState() {
    countries = HttpService().getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: countries,
        builder:
            (BuildContext context, AsyncSnapshot<List<CountryModel>> snapshot) {
          if (snapshot.hasData) {
            List<CountryModel> countries = snapshot.data!;
            return ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                CountryModel country = countries[index];
                return ListTile(
                  title: Text(country.name),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Error"),
            );
          } else {
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[400]!,
                  highlightColor: Colors.grey[100]!,
                  child: ListTile(
                    title: SizedBox(
                      width: size.width / 2,
                      height: size.height / 20,
                    ),
                    subtitle: SizedBox(
                      width: size.width / 3,
                      height: size.height / 25,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
