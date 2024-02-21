import 'package:flutter/material.dart';
import 'package:lumainar/global_widgets/loading_shimmer_skeleton.dart';

class ListTimeShimmer extends StatelessWidget {
  const ListTimeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 80,
      child: Row(
        children: [
          const ShimmerSkeleton(
            height: 70,
            width: 70,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ShimmerSkeleton(
                height: 10,
                width: 100,
              ),
              ShimmerSkeleton(
                height: 18,
                width: MediaQuery.sizeOf(context).width - 150,
              ),
              ShimmerSkeleton(
                height: 18,
                width: MediaQuery.sizeOf(context).width - 150,
              ),
            ],
          )
        ],
      ),
    );
  }
}
