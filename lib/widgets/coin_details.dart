import 'package:crypto_prices_monitor/consts.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  String? data;
  num? value;
  bool? isMoney;
  // ignore: use_key_in_widget_constructors
  Detail(this.data, this.value, [this.isMoney = false]);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          data!,
          style: kTextStyle(13),
        ),
        Text(
          value != null
              ? (isMoney! ? value!.formatToMoney : value!.formatToMoney.substring(1))
              : "Unavailable",
          style: kTextStyle(13),
        ),
      ],
    );
  }
}
