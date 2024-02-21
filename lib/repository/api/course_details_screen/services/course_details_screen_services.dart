import 'package:lumainar/repository/api/course_details_screen/models/course_details_res_model.dart';
import 'package:lumainar/repository/helper/api_response.dart';
import '../../../../core/app_utils/app_utils.dart';
import '../../../helper/api_helper.dart';

class CourseDetailsScreenServices {
  //function to get course detils

  Future<APIResponse> getCourseDetials({required String courseId}) async {
    try {
      final APIResponse response =
          await ApiHelper.getData(endPoint: "/courses/$courseId/", header: ApiHelper.getApiHeader());
      if (response.error) {
        return response;
      } else {
        CourseDetailsScreenResData resData = CourseDetailsScreenResData.fromJson(response.data['data']);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      return APIResponse(data: "resData", error: true, errorMessage: '');
    }
  }
}
