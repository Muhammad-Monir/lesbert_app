import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class GetProProfileDataApi {
  static final GetProProfileDataApi _singleton =
      GetProProfileDataApi._internal();
  GetProProfileDataApi._internal();
  static GetProProfileDataApi get instance => _singleton;
  Future<Map> getProProfile(int id) async {
    try {
      Response response = await getHttp(Endpoints.proProfileData(id));
      if (response.statusCode == 200) {
        Map data = json.decode(json.encode(response.data));
        return data;
      } else if (response.statusCode == 202) {
        // when view subscirption are completer then this is show a popup
        throw DataSource.DEFAULT.getFailure();
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      throw ErrorHandler.handle(error).failure;
    }
  }
}
