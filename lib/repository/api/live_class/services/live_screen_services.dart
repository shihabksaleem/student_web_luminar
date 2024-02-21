import 'package:lumainar/core/app_utils/app_utils.dart';
import 'package:lumainar/repository/api/live_class/model/liveclass_screen_res_model.dart';
import 'package:lumainar/repository/helper/api_helper.dart';
import 'package:lumainar/repository/helper/api_response.dart';

class LiveClassScreenService {
  Future<APIResponse> getLiveClassData({required String batchId}) async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/liveclass/list/$batchId/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      if (response.error) {
        return response;
      } else {
        LiveClassResModel resData = LiveClassResModel.fromJson(response.data);

        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      return APIResponse(
          data: 'res data', error: true, errorMessage: 'failed to fetch data');
    }
  }
}
