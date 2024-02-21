import 'package:lumainar/core/app_utils/app_utils.dart';
import 'package:lumainar/repository/api/home_screen/res_models/banner_re_model.dart';
import 'package:lumainar/repository/api/home_screen/res_models/course_list_res_model.dart';
import 'package:lumainar/repository/helper/api_response.dart';

import '../../../helper/api_helper.dart';
import '../res_models/demo_video_res_model.dart';

class HomeScreenServices {
  Future<APIResponse> getCourseList() async {
    final APIResponse response = await ApiHelper.getData(
        endPoint: "/courses/list/", header: ApiHelper.getApiHeader());
    if (response.error) {
      return response;
    } else {
      CourseListResModel resData = CourseListResModel.fromJson(response.data);

      return APIResponse(data: resData, error: false, errorMessage: '');
    }
  }

  // here is the service class for calling the images slider api
  Future<APIResponse> getSliderList() async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/banners/all/", header: ApiHelper.getApiHeader());
      if (response.error) {
        return response;
      } else {
        BannerModel resData = BannerModel.fromJson(response.data);

        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      return APIResponse(
          data: 'res data', error: true, errorMessage: 'failed to fetch data');
    }
  }

  Future<APIResponse> getDemoVideoCourseList() async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/democlass/courses/list/",
          header: ApiHelper.getApiHeader());
      if (response.error) {
        return response;
      } else {
        DemoCourseResModel resData = DemoCourseResModel.fromJson(response.data);

        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      return APIResponse(
          data: 'res data', error: true, errorMessage: 'failed to fetch data');
    }
  }
}
