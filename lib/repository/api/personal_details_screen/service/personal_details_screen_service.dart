import 'package:lumainar/core/app_utils/app_utils.dart';
import 'package:lumainar/repository/api/personal_details_screen/model/student_personal_details_res_model.dart';
import 'package:lumainar/repository/helper/api_helper.dart';
import 'package:lumainar/repository/helper/api_response.dart';

class PersonalDetailsScreenService {
  Future<APIResponse> getStudentPersonalDetails() async {
    //get stored student id
    String studentId = await AppUtils.getStudentId() ?? "";

    final APIResponse response = await ApiHelper.getData(
        endPoint: "/student/detail/$studentId/",
        header: ApiHelper.getApiHeader());
    if (response.error) {
      return response;
    } else {
      StudentPersonalDetailsResModel resData =
          StudentPersonalDetailsResModel.fromJson(response.data["data"]);

      return APIResponse(data: resData, error: false, errorMessage: '');
    }
  }
}
