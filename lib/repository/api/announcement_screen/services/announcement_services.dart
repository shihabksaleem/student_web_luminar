import 'package:lumainar/core/app_utils/app_utils.dart';
import 'package:lumainar/repository/api/announcement_screen/announcement_model/announcement_model.dart';
import 'package:lumainar/repository/helper/api_response.dart';

import '../../../helper/api_helper.dart';

class AnnouncementScreenServices {
  Future<APIResponse> getAnnouncementList() async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/batches/announcement/student/all/",
          header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      if (response.error) {
        return response;
      } else {
        AnnouncementScreenModel resData = AnnouncementScreenModel.fromJson(response.data);

        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      return APIResponse(data: 'res data', error: true, errorMessage: 'failed to fetch data');
    }
  }
}
