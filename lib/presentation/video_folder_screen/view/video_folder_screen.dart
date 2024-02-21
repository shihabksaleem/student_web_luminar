import 'package:flutter/material.dart';
import 'package:lumainar/core/constants/colors.dart';
import 'package:lumainar/core/constants/image_constants.dart';
import 'package:lumainar/global_widgets/reusable_loading_widget.dart';
import 'package:lumainar/presentation/batch_class_videos_screen/view/batch_class_videos_screen.dart';
import 'package:lumainar/presentation/video_folder_screen/controller/video_folder_controller.dart';
import 'package:lumainar/presentation/video_folder_screen/view/widgets/custom_folder.dart';
import 'package:provider/provider.dart';

class VideoFolderScreen extends StatefulWidget {
  final String batchId;
  const VideoFolderScreen({super.key, required this.batchId});

  @override
  State<VideoFolderScreen> createState() => _VideoFolderScreenState();
}

class _VideoFolderScreenState extends State<VideoFolderScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<FolderVideoController>(context, listen: false).folderVideoData(batchId: widget.batchId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final folderVideoListData = Provider.of<FolderVideoController>(context);
    print(folderVideoListData.folderVideoList.length);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          InkWell(
              onTap: () {
                Provider.of<FolderVideoController>(context, listen: false).gridChecker();
              },
              child: folderVideoListData.isListChecker == true
                  ? Icon(
                      Icons.list_sharp,
                      color:
                          folderVideoListData.isListChecker == true ? ColorConstant.primary1 : ColorConstant.mainBlack,
                    )
                  : Icon(
                      Icons.apps,
                      color:
                          folderVideoListData.isListChecker == true ? ColorConstant.primary1 : ColorConstant.mainBlack,
                    )),
          SizedBox(
            width: 15,
          ),
          SizedBox(
            width: 25,
          ),
        ],
      ),
      body: folderVideoListData.isLoading
          ? ReusableLoadingWidget()
          : folderVideoListData.folderVideoList.isEmpty
              ? Center(
                  child: Text("No data found"),
                )
              : folderVideoListData.isListChecker == true
                  ? ListView.separated(
                      itemCount: folderVideoListData.folderVideoList.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BatchClassVideoScreen(
                                    batchId: folderVideoListData.folderVideoList[index].id.toString(),
                                  )));
                        },
                        child: CustomFolder(
                          titile: folderVideoListData.folderVideoList[index].name ?? "",
                        ),
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                    )
                  : GridView.builder(
                      padding: EdgeInsets.only(top: 30),
                      itemCount: folderVideoListData.folderVideoList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => BatchClassVideoScreen(
                                batchId: folderVideoListData.folderVideoList[index].id.toString(),
                              ),
                            ),
                          );
                        },
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                height: 76,
                                width: 146,
                                child: Center(
                                  child: Image.asset(
                                    ImageConstants.videoFolderImge,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    folderVideoListData.folderVideoList[index].name ?? "",
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
    );
  }
}
