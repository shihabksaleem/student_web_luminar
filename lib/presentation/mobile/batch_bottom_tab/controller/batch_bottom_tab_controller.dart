import 'package:flutter/material.dart';
import 'package:lumainar/repository/api/batch_screen/res_model/batch_screen_model.dart';
import 'package:lumainar/repository/api/batch_screen/services/batch_screen_services.dart';

class BatchScreenController extends ChangeNotifier {
  bool isBatchsscreenLoading = true;
  List<BatchData> batchList = [];

  Future<bool> getBatchList() async {
    isBatchsscreenLoading = true;
    notifyListeners();

    try {
      final fetchedData = await BatchScreenServices().getBatchList();
      if (fetchedData.error != true) {
        BatchesListResModel batchScreenModel = fetchedData.data;
        batchList = batchScreenModel.batchesList ?? [];
        isBatchsscreenLoading = false;
        notifyListeners();
        return true;
      } else {
        isBatchsscreenLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      print(e);
      isBatchsscreenLoading = false;
      notifyListeners();
      return false;
    }
  }
}
