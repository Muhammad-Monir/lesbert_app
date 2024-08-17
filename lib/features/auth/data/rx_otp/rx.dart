import 'dart:developer';

import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';

import 'api.dart';

final class VerifyOtpRX extends RxResponseInt {
  final api = VerifyOtpApi.instance;

  VerifyOtpRX({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;
  String message = "Otp verification not successful.".tr;
  Future<bool> verifyOtp({
    required String code,
    required String email,
  }) async {
    try {
      Map data = await api.verifyOtp(code: code, email: email);
      return handleSuccessWithReturn(data);
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleErrorWithReturn(error) {
    log(error.toString());
    dataFetcher.sink.addError(error);
    return false;
  }

  @override
  handleSuccessWithReturn(data) {
    dataFetcher.sink.add(data);
    message = data["message"];

    if (data["success"] == false) {
      throw Exception();
    }
    return true;
  }
}
