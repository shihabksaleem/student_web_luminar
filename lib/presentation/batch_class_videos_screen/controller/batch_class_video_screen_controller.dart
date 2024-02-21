import 'package:flutter/material.dart';
import 'package:lumainar/repository/api/batch_class_videio_screen/models/batch_class_video_res_model.dart';
import 'package:lumainar/repository/api/batch_class_videio_screen/service/batch_class_videos_screen_service.dart';

class BatchClassVideoController extends ChangeNotifier {
  bool isLoading = true;
  List<BatchClassVideoModel> batchClassVideoList = [];

  Future<bool> getBatchCalssVideosList({required String folderId}) async {
    isLoading = true;
    notifyListeners();
    try {
      final fetchedData = await BatchClassVideosScreenService()
          .getBatchClassVideos(folderId: folderId);
      if (fetchedData.error != true) {
        BatchCalssVideosListResModel demovideoModel = fetchedData.data;
        batchClassVideoList = demovideoModel.batchClassVideosList ?? [];
        isLoading = false;
        notifyListeners();
        return true;
      } else {
        isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();

      return false;
    }
  }

  void resetState() {
    isLoading = true;
    batchClassVideoList = [];
  }
}
