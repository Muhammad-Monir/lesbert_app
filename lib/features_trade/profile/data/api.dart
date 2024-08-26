import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class GetTradeProfile {
  static final GetTradeProfile _singleton = GetTradeProfile._internal();
  GetTradeProfile._internal();
  static GetTradeProfile get instance => _singleton;
  Future<Map> getTradeProfile() async {
    try {
      Response response = await getHttp(Endpoints.tradeProfile());
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
