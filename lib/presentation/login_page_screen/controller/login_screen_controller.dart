import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lumainar/app_config/app_config.dart';
import 'package:lumainar/repository/api/login_screen/models/login_res_model.dart';
import 'package:lumainar/repository/api/login_screen/service/login_screen_service.dart';
import 'package:lumainar/repository/helper/helper_fincitons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenController extends ChangeNotifier {
  bool isLogged = false;
  bool isLoading = false;
  late SharedPreferences sharedPreferences;
  bool? isMobileVerified = false;
  LoginResModel? loginData;
  String? userPhoneNumber;
  bool isPasswordVisible = false;

  // to Fetch the Course demo videos

  Future<bool> onLogin({required String phoneNumber, required String password}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await LoginScreenServides().onLogin(body: {
        "phone": phoneNumber,
        "password": password,
      });
      if (fetchedData.error != true) {
        await HelperFunctions.clearGuestData();
        loginData = fetchedData.data;
        isMobileVerified = loginData!.user?.phoneVerified;
        userPhoneNumber = loginData!.user?.phone;

        if (loginData != null && loginData!.user?.phoneVerified == true) {
          Map<String, dynamic> sharedData = {
            'access': loginData!.token?.access,
            "refresh": loginData!.token?.refresh,
            "userId": loginData!.user?.id,
            "studentId": loginData!.user?.studentId,
            "name": loginData!.user?.fullName,
            "email": loginData!.user?.phone,
            "is_active": loginData!.user?.isActive,
            "Phone_verified": loginData!.user?.phoneVerified,
            "user_type": loginData!.user?.userType,
          };

          ///setting shared pref
          ///this is where first time the data is stored to sharedpref as map converted json.
          await sharedPreferences.setString(AppConfig.LOGIN_DATA, jsonEncode(sharedData));
          await sharedPreferences.setString(AppConfig.STUDENT_PHONE_NUMBER, loginData!.user?.phone ?? "");
        }

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

  void eyButton() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }
}
