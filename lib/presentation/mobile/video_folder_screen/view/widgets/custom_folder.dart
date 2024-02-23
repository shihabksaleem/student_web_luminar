import 'package:flutter/material.dart';
import 'package:lumainar/core/constants/image_constants.dart';

class CustomFolder extends StatelessWidget {
  final String titile;
  const CustomFolder({super.key, required this.titile});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(255, 234, 234, 234))),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 76,
              width: 146,
              child: Center(
                child: Image.asset(
                  ImageConstants.videoFolderImge,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titile.toUpperCase(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "By Luminar Technolab",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 16,
            ),
            SizedBox(width: 20),
          ],
        ));

    //  Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 5),
    //   child: ListTile(
    //       leading: Image.asset(
    //     "assets/images/course_image/folder.png",
    //     fit: BoxFit.cover,
    //   )),
    // );
  }
}
