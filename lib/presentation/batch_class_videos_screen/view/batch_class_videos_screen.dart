import 'package:flutter/material.dart';
import 'package:lumainar/global_widgets/common_image_view.dart';
import 'package:lumainar/global_widgets/empty_screen_widget.dart';
import 'package:lumainar/global_widgets/reusable_loading_widget.dart';
import 'package:lumainar/presentation/video_player_Screen/view/video_player.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../core/constants/colors.dart';
import '../controller/batch_class_video_screen_controller.dart';

class BatchClassVideoScreen extends StatefulWidget {
  const BatchClassVideoScreen({super.key, required this.batchId});
  final String batchId;

  @override
  State<BatchClassVideoScreen> createState() => _BatchClassVideoScreenState();
}

class _BatchClassVideoScreenState extends State<BatchClassVideoScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<BatchClassVideoController>(context, listen: false)
          .getBatchCalssVideosList(folderId: widget.batchId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final batchClassVideolList = Provider.of<BatchClassVideoController>(context).batchClassVideoList;
    final batchScreenProvider = Provider.of<BatchClassVideoController>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorConstant.primary1),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Batch Class Videos',
          style: TextStyle(color: ColorConstant.lightGrey, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: batchScreenProvider.isLoading
          ? const Center(
              child: ReusableLoadingWidget(),
            )
          : SafeArea(
              child: batchClassVideolList.isEmpty
                  ? EmptyScreenWidget(text: "No Recordings Found")
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: ListView.builder(
                        itemCount: batchClassVideolList.length,
                        itemBuilder: (BuildContext context, int index) {
                          String videoId = YoutubePlayer.convertUrlToId(batchClassVideolList[index].link ?? "") ?? '';
                          return InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => VideoPlayerScreen(videoId: videoId)));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: ListTile(
                                leading: ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                    child: CommonImageView(
                                      width: 80,
                                      url: 'https://img.youtube.com/vi/$videoId/0.jpg',
                                      fit: BoxFit.fitHeight,
                                    )),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      batchClassVideolList[index].title ?? "",
                                      style: const TextStyle(fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 110,
                                          child: Text(
                                            batchClassVideolList[index].description ?? "",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                        Text(
                                          batchClassVideolList[index].date ?? "",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                trailing: const Icon(
                                  Icons.fullscreen,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
    );
  }
}
