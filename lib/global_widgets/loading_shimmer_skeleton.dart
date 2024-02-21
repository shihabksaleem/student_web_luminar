import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerSkeleton extends StatefulWidget {
  const ShimmerSkeleton({super.key, this.height = 150, this.width = 150});
  final double height;
  final double width;

  @override
  State<ShimmerSkeleton> createState() => _ShimmerSkeletonState();
}

class _ShimmerSkeletonState extends State<ShimmerSkeleton> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          height: widget.height,
          width: widget.width,
        ));
  }
}
