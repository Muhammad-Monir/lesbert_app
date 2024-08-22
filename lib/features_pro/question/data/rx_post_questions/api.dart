import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

import '../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';

import '/networks/endpoints.dart';

final class PostQuestionApi {
  static final PostQuestionApi _singleton = PostQuestionApi._internal();
  PostQuestionApi._internal();
  static PostQuestionApi get instance => _singleton;
  Future<Map> postQuestionData(List<Map<int, dynamic>> ansquers) async {
    Map<String, List<dynamic>> groupedItems = {};
    FormData formData = FormData.fromMap({});
    try {
      for (var map in ansquers) {
        map.forEach((key, value) {
          String type = value is PlatformFile
              ? 'PlatformFile'
              : value.runtimeType.toString();

          if (!groupedItems.containsKey(type)) {
            groupedItems[type] = [];
          }

          groupedItems[type]!.add({'key': key, 'value': value});
        });
      }

      // Print grouped items by type
      groupedItems.forEach((type, items) async {
        log(type);
        if (type == "String") {
          print('Type: $type');
          for (var item in items) {
            formData.fields.add(
                MapEntry(item['key'].toString(), item['value'].toString()));
            print('  Key: ${item['key']}, Value: ${item['value']}');
          }
        } else if (type == "List<Map<int, String>>") {
          print('Type: $type');
          for (var item in items) {
            String key = "${item['key']}" + "[]";
            List<Map<int, String>> maps = item['value'];
            for (Map element in maps) {
              log(element.values.first);
              formData.fields
                  .add(MapEntry(key, element.values.first.toString()));
              log(element.toString());
            }
            print('  Key: ${item['key']}, Value: ${item['value']}');
          }
        } else if (type == "PlatformFile") {
          print('Type: $type');

          for (var item in items) {
            PlatformFile file = item['value'] as PlatformFile;
            log(file.path.toString());

            formData.files.add(
              MapEntry(
                item['key'].toString(),
                await MultipartFile.fromFile(file.path!),
              ),
            );
            print('  Key: ${item['key']}, Value: ${item['value']}');
          }
        } else if (type == "_Map<dynamic, dynamic>") {
          print('Type: $type');
          for (var item in items) {
            print('  Key: ${item['key']}, Value: ${item['value']}');
            Map d = item['value'];
            log(d.toString());
            log(d.values.first);
            formData.fields.add(
                MapEntry(item['key'].toString(), d.values.first.toString()));
          }
        }
      });

      log("This is from form data" + formData.toString());

      Response response = await postHttp(Endpoints.answers(), formData);
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
