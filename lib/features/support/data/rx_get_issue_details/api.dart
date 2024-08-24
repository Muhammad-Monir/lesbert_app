import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../networks/dio/dio.dart';
import '../../../../networks/endpoints.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class GetIssueDetailsApi {
  static final GetIssueDetailsApi _singleton = GetIssueDetailsApi._internal();
  GetIssueDetailsApi._internal();
  static GetIssueDetailsApi get instance => _singleton;
  Future<Map> fetchIssueDetailsData(int id) async {
    try {
      Response response = await getHttp(
        Endpoints.getTicketDetails(id),
      );
      if (response.statusCode == 200) {
        Map data = json.decode(json.encode(response.data));
        return data;
      } else {
        // Handle non-200 status code errors
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      throw ErrorHandler.handle(error).failure;
    }
  }
}
