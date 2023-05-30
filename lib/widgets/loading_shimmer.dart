import 'package:crypto_prices_monitor/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';

class LoadingShimmer extends StatefulWidget {
  const LoadingShimmer({super.key});

  @override
  State<LoadingShimmer> createState() => _LoadingShimmerState();
}

class _LoadingShimmerState extends State<LoadingShimmer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.grey[900],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerWidget(
                  height: size.height / 8,
                  width: size.width / 10,
                  shapeBorder: BoxShape.circle,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerWidget(
                      width: size.width / 3,
                      height: 6,
                      shapeBorder: BoxShape.rectangle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ShimmerWidget(
                      width: size.width / 5,
                      height: 4,
                      shapeBorder: BoxShape.rectangle,
                    ),
                  ],
                ),
                ShimmerWidget(
                  width: size.width / 3,
                  height: 5,
                  shapeBorder: BoxShape.rectangle,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
