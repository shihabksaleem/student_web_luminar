import 'package:lumainar/core/app_utils/app_utils.dart';
import 'package:lumainar/repository/helper/api_helper.dart';
import 'package:lumainar/repository/helper/api_response.dart';

class DeleteAccountOtpVerificationScreenServices {
  Future<APIResponse> verifyOtp({required Map<String, dynamic> body}) async {
    final userId = await AppUtils.getUserId();

    try {
      final APIResponse response =
          await ApiHelper.deleteData(body: body, endPoint: "/user/delete/$userId/", header: ApiHelper.getApiHeader());
      if (response.error) {
        return response;
      } else {
        // LoginResModel redData = LoginResModel.fromJson(response.data["data"]);
        return APIResponse(data: "redData", error: false, errorMessage: '');
      }
    } catch (e) {
      return APIResponse(data: 'res data', error: true, errorMessage: 'failed to fetch data');
    }
  }

  Future<APIResponse> sendOtp() async {
    final userId = await AppUtils.getUserId();
    try {
      final APIResponse response =
          await ApiHelper.getData(endPoint: "/user/delete/send_otp/$userId/", header: ApiHelper.getApiHeader());
      if (response.error) {
        return response;
      } else {
        // LoginResModel redData = LoginResModel.fromJson(response.data["data"]);
        return APIResponse(data: "redData", error: false, errorMessage: '');
      }
    } catch (e) {
      return APIResponse(data: 'res data', error: true, errorMessage: 'failed to fetch data');
    }
  }
}
