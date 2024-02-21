import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:lumainar/core/constants/colors.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app_config/app_config.dart';

class AppUtils {
  ///use to print any data for testing and later will be useful to remove the print inside this
  printError(data) {
    print('============Error===============');
    print(data);
    print('============Error===============');
  }

  printData(data, {String info = 'DATA'}) {
    print('============$info===============');
    print(data);
    print('============$info===============');
  }

  //write datas need to use across all parts of the app here

  //vaidate password registration fields and cahnge fields
  static String? isPasswordValid(String password) {
    if (password.isEmpty) {
      return 'Password should not be empty.';
    }

    if (password.length < 8) {
      return 'Password must be at least 8 characters long.';
    }

    if (!RegExp(r'(?=.*[A-Z])').hasMatch(password)) {
      return 'Password should contain at least one uppercase letter.';
    }

    if (!RegExp(r'(?=.*[a-z])').hasMatch(password)) {
      return 'Password should contain at least one lowercase letter.';
    }

    if (!RegExp(r'(?=.*?[0-9])').hasMatch(password)) {
      return 'Password should contain at least one digit.';
    }

    if (!RegExp(r'(?=.*?[!@#\$&*~])').hasMatch(password)) {
      return 'Password should contain at least one special character (!@#\$&*~).';
    }

    // If all conditions pass, the password is valid.
    return null;
  }

  static bool validationOfEmail(String emailPassed) {
    var email = emailPassed;
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    return emailValid;
  }

  static bool validationOfName(String namePassed) {
    var name = namePassed;
    bool nameValid = RegExp(r"^[a-zA-Z ][a-zA-Z ]+[a-zA-Z ]$").hasMatch(name);
    return nameValid;
  }

  static bool validationOfPIN(String passedPIN) {
    var pin = passedPIN;
    bool isValid = RegExp(r"^[1-9]{1}\d{2}\s?\d{3}$").hasMatch(pin);
    return isValid;
  }

  static bool validationOfPhone(String passedPhone) {
    var phone = passedPhone;
    bool isValid = RegExp(r"^[0-9]{10,10}").hasMatch(phone);
    return isValid;
  }

  static bool validateOTP(String otp) {
    bool isValid = RegExp(r"^[0-9]{4}$").hasMatch(otp);
    return isValid;
  }

  ///Used to check internet connectivity with package => internet_connection_checker: ^0.0.1+3
  ///user this on every btn / or can be implemented on service before API call
  static Future<bool> isOnline() async {
    // bool isOnline = await InternetConnectionChecker().hasConnection;
    bool isOnline = true;

    if (isOnline) {
      return true;
    } else {
      // oneTimeSnackBar('No network connection!');
      return false;
    }
  }

  ///used this for luminar
  static Future<String?> getAccessKey() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.get(AppConfig.LOGIN_DATA) != null) {
      final access = jsonDecode(sharedPreferences.get(AppConfig.LOGIN_DATA) as String)['access'];
      return access;
    } else {
      return null;
    }
  }

  ///used this for luminar
  static Future<String?> getGuestDetails() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString(AppConfig.GUEST_PHONENUMBER) != null) {
      final guestDetails = sharedPreferences.getString(AppConfig.GUEST_PHONENUMBER);
      return guestDetails;
    } else {
      return null;
    }
  }

  //use this for getting user id
  static Future<String?> getUserId() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.get(AppConfig.LOGIN_DATA) != null) {
      final userId = jsonDecode(sharedPreferences.get(AppConfig.LOGIN_DATA) as String)['userId'].toString();
      return userId;
    } else {
      return null;
    }
  }

//use this for getting student id
  static Future<String?> getStudentId() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.get(AppConfig.LOGIN_DATA) != null) {
      final studentId = jsonDecode(sharedPreferences.get(AppConfig.LOGIN_DATA) as String)['studentId'].toString();
      return studentId;
    } else {
      return null;
    }
  }

  static Future<String?> getStudentPhoneNumber() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.get(AppConfig.STUDENT_PHONE_NUMBER) != null) {
      final studentPhoneNumber = sharedPreferences.get(AppConfig.STUDENT_PHONE_NUMBER) as String;
      return studentPhoneNumber;
    } else {
      return null;
    }
  }

  ///used this for getting student movbile number verification status
  static Future<String?> getPhoneVerificaitonStatus() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.get(AppConfig.LOGIN_DATA) != null) {
      final isVerified = jsonDecode(sharedPreferences.get(AppConfig.LOGIN_DATA) as String)['Phone_verified'];
      return isVerified;
    } else {
      return null;
    }
  }

  static oneTimeSnackBar(
    String? message, {
    int time = 2,
    Color? bgColor,
    TextStyle? textStyle,
    required BuildContext context,
    bool showOnTop = false,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ///To CLEAR PREVIOUS SNACK BARS
    return ScaffoldMessenger.of(context)
        // ScaffoldMessenger.of(context??Routes.router.routerDelegate.navigatorKey.currentState!.context)
        .showSnackBar(
      SnackBar(
        /*action:SnackBarAction(label: "Ok",
        onPressed: (){
          SystemSettings.internalStorage();
        },
        ) ,*/

        behavior: showOnTop ? SnackBarBehavior.floating : null,
        backgroundColor: bgColor ?? ColorConstant.primary1,
        content: Text(message!, style: textStyle),
        duration: Duration(seconds: time),
        margin: showOnTop
            ? EdgeInsets.only(bottom: MediaQuery.of(context ?? context).size.height - 100, right: 20, left: 20)
            : null,
      ),
    );
  }

  ///to log data for debugging
  static Logger logger = Logger();

  // update

  static Future<bool> haveUpdate({required String newVersion}) async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();

      String currentVersion = packageInfo.version;
      String buildNumber = packageInfo.buildNumber;
      AppUtils().printData("$currentVersion+$buildNumber", info: "full version version");
      AppUtils().printData(buildNumber, info: "buildNumber");

      // Parse versions using Version.parse function
      final Version current = Version.parse("$currentVersion+$buildNumber");
      final Version latest = Version.parse(newVersion);

      // Compare versions
      final comparisonResult = current.compareTo(latest);
      print(comparisonResult);

      // Check if current version is lower than the latest version
      if (comparisonResult < 0) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
