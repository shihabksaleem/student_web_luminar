import 'package:lumainar/core/app_utils/app_utils.dart';
import 'package:lumainar/repository/api/batch_class_videio_screen/models/batch_class_video_res_model.dart';
import 'package:lumainar/repository/helper/api_helper.dart';
import 'package:lumainar/repository/helper/api_response.dart';

class BatchClassVideosScreenService {
  Future<APIResponse> getBatchClassVideos({required String folderId}) async {
    final APIResponse response = await ApiHelper.getData(
        endPoint: "/classvideos/list/$folderId/",
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
    if (response.error) {
      return response;
    } else {
      BatchCalssVideosListResModel resData =
          BatchCalssVideosListResModel.fromJson(response.data);

      return APIResponse(data: resData, error: false, errorMessage: '');
    }
  }
}
