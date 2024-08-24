import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../networks/dio/dio.dart';
import '../../../../networks/endpoints.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class PostIssuesApi {
  static final PostIssuesApi _singleton = PostIssuesApi._internal();
  PostIssuesApi._internal();
  static PostIssuesApi get instance => _singleton;
  Future<Map> postIssue(Map data) async {
    try {
      Response response = await postHttp(
        Endpoints.postIssues(),
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
