import 'package:lumainar/core/app_utils/app_utils.dart';
import 'package:lumainar/repository/api/login_screen/models/login_res_model.dart';
import 'package:lumainar/repository/helper/api_response.dart';

import '../../../helper/api_helper.dart';

class ChangePasswordScreenServices {
  Future<APIResponse> onUpdatePasswordClicked({required Map<String, dynamic> body, required String userId}) async {
    try {
      final APIResponse response = await ApiHelper.postData(
          body: body,
          endPoint: "/user/change/password/$userId/",
          header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      if (response.error) {
        return response;
      } else {
        // LoginResModel redData = LoginResModel.fromJson(response.data);
        return APIResponse(data: "redData", error: false, errorMessage: '');
      }
    } catch (e) {
      return APIResponse(data: 'res data', error: true, errorMessage: 'failed to fetch data');
    }
  }
}
