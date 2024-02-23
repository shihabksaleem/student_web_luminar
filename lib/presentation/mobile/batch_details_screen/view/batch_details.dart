import 'package:flutter/material.dart';
import 'package:lumainar/presentation/mobile/video_folder_screen/view/video_folder_screen.dart';
import '../../../../core/constants/colors.dart';

import 'widgets/batch_screen_container.dart';

class BatchDetails extends StatefulWidget {
  const BatchDetails({
    super.key,
    required this.batchname,
    required this.batchId,
  });
  final String batchname;
  final String batchId;

  @override
  State<BatchDetails> createState() => _BatchDetailsState();
}

class _BatchDetailsState extends State<BatchDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Batch Details",
          style: TextStyle(color: ColorConstant.primary1, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: ColorConstant.primary1),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                widget.batchname,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              const SizedBox(height: 15),
              // Calling Attandance Screen here
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => BatchClassVideoScreen(
                  //           batchId: widget.batchId.toString(),
                  //         )));
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => VideoFolderScreen(batchId: widget.batchId.toString())));
                },
                child: const BatchDetailsContainer(
                  iconname: Icons.video_call,
                  name: "Videos",
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
