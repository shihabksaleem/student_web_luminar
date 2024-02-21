import 'package:lumainar/core/app_utils/app_utils.dart';

import 'package:lumainar/repository/api/monthly_attandance_screen/res_model/monthly_attandance_model.dart';
import 'package:lumainar/repository/helper/api_helper.dart';
import 'package:lumainar/repository/helper/api_response.dart';

class MonthlyAttendenceScreenServices {
  Future<APIResponse> getMonthlyattendencedata(
      {required String batchId,
      String? fromDate,
      String? toDate,
      String? statusFilter}) async {
    var studentId = await AppUtils.getStudentId();
    try {
      Uri baseUrl =
          Uri.parse('/attendance/all/student/$studentId/batch/$batchId');
      // Query parameters map
      Map<String, dynamic> queryParams = {};

      // Add 'fromDate' and 'toDate' if fromDate is not null
      if (fromDate != null) {
        if (toDate == null) {
          throw ArgumentError(
              "If fromDate is not null, toDate must not be null.");
        }
        queryParams['from_date'] = fromDate;
        queryParams['to_date'] = toDate;
      }

      // Add 'status' if not null
      if (statusFilter != null) {
        queryParams['status'] = statusFilter;
      }
      // Build the final URI with query parameters
      Uri finalUrl = baseUrl.replace(queryParameters: queryParams);
      print(finalUrl.toString());

      final APIResponse response = await ApiHelper.getData(
          endPoint: finalUrl.toString(),
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      if (response.error) {
        return response;
      } else {
        MonthyAttandanceModel resData =
            MonthyAttandanceModel.fromJson(response.data);

        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      print(
          "failed to fetch monthly Attandance list in monthlyattandance screen Screen ");
      return APIResponse(data: "resData", error: true, errorMessage: '');
    }
  }
}
