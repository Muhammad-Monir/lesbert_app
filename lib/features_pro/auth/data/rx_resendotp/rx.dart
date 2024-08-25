import 'dart:developer';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';
import 'api.dart';

final class ResendOtpRx extends RxResponseInt {
  final api = ResendOtpApi.instance;

  ResendOtpRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;
  Future<bool> resendOtp({
    required String email,
  }) async {
    try {
      Map data = await api.resendOtp(email: email);
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

    if (data["success"] == false) {
      throw Exception();
    }
    return true;
  }
}
