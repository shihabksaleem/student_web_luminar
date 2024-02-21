import 'package:lumainar/repository/api/home_screen/res_models/course_list_res_model.dart';
import 'package:lumainar/repository/helper/api_response.dart';
import '../../../../core/app_utils/app_utils.dart';
import '../../../helper/api_helper.dart';

class CourseScreenServices {
  Future<APIResponse> getCourseList() async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/courses/list/", header: ApiHelper.getApiHeader());
      if (response.error) {
        return response;
      } else {
        CourseListResModel resData = CourseListResModel.fromJson(response.data);

        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      return APIResponse(
          data: 'res data', error: true, errorMessage: 'failed to fetch data');
    }
  }
}
