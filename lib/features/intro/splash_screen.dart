import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/helpers/navigation_service.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../helpers/all_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      NavigationService.navigateToReplacement(Routes.onboarding);
      // if(AuthService.currentUser != null){
      //   Navigator.pushReplacementNamed(context, ProductListPage.routeName);
      // }else{
      //   Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      // }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.allPrimaryColor,
        child: Center(
          child: Image.asset(
            Assets.icons.logo.path,
            height: 169.h,
            width: 243.w,
          ),
        ),
      ),
    );
  }
}
