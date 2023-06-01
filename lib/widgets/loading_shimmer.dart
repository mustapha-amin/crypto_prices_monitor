import 'package:crypto_prices_monitor/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';

class LoadingShimmer extends StatefulWidget {
  int? count;
  LoadingShimmer({this.count, super.key});

  @override
  State<LoadingShimmer> createState() => _LoadingShimmerState();
}

class _LoadingShimmerState extends State<LoadingShimmer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
      child: ListView.builder(
        itemCount: widget.count ?? 10,
        itemBuilder: (context, index) {
          return SizedBox(
            height: size.height / 8,
            child: Card(
              color: Colors.grey[900],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
                child: SizedBox(
                  height: size.height / 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ShimmerWidget(
                          height: size.height / 8,
                          width: size.width / 10,
                          shapeBorder: BoxShape.circle,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
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
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
