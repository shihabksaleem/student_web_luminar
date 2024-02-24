import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyScreenWidget extends StatelessWidget {
  const EmptyScreenWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      width: MediaQuery.of(context).size.height * .5,
                      'assets/animations/not data.json',
                      reverse: true,
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // Text(
                    //   text,
                    //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    // )
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    ));
  }
}
