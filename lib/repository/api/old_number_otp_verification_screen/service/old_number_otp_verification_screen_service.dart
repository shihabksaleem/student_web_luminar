import 'package:lumainar/core/app_utils/app_utils.dart';
import 'package:lumainar/repository/api/login_screen/models/login_res_model.dart';
import 'package:lumainar/repository/helper/api_response.dart';

import '../../../helper/api_helper.dart';

class OldNumberOtpVerificationScreenServices {
  Future<APIResponse> verifyOldNumberOtp({required Map<String, dynamic> body}) async {
    final userId = await AppUtils.getUserId();

    final APIResponse response = await ApiHelper.postData(
      body: body,
      endPoint: "/user/phone_number_change/verify_otp/$userId/",
      header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()),
    );
    if (response.error) {
      return response;
    } else {
      // LoginResModel redData = LoginResModel.fromJson(response.data);
      return APIResponse(data: "redData", error: false, errorMessage: '');
    }
  }

  Future<APIResponse> sendOldNumberOtp() async {
    final userId = await AppUtils.getUserId();

    final APIResponse response = await ApiHelper.getData(
      endPoint: "/user/phone_number_change/send_otp/$userId/",
      header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()),
    );
    if (response.error) {
      return response;
    } else {
      // LoginResModel redData = LoginResModel.fromJson(response.data["data"]);
      return APIResponse(data: "redData", error: false, errorMessage: '');
    }
  }
}
