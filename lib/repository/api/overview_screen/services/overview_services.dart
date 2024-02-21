import 'package:lumainar/repository/api/overview_screen/res_model/overview_model.dart';

import '../../../../core/app_utils/app_utils.dart';
import '../../../helper/api_helper.dart';
import '../../../helper/api_response.dart';

class OverviewScreenServices {
  Future<APIResponse> getOverviewData({required String batchId}) async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/batches/$batchId/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      if (response.error) {
        return response;
      } else {
        OverviewResModel resData =
            OverviewResModel.fromJson(response.data["data"]);

        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      return APIResponse(
          data: 'res data', error: true, errorMessage: 'failed to fetch data');
    }
  }
}
