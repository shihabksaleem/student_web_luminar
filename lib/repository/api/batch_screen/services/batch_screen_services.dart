import 'package:lumainar/repository/helper/api_response.dart';
import 'package:lumainar/repository/api/batch_screen/res_model/batch_screen_model.dart';

import '../../../../core/app_utils/app_utils.dart';
import '../../../helper/api_helper.dart';

class BatchScreenServices {
  Future<APIResponse> getBatchList() async {
    final studentId = await AppUtils.getStudentId();
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/batches/list/", header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      if (response.error) {
        return response;
      } else {
        BatchesListResModel resData = BatchesListResModel.fromJson(response.data);

        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      return APIResponse(data: 'res data', error: true, errorMessage: 'failed to fetch data');
    }
  }
}
