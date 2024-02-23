import 'package:flutter/material.dart';
import 'package:lumainar/repository/api/folder_video_screen/model/folder_video_model.dart';
import 'package:lumainar/repository/api/folder_video_screen/services/folder_video_screen_sevices.dart';

class FolderVideoController extends ChangeNotifier {
  bool isLoading = true;
  bool isListChecker = false;
  bool? isGridChecker;
  List<FolderVideoDetails> folderVideoList = [];

  Future<bool> folderVideoData({required String batchId}) async {
    isLoading = true;
    notifyListeners();
    try {
      final fetchedData =
          await FolderVideoScreenService().getFolders(batchId: batchId);
      if (fetchedData.error != true) {
        FolderVideoModel folderideoModel = fetchedData.data;
        folderVideoList = folderideoModel.folderList ?? [];
        isLoading = false;
        print(folderVideoList);
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
    notifyListeners();
  }

  void gridChecker() {
    isListChecker = !isListChecker;
    print(isListChecker);
    notifyListeners();
  }
}
