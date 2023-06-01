import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:crypto_prices_monitor/consts.dart';
import 'package:crypto_prices_monitor/widgets/coin_details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/coin.dart';
import 'package:sizer/sizer.dart';

class CoinDetail extends StatelessWidget {
  Coin? coin;
  CoinDetail({this.coin, super.key});

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat(DateFormat.HOUR24_MINUTE_SECOND);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Hero(
                      tag: coin.hashCode,
                      child: Image.network(
                        coin!.image!,
                        width: 10.w,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      coin!.name!,
                      style: kTextStyle(
                        15.sp,
                      ),
                    )
                  ],
                ),
                Text(
                  coin!.currentPrice!.formatToMoney,
                  style: kTextStyle(
                    23.sp,
                  ),
                ),
                Text(
                  '${coin!.priceChangePercentage24h}%',
                  style: kTextStyle(
                    20.sp,
                    color: coin!.priceChangePercentage24h.toString()[0] == '-'
                        ? Colors.red
                        : Colors.green,
                  ),
                ),
                Sparkline(
                  gridLinelabel: ((gridLineValue) {
                    return gridLineValue.formatToMoney;
                  }),
                  enableGridLines: true,
                  fallbackHeight: 45.h,
                  gridLineLabelPrecision: 7,
                  data: coin!.sparklineIn7d!.map((e) => e.toDouble()).toList(),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Column(
                  children: [
                    Detail("Market cap rank", coin!.marketCapRank),
                    Detail("Market cap", coin!.marketCap, true),
                    Detail("Total volume", coin!.totalVolume),
                    Detail("Max supply", coin!.maxSupply),
                    Detail("Circulating supply", coin!.circulatingSupply),
                    Detail("Total supply", coin!.totalSupply),
                    Detail("ATH", coin!.ath, true),
                    Detail("ATL", coin!.atl, true),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Last updated",
                          style: kTextStyle(13),
                        ),
                        Text(
                          dateFormat.format(coin!.lastUpdated!),
                          style: kTextStyle(13),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
