// ignore_for_file: unused_field, deprecated_member_use

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/features_pro/pro_dashboard/presentation/pro_dashboard.dart';
import 'package:lsebert/features_pro/pro_message/presentation/pro_message_screen.dart';
import 'package:lsebert/features_pro/pro_profile/presentation/pro_profile_screen.dart';
import 'package:lsebert/features_pro/pro_subscription/presentation/pro_subscription_screen.dart';
import '/constants/text_font_style.dart';
import '/gen/assets.gen.dart';
import '../gen/colors.gen.dart';
import '../helpers/helper_methods.dart';

final class ProNavigationScreen extends StatefulWidget {
  final Widget? pageNum;
  const ProNavigationScreen({
    super.key,
    this.pageNum,
  });

  @override
  State<ProNavigationScreen> createState() => _ProNavigationScreenState();
}

class _ProNavigationScreenState extends State<ProNavigationScreen> {
  int _currentIndex = 0;

  int _colorIndex = 0;

  final bool _isFisrtBuild = true;
  bool _navigationOn = true;

  final List<StatefulWidget> _screens = [
    const ProDashboardScreen(),
    const ProSubscriptionScreen(),
    const ProMessageScreen(),
    const ProProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Object? args;
    StatefulWidget? screenPage;
    if (_isFisrtBuild) {
      args = ModalRoute.of(context)!.settings.arguments;
    }
    if (args != null) {
      _colorIndex = 5;
      screenPage = args as StatefulWidget;
      var newColorindex = -1;

      for (var element in _screens) {
        newColorindex++;
        if (element.toString() == screenPage.toString()) {
          _colorIndex = newColorindex;
          _currentIndex = newColorindex;
          break;
        }
      }
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        showMaterialDialog(context);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        onDrawerChanged: (isOpened) => setState(() {
          _navigationOn = !isOpened;
        }),
        body: Center(
            child: (screenPage != null)
                ? screenPage
                : _screens.elementAt(_currentIndex)),
        bottomNavigationBar: CustomNavigationBar(
          iconSize: 24.r,
          selectedColor: Colors.red,
          strokeColor: AppColors.allPrimaryColor,
          unSelectedColor: Colors.black,
          backgroundColor: AppColors.allPrimaryColor,
          items: [
            CustomNavigationBarItem(
              icon: Image.asset(
                Assets.icons.dashboardIcon.path,
                color: (_currentIndex == 0)
                    ? AppColors.cffffff
                    : AppColors.c9E9E9E,
              ),
              title: Text("${"Home"} ",
                  style: TextFontStyle.headline12w400C9E9E9EStyleInter.copyWith(
                    color: (_currentIndex == 0)
                        ? AppColors.cffffff
                        : AppColors.c9E9E9E,
                  )),
            ),
            CustomNavigationBarItem(
              icon: Image.asset(
                Assets.icons.subscriptionIcon.path,
                color: (_currentIndex == 1)
                    ? AppColors.cffffff
                    : AppColors.c9E9E9E,
              ),
              title: Text(
                "Subscription",
                style: TextFontStyle.headline12w400C9E9E9EStyleInter.copyWith(
                  color: (_currentIndex == 1)
                      ? AppColors.cffffff
                      : AppColors.c9E9E9E,
                ),
              ),
            ),
            CustomNavigationBarItem(
              icon: Image.asset(
                Assets.icons.messageIcon.path,
                color: (_currentIndex == 2)
                    ? AppColors.cffffff
                    : AppColors.c9E9E9E,
              ),
              title: Text(
                "Message",
                style: TextFontStyle.headline12w400C9E9E9EStyleInter.copyWith(
                  color: (_currentIndex == 2)
                      ? AppColors.cffffff
                      : AppColors.c9E9E9E,
                ),
              ),
            ),
            CustomNavigationBarItem(
              icon: Image.asset(
                Assets.icons.profileIcon.path,
                color: (_currentIndex == 3)
                    ? AppColors.cffffff
                    : AppColors.c9E9E9E,
              ),
              title: Text(
                "Profile",
                style: TextFontStyle.headline12w400C9E9E9EStyleInter.copyWith(
                  color: (_currentIndex == 3)
                      ? AppColors.cffffff
                      : AppColors.c9E9E9E,
                ),
              ),
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            // if (appData.read(kKeyIsLoggedIn) || index == 1 || index == 0) {
            //   if (index == 1) {
            //     context.read<SelectedSubCat>().selectedSubCatIDClear();
            //   }

            setState(() {
              _currentIndex = index;
            });
            // } else {
            //   ToastUtil.showLongToast("You need to log in first");
            // }
          },
        ),
      ),
    );
  }
}
