import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lsebert/constants/app_constants.dart';
import 'package:lsebert/helpers/di.dart';

import '../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class GetSubscriptionPackagesApi {
  static final GetSubscriptionPackagesApi _singleton =
      GetSubscriptionPackagesApi._internal();
  GetSubscriptionPackagesApi._internal();
  static GetSubscriptionPackagesApi get instance => _singleton;
  Future<Map> fetchSubscriptionPackages() async {
    try {
      String path = appData.read(kKeyUserType) == "trade"
          ? Endpoints.tradeSubscriptioPackages()
          : Endpoints.proSubscriptioPackages();
      Response response = await getHttp(path);
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
