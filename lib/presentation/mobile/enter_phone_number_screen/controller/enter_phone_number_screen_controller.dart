import 'package:flutter/material.dart';
import 'package:lumainar/repository/api/change_password_otp_verification_screen/service/change_password_otp_verification_screen_service.dart';
import 'package:lumainar/repository/api/login_screen/models/login_res_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnterPhoneNumberScreenController with ChangeNotifier {
  bool isLoading = false;

  String? userId;
  bool isOtpSend = false;
  Future<bool> sendOtp({required String phoneNumber}) async {
    isLoading = true;
    notifyListeners();
    try {
      // need to update values from  user input
      final fetchedData = await ChangePasswordOtpVerificationScreenServices().sendOtp(body: {
        "phone": phoneNumber,
      });
      if (fetchedData.error != true) {
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

  Future<bool> verifyOtp({required String otp, required String phoneNumber}) async {
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await ChangePasswordOtpVerificationScreenServices().verifyOtp(body: {
        "phone": phoneNumber,
        "otp": otp,
      });

      if (fetchedData.error != true) {
        //Todo write code to save new phone number
        //Todo write code to save new phone number
        LoginResModel? loginData = fetchedData.data;

        if (loginData != null) {
          userId = loginData.user?.id.toString();
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
      print(e.toString());
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  void onOtpSend(bool value) {
    isOtpSend = value;
    notifyListeners();
  }
}
