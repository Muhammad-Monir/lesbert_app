import 'package:flutter/material.dart';
import 'package:lsebert/features/intro/splash_screen.dart';
import 'constants/app_constants.dart';
import 'features/auth/presentatiom/login/login_screen.dart';
import 'helpers/app_version_updater.dart';
import 'helpers/di.dart';
import 'helpers/helper_methods.dart';
import 'navigation_screen.dart';
import 'networks/dio/dio.dart';
import 'welcome_screen.dart';

final class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _isLoading = false;

  @override
  void initState() {
    loadInitialData();
    super.initState();
  }

  loadInitialData() async {
    AutoAppUpdateUtil.instance.checkAppUpdate();
    await setInitValue();
    // await getAllShopCategoryRXObj.fetchAllShopCategoryData();
    // await getAllShopRXObj.fetchAllShopData();
    // await getSliderRXObj.fetchSliderData();
    // await getAllSubCategoryRXObj.fetchGetAllSubCategoryData();

    if (appData.read(kKeyIsLoggedIn)) {
      String token = appData.read(kKeyAccessToken);
      DioSingleton.instance.update(token);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const WelcomeScreen();
    } else {
      return appData.read(kKeyIsLoggedIn)
          ? const NavigationScreen()
          : const LoginScreen();
    }
  }
}
