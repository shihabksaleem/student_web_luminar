import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class BatchDetailsContainer extends StatefulWidget {
  final name;
  final IconData iconname;
  const BatchDetailsContainer(
      {super.key, required this.iconname, required this.name});

  @override
  State<BatchDetailsContainer> createState() => _BatchDetailsContainerState();
}

class _BatchDetailsContainerState extends State<BatchDetailsContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        child: Container(
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromARGB(255, 239, 236, 239),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        widget.iconname,
                        color: ColorConstant.primary1,
                        size: 25,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        widget.name,
                        style: TextStyle(
                            color: ColorConstant.mainBlack,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                  )
                ],
              ),
            )));
  }
}
