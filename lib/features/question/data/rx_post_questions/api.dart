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

    // for (Map<int, dynamic> map in ansquers) {
    //   log(map.toString() + "/");
    // }
    // try {
    //   Response response = await getHttp(Endpoints.questions());
    //   if (response.statusCode == 200) {
    //     Map data = json.decode(json.encode(response.data));
    //     return data;
    //   } else {
    //     // Handle non-200 status code errors
    //     throw DataSource.DEFAULT.getFailure();
    //   }
    // } catch (error) {
    //   // Handle generic errors
    //   throw ErrorHandler.handle(error).failure;
    // }

    try {
      FormData formData = FormData.fromMap({});
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
        } else if (type == "Map<int, String>") {
          print('Type: $type');
          for (var item in items) {
            print('  Key: ${item['key']}, Value: ${item['value']}');
          }
        }
        // print('Type: $type');
        // for (var item in items) {
        //   print('  Key: ${item['key']}, Value: ${item['value']}');
        // }
      });
      //       "subject": subject,
      // "message": message,

      log("This is from form data" + formData.toString());
      //  log("This is from form data" + formData.files.toString());
      //formData.fields.add(value)
      // if (document != null && document.isNotEmpty) {
      //   formData.files.add(
      //     MapEntry(
      //       "attachment",
      //       await MultipartFile.fromFile(document.last.path),
      //     ),
      //   );
      // }
    } catch (e) {}

    return {
      "success": true,
      "message": "Answers stored successfully",
      "data": [],
      "code": 200
    };
  }
}
