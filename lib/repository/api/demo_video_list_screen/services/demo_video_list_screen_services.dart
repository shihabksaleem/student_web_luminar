import 'package:lumainar/repository/api/demo_video_list_screen/models/demo_video_list_res_model.dart';
import 'package:lumainar/repository/helper/api_response.dart';
import '../../../helper/api_helper.dart';

class DemoVideoListScreenServices {
  Future<APIResponse> getDemoVideosList({required String courseId}) async {
    final APIResponse response = await ApiHelper.getData(
        endPoint: "/democlass/list/$courseId/",
        header: ApiHelper.getApiHeader());
    if (response.error) {
      return response;
    } else {
      DemoVideoListRestModel resData =
          DemoVideoListRestModel.fromJson(response.data);

      return APIResponse(data: resData, error: false, errorMessage: '');
    }
  }
}
