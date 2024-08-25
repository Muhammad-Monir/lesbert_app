import 'package:flutter/material.dart';
import 'package:lsebert/navigation_screen.dart';
import 'constants/app_constants.dart';
import 'features/question/presentation/question_screen.dart';
import 'features_pro/auth/presentatiom/login/login_screen.dart';
import 'features_trade/pro_navigation_screen.dart';
import 'helpers/di.dart';
import 'helpers/helper_methods.dart';
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
    await setInitValue();
    if (appData.read(kKeyIsLoggedIn)) {
      String token = appData.read(kKeyAccessToken);
      DioSingleton.instance.update(token);
      await getQuestionRx.fetchQuestionData();
      if (appData.read(kKeyUserType) == "trade") {
        await getTradeProfileRXObj.fetchTradeProfileData();
        await getTradeDashboardRXObj.fetchTradeDashboard();
      } else {
        await getQuestionRx.fetchQuestionData();
        await getProProfileRxObj.fetchProfileData();
        await getExperianceRXObj.fetchExperianceData();
      }
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
          ? appData.read(kKeyisanswered) == false
              ? const QuestionScreen()
              : appData.read(kKeyUserType) == "trade"
                  ? const TardeNavigationScreen()
                  : const NavigationScreen()
          : const LoginScreen();
    }
  }
}
