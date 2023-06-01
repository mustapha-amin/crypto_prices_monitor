import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatefulWidget {
  double? width, height;
  BoxShape? shapeBorder;
  ShimmerWidget({this.height, this.width, this.shapeBorder});

  @override
  State<ShimmerWidget> createState() => _ShimmerWidgetState();
}

class _ShimmerWidgetState extends State<ShimmerWidget> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 100),
      baseColor: Colors.grey[600]!,
      highlightColor: Colors.grey[500]!,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          shape: widget.shapeBorder!,
          color: Colors.grey,
          borderRadius: widget.shapeBorder == BoxShape.circle
              ? null
              : BorderRadius.circular(10),
        ),
      ),
    );
  }
}
