import 'package:lumainar/core/app_utils/app_utils.dart';
import 'package:lumainar/repository/api/attendance_screen_model/res_model/attedance_scree_model.dart';
import 'package:lumainar/repository/helper/api_helper.dart';
import 'package:lumainar/repository/helper/api_response.dart';

class AttendenceScreenServices {
  Future<APIResponse> getattendencedata({required String batchid}) async {
    final studentId = await AppUtils.getStudentId();
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/attendance/overview/student/$studentId/batch/$batchid/",
          header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      if (response.error) {
        return response;
      } else {
        AttandanceOverviewModel resData = AttandanceOverviewModel.fromJson(response.data);

        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      print("failed to fetch attandance list in attandance Screen ");
      return APIResponse(data: "resData", error: true, errorMessage: '');
    }
  }
}
