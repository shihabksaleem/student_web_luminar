import 'package:lumainar/repository/helper/api_helper.dart';
import 'package:lumainar/repository/helper/api_response.dart';

class GuestRegistrationScreen {
  Future<APIResponse> onLeadRegistration(
      {required Map<String, dynamic> body}) async {
    try {
      final APIResponse response = await ApiHelper.postData(
          body: body,
          endPoint: "/lead/create/",
          header: ApiHelper.getApiHeader());
      if (response.error) {
        return response;
      } else {
        return APIResponse(data: "redData", error: false, errorMessage: '');
      }
    } catch (e) {
      return APIResponse(
          data: 'res data', error: true, errorMessage: 'failed to fetch data');
    }
  }
}
