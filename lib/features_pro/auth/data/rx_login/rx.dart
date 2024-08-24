import 'package:flutter/material.dart';
import 'package:lsebert/helpers/loading_helper.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../helpers/all_routes.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../helpers/toast.dart';
import '../../model/login_response.dart';

import '/helpers/di.dart';
import '../../../../networks/rx_base.dart';

import '../../../../constants/app_constants.dart';

import 'api.dart';

final class GetLoginRX extends RxResponseInt<LoginResponse> {
  final api = LoginApi.instance;

  bool success = false;

  GetLoginRX({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<void> login(
    String email,
    String password,
  ) async {
    try {
      LoginResponse data = await api
          .login(
            email,
            password,
          )
          .waitingForFuture();
      return handleSuccessWithReturn(data);
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(LoginResponse data) async {
    try {
      LoginResponse loginResponse = data;

      if (loginResponse.success == true) {
        String accesstoken = loginResponse.data!.token!.original!.accessToken!;
        String userType = loginResponse.data!.role!;
        await appData.write(kKeyIsLoggedIn, true);
        await appData.write(kKeyAccessToken, accesstoken);
        await appData.write(kKeyUserType, userType);
        dataFetcher.sink.add(loginResponse);
        ToastUtil.showLongToast(loginResponse.message!);
        NavigationService.navigateToReplacement(Routes.loading);
      } else {
        await appData.write(kKeyIsLoggedIn, false);
        ToastUtil.showLongToast(loginResponse.message!);
      }
    } catch (e) {
      rethrow;
    }
  }
}
