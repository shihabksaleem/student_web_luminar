import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lumainar/core/constants/animation_constants.dart';

class ReusableLoadingWidget extends StatelessWidget {
  const ReusableLoadingWidget({super.key, this.animaiton});
  final String? animaiton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        animaiton ?? AnimationConstants.loadingBlack,
        height: 60,
        width: 60,
      ),
    );
  }
}
