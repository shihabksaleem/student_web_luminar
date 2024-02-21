import 'package:lumainar/core/app_utils/app_utils.dart';
import 'package:lumainar/repository/api/folder_video_screen/model/folder_video_model.dart';
import 'package:lumainar/repository/helper/api_helper.dart';
import 'package:lumainar/repository/helper/api_response.dart';

class FolderVideoScreenService {
  Future<APIResponse> getFolders({required String batchId}) async {
    final APIResponse response = await ApiHelper.getData(
        endPoint: "/video_folder/list/batch/$batchId/",
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
    if (response.error) {
      return response;
    } else {
      FolderVideoModel resData = FolderVideoModel.fromJson(response.data);

      return APIResponse(data: resData, error: false, errorMessage: '');
    }
  }
}
