import 'package:lumainar/core/app_utils/app_utils.dart';
import 'package:lumainar/repository/api/splash_screen/model/mobile_app_res_model.dart';
import 'package:lumainar/repository/helper/api_helper.dart';
import 'package:lumainar/repository/helper/api_response.dart';

class SplashScreenServices {
  Future<APIResponse> fcmKeyUpload(Map<String, dynamic> body) async {
    final userId = await AppUtils.getUserId();
    final APIResponse res = await ApiHelper.postData(
        endPoint: '/user/add_fcm_token/$userId/',
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()),
        body: body);
    if (res.error == true) {
      print('error service');
      // AppUtils.oneTimeSnackBar(res.errorMessage);
      return res;
    } else {
      return APIResponse(data: res.data['data'], error: false, errorMessage: '');
    }
  }

  Future<APIResponse> getMobileVersion() async {
    //get stored student id

    final APIResponse response = await ApiHelper.getData(
      endPoint: "/mob_version/",
      header: ApiHelper.getApiHeader(),
    );
    if (response.error) {
      return response;
    } else {
      MobileVersionResModel resData = MobileVersionResModel.fromJson(response.data);

      return APIResponse(data: resData, error: false, errorMessage: '');
    }
  }
}
