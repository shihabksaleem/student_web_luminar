import 'package:lumainar/repository/api/assignment_screen/res_model/assignment_screen_model.dart';
import 'package:lumainar/repository/helper/api_response.dart';

import '../../../../core/app_utils/app_utils.dart';
import '../../../helper/api_helper.dart';

class AssignmentScreenServices {
  Future<APIResponse> getAssignmentList() async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/api/student/assignment/",
          header: ApiHelper.getApiHeader());
      if (response.error) {
        return response;
      } else {
        AssignmentScreenModel resData =
            AssignmentScreenModel.fromJson(response.data);

        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      print("failed to fetch assignment Screen Screen ");
      return APIResponse(
          data: 'res data', error: true, errorMessage: 'failed to fetch data');
    }
  }
}
