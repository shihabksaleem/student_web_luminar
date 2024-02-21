import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lumainar/core/constants/colors.dart';

class BottomSheetForUploadFile extends StatelessWidget {
  final bottomSheetItems;
  const BottomSheetForUploadFile({Key? key, required this.bottomSheetItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    BorderRadius borderRounded16 = BorderRadius.circular(16);
    BorderRadius borderRoundedDouble = BorderRadius.circular(2.5);

    return Container(
        margin: EdgeInsets.all(16),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: borderRounded16, color: ColorConstant.myWhite),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FractionallySizedBox(
              widthFactor: 0.25,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 12),
                child: Container(
                  height: 5,
                  decoration: BoxDecoration(
                    color: ColorConstant.primary1,
                    borderRadius: borderRoundedDouble,
                  ),
                ),
              ),
            ),
            Container(
              height: 200,
              color: ColorConstant.myWhite,
              child: bottomSheetItems,
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ));
  }
}
