import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lumainar/app_config/app_config.dart';
import 'package:lumainar/repository/api/login_screen/models/login_res_model.dart';
import 'package:lumainar/repository/api/otp_verification_screen/service/otp_verification_screen_service.dart';
import 'package:lumainar/repository/helper/helper_fincitons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpVerificationScreenController extends ChangeNotifier {
  bool isLogged = false;
  bool isLoading = false;
  bool isResendLoading = false;

  late SharedPreferences sharedPreferences;
  LoginResModel? loginData;

  // to Fetch the Course demo videos

  Future<bool> verifyOtp({required String phoneNumber, required String otp}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await OtpVerificationScreenServices().verifyOtp(body: {
        "phone": phoneNumber,
        "otp": otp,
      });
      if (fetchedData.error != true) {
        await HelperFunctions.clearGuestData();
        loginData = fetchedData.data;

        if (loginData != null) {
          Map<String, dynamic> sharedData = {
            'access': loginData!.token?.access,
            "refresh": loginData!.token?.refresh,
            "userId": loginData!.user?.id,
            "studentId": loginData!.user?.studentId,
            "name": loginData!.user?.fullName,
            "email": loginData!.user?.phone,
            "is_active": loginData!.user?.isActive,
            "Phone_verified": loginData!.user?.phoneVerified,
            "user_type": loginData!.user?.userType
          };

          ///setting shared pref
          ///this is where first time the data is stored to sharedpref as map converted json.
          await sharedPreferences.setString(AppConfig.LOGIN_DATA, jsonEncode(sharedData));
          await sharedPreferences.setString(AppConfig.STUDENT_PHONE_NUMBER, loginData!.user?.phone ?? "");

          print(sharedPreferences.get(AppConfig.STUDENT_PHONE_NUMBER));

          print(await sharedPreferences.getString(AppConfig.LOGIN_DATA));
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

  Future<bool> onResendOtp({required String phoneNumber}) async {
    isResendLoading = true;
    notifyListeners();
    try {
      // need to update values from  user input
      final fetchedData = await OtpVerificationScreenServices().reSendOtp(body: {
        "phone": phoneNumber,
      });
      if (fetchedData.error != true) {
        isResendLoading = false;
        notifyListeners();
        return true;
      } else {
        isResendLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      isResendLoading = false;
      notifyListeners();
      return false;
    }
  }
}
