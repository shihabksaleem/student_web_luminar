import 'package:flutter/material.dart';
import 'package:lumainar/repository/api/change_password_screen/service/change_password_screen_service.dart';

class ChangePasswordScreenController with ChangeNotifier {
  bool isPostLoading = false;

  // to Fetch the Course demo videos

  Future<bool> updatePassword({required String newPassword, required String userId}) async {
    isPostLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await ChangePasswordScreenServices().onUpdatePasswordClicked(userId: userId, body: {
        "password": newPassword,
      });

      if (fetchedData.error != true) {
        isPostLoading = false;
        notifyListeners();
        return true;
      } else {
        isPostLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      print(e.toString());
      isPostLoading = false;
      notifyListeners();
      return false;
    }
  }
}
