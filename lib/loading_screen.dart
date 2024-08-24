import 'package:flutter/material.dart';
import 'package:lsebert/features_pro/intro/splash_screen.dart';
import 'package:lsebert/features_pro/question/presentation/question_screen.dart';
import 'constants/app_constants.dart';
import 'features_pro/auth/presentatiom/login/login_screen.dart';
import 'features_trade/pro_navigation_screen.dart';
import 'helpers/app_version_updater.dart';
import 'helpers/di.dart';
import 'helpers/helper_methods.dart';
import 'navigation_screen.dart';
import 'networks/api_acess.dart';
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
    //AutoAppUpdateUtil.instance.checkAppUpdate();
    await setInitValue();
    // await getAllShopCategoryRXObj.fetchAllShopCategoryData();
    // await getAllShopRXObj.fetchAllShopData();
    // await getSliderRXObj.fetchSliderData();
    // await getAllSubCategoryRXObj.fetchGetAllSubCategoryData();

    if (appData.read(kKeyIsLoggedIn)) {
      String token = appData.read(kKeyAccessToken);
      DioSingleton.instance.update(token);
      // await getQuestionRx.fetchQuestionData();
      // await getProProfileRxObj.fetchProfileData();
      //await getExperianceRXObj.fetchExperianceData();
      await getTradeProfileRXObj.fetchTradeProfileData();
      await getTradeDashboardRXObj.fetchTradeDashboard();
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
          ? const TardeNavigationScreen()
          : const LoginScreen();
    }
  }
}
