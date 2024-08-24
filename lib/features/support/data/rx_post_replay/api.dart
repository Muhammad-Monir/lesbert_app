import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../networks/dio/dio.dart';
import '../../../../networks/endpoints.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class PostReplayApi {
  static final PostReplayApi _singleton = PostReplayApi._internal();
  PostReplayApi._internal();
  static PostReplayApi get instance => _singleton;
  Future<Map> postReplay(Map data) async {
    try {
      Response response = await postHttp(
        Endpoints.postTicketReplay(),
        data,
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
