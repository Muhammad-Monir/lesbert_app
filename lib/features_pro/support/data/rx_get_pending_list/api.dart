import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../networks/dio/dio.dart';
import '../../../../networks/endpoints.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class GetPendingListApi {
  static final GetPendingListApi _singleton = GetPendingListApi._internal();
  GetPendingListApi._internal();
  static GetPendingListApi get instance => _singleton;
  Future<Map> fetchPendingListData() async {
    try {
      Response response = await getHttp(
        Endpoints.getPendingTicketList(),
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
