class CountryModel {
  String name;
  List<String> topLevelDomain;
  String alpha2Code;
  String alpha3Code;
  List<String> callingCodes;
  String capital;
  List<String> altSpellings;
  String region;
  String subregion;
  int population;
  List<double> latlng;
  String demonym;
  double area;
  double gini;
  List<String> timezones;
  List<String> borders;
  String nativeName;
  String numericCode;
  List<CurrencyModel> currencies;
  List<LanguageModel> languages;
  Map<String, String> translations;
  String flag;
  List<RegionalBlocModel> regionalBlocs;
  String cioc;

  CountryModel({
    required this.name,
    required this.topLevelDomain,
    required this.alpha2Code,
    required this.alpha3Code,
    required this.callingCodes,
    required this.capital,
    required this.altSpellings,
    required this.region,
    required this.subregion,
    required this.population,
    required this.latlng,
    required this.demonym,
    required this.area,
    required this.gini,
    required this.timezones,
    required this.borders,
    required this.nativeName,
    required this.numericCode,
    required this.currencies,
    required this.languages,
    required this.translations,
    required this.flag,
    required this.regionalBlocs,
    required this.cioc,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name'],
      topLevelDomain: List<String>.from(json['topLevelDomain']),
      alpha2Code: json['alpha2Code'],
      alpha3Code: json['alpha3Code'],
      callingCodes: List<String>.from(json['callingCodes']),
      capital: json['capital'],
      altSpellings: List<String>.from(json['altSpellings']),
      region: json['region'],
      subregion: json['subregion'],
      population: json['population'],
      latlng: List<double>.from(json['latlng'].map((x) => x.toDouble())),
      demonym: json['demonym'],
      area: json['area'].toDouble(),
      gini: json['gini'].toDouble(),
      timezones: List<String>.from(json['timezones']),
      borders: List<String>.from(json['borders']),
      nativeName: json['nativeName'],
      numericCode: json['numericCode'],
      currencies: List<CurrencyModel>.from(
          json['currencies'].map((x) => CurrencyModel.fromJson(x))),
      languages: List<LanguageModel>.from(
          json['languages'].map((x) => LanguageModel.fromJson(x))),
      translations: Map<String, String>.from(json['translations']),
      flag: json['flag'],
      regionalBlocs: List<RegionalBlocModel>.from(
          json['regionalBlocs'].map((x) => RegionalBlocModel.fromJson(x))),
      cioc: json['cioc'],
    );
  }
}

class CurrencyModel {
  String code;
  String name;
  String symbol;

  CurrencyModel({
    required this.code,
    required this.name,
    required this.symbol,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      code: json['code'],
      name: json['name'],
      symbol: json['symbol'],
    );
  }
}

class LanguageModel {
  String iso639_1;
  String iso639_2;
  String name;
  String nativeName;

  LanguageModel({
    required this.iso639_1,
    required this.iso639_2,
    required this.name,
    required this.nativeName,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      iso639_1: json['iso639_1'],
      iso639_2: json['iso639_2'],
      name: json['name'],
      nativeName: json['nativeName'],
    );
  }
}

class RegionalBlocModel {
  String acronym;
  String name;

  RegionalBlocModel({
    required this.acronym,
    required this.name,
  });

  factory RegionalBlocModel.fromJson(Map<String, dynamic> json) {
    return RegionalBlocModel(
      acronym: json['acronym'],
      name: json['name'],
    );
  }
}

const foo = [
  {
    "name": "Afghanistan",
    "topLevelDomain": [".af"],
    "alpha2Code": "AF",
    "alpha3Code": "AFG",
    "callingCodes": ["93"],
    "capital": "Kabul",
    "altSpellings": ["AF", "Afġānistān"],
    "region": "Asia",
    "subregion": "Southern Asia",
    "population": 27657145,
    "latlng": [33, 65],
    "demonym": "Afghan",
    "area": 652230,
    "gini": 27.8,
    "timezones": ["UTC+04:30"],
    "borders": ["IRN", "PAK", "TKM", "UZB", "TJK", "CHN"],
    "nativeName": "افغانستان",
    "numericCode": "004",
    "currencies": [
      {"code": "AFN", "name": "Afghan afghani", "symbol": "؋"}
    ],
    "languages": [
      {
        "iso639_1": "ps",
        "iso639_2": "pus",
        "name": "Pashto",
        "nativeName": "پښتو"
      },
      {
        "iso639_1": "uz",
        "iso639_2": "uzb",
        "name": "Uzbek",
        "nativeName": "Oʻzbek"
      },
      {
        "iso639_1": "tk",
        "iso639_2": "tuk",
        "name": "Turkmen",
        "nativeName": "Türkmen"
      }
    ],
    "translations": {
      "br": "Afeganistão",
      "de": "Afghanistan",
      "es": "Afganistán",
      "fa": "افغانستان",
      "fr": "Afghanistan",
      "hr": "Afganistan",
      "it": "Afghanistan",
      "ja": "アフガニスタン",
      "nl": "Afghanistan",
      "pt": "Afeganistão"
    },
    "flag": "https://restcountries.eu/data/afg.svg",
    "regionalBlocs": [
      {
        "acronym": "SAARC",
        "name": "South Asian Association for Regional Cooperation"
      }
    ],
    "cioc": "AFG"
  }
];
