import 'package:lumainar/repository/api/login_screen/models/login_res_model.dart';
import 'package:lumainar/repository/helper/api_response.dart';

import '../../../helper/api_helper.dart';

class LoginScreenServides {
  Future<APIResponse> onLogin({required Map<String, dynamic> body}) async {
    try {
      final APIResponse response = await ApiHelper.postData(
          body: body,
          endPoint: "/user/login/",
          header: ApiHelper.getApiHeader());
      if (response.error) {
        return response;
      } else {
        LoginResModel redData = LoginResModel.fromJson(response.data["data"]);
        return APIResponse(data: redData, error: false, errorMessage: '');
      }
    } catch (e) {
      return APIResponse(
          data: 'res data', error: true, errorMessage: 'failed to fetch data');
    }
  }
}
