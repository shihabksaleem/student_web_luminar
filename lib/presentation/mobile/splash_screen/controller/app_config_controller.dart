import 'package:flutter/material.dart';
import 'package:lumainar/core/app_utils/app_utils.dart';
import 'package:lumainar/presentation/mobile/batch_bottom_tab/controller/batch_bottom_tab_controller.dart';
import 'package:lumainar/presentation/mobile/batch_bottom_tab/view/batch_bottom_tab.dart';
import 'package:lumainar/repository/api/personal_details_screen/model/student_personal_details_res_model.dart';
import 'package:lumainar/repository/api/personal_details_screen/service/personal_details_screen_service.dart';
import 'package:lumainar/repository/api/splash_screen/model/mobile_app_res_model.dart';
import 'package:lumainar/repository/api/splash_screen/service/splash_screen_sevice.dart';
import 'package:provider/provider.dart';

class AppConfigController with ChangeNotifier {
  bool isLoading = false;
  StudentPersonalDetailsResModel? studentDetails;
  List<int> studentCourseList = [];
  bool haveAccess = false;
  String? newMobileVersion;

  /// This global key is used in material app for navigation through firebase notifications.
  static final GlobalKey<NavigatorState> navigatorState = GlobalKey<NavigatorState>();

  Future<bool> getStudentProfileDetaisl() async {
    isLoading = true;
    notifyListeners();

    try {
      final fetchedData = await PersonalDetailsScreenService().getStudentPersonalDetails();
      if (fetchedData.error != true) {
        studentDetails = fetchedData.data;
        studentCourseList = studentDetails?.coursesId ?? [];
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

  haveAccessKey() async {
    String accessToken = await AppUtils.getAccessKey() ?? "";
    if (accessToken.isEmpty) {
      haveAccess = false;
      notifyListeners();
    } else {
      haveAccess = true;

      Navigator.pushAndRemoveUntil(
        AppConfigController.navigatorState.currentContext!,
        MaterialPageRoute(
            builder: (context) =>
                ChangeNotifierProvider(create: (context) => BatchScreenController(), child: BatchBottomTab())),
        (route) => false,
      );

      notifyListeners();
    }
  }

  void resetState() {
    isLoading = false;
    studentDetails = null;
    studentCourseList = [];
  }

  //fcm token

  Future<String?> getMobileVersion() async {
    isLoading = true;
    notifyListeners();

    try {
      final fetchedData = await SplashScreenServices().getMobileVersion();
      if (fetchedData.error != true) {
        MobileVersionResModel resModel = fetchedData.data;
        newMobileVersion = resModel.mobileVersionData?.version ?? "1.0.0";

        isLoading = false;
        notifyListeners();
        return newMobileVersion;
      } else {
        isLoading = false;
        notifyListeners();
        return null;
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return null;
    }
  }
}
