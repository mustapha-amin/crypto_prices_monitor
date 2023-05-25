import 'dart:convert';
import 'dart:developer';

import 'package:countries_info/models/country_model.dart';
import 'package:http/http.dart';

const apiKey = '654a02c281aecba07ca27907d3f63e35';
const url = 'https://api.countrylayer.com/v2/all?access key = $apiKey';

/**
 * https://api.countrylayer.com/v2/all
    ? access_key = API_KEY
 */

class HttpService {
  Future<List<CountryModel>> getCountries() async {
    final response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body) as List<dynamic>;
      List<CountryModel> countries =
          json.map((e) => CountryModel.fromJson(e)).toList();
      return countries;
    } else {
      throw Exception("Failed to fetch data");
    }
  }
}
