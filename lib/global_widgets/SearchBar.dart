import 'package:flutter/material.dart';

import '../core/constants/colors.dart';

class SearchBarContainer extends StatelessWidget {
  const SearchBarContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.search,
              color: ColorConstant.lightGrey,
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
