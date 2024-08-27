import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class GetPaymentHistoryApi {
  static final GetPaymentHistoryApi _singleton =
      GetPaymentHistoryApi._internal();
  GetPaymentHistoryApi._internal();
  static GetPaymentHistoryApi get instance => _singleton;
  Future<Map> fetchPaymentHistory() async {
    try {
      Response response = await getHttp(Endpoints.paymentHistory());
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
