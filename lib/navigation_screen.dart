// ignore_for_file: unused_field, deprecated_member_use

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/features_pro/dashboard/presentation/dashboard_screen.dart';
import 'package:lsebert/features/message/presentation/message_screen.dart';
import 'package:lsebert/features_pro/profile/presentation/profile_screen.dart';
import 'package:lsebert/features/subscription/presentation/subscription_screen.dart';
import '/constants/text_font_style.dart';
import '/gen/assets.gen.dart';
import 'gen/colors.gen.dart';
import 'helpers/helper_methods.dart';

final class NavigationScreen extends StatefulWidget {
  final Widget? pageNum;
  const NavigationScreen({
    super.key,
    this.pageNum,
  });

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;

  int _colorIndex = 0;

  final bool _isFisrtBuild = true;
  bool _navigationOn = true;

  final List<StatefulWidget> _screens = [
    const DashboardScreen(),
    const SubscriptionScreen(),
    const MessageScreen(),
    const ProfileScreen(),
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
          backgroundColor: Colors.white,
          items: [
            CustomNavigationBarItem(
              icon: Image.asset(
                Assets.icons.dashboardIcon.path,
                color: (_currentIndex == 0)
                    ? AppColors.allPrimaryColor
                    : AppColors.c9E9E9E,
              ),
              title: Text("${"Home"} ",
                  style: TextFontStyle.headline12w400C9E9E9EStyleInter.copyWith(
                    color: (_currentIndex == 0)
                        ? AppColors.allPrimaryColor
                        : AppColors.c9E9E9E,
                  )),
            ),
            CustomNavigationBarItem(
              icon: Image.asset(
                Assets.icons.subscriptionIcon.path,
                color: (_currentIndex == 1)
                    ? AppColors.allPrimaryColor
                    : AppColors.c9E9E9E,
              ),
              title: Text(
                "Subscription",
                style: TextFontStyle.headline12w400C9E9E9EStyleInter.copyWith(
                  color: (_currentIndex == 1)
                      ? AppColors.allPrimaryColor
                      : AppColors.c9E9E9E,
                ),
              ),
            ),
            CustomNavigationBarItem(
              icon: Image.asset(
                Assets.icons.messageIcon.path,
                color: (_currentIndex == 2)
                    ? AppColors.allPrimaryColor
                    : AppColors.c9E9E9E,
              ),
              title: Text(
                "Message",
                style: TextFontStyle.headline12w400C9E9E9EStyleInter.copyWith(
                  color: (_currentIndex == 2)
                      ? AppColors.allPrimaryColor
                      : AppColors.c9E9E9E,
                ),
              ),
            ),
            CustomNavigationBarItem(
              icon: Image.asset(
                Assets.icons.profileIcon.path,
                color: (_currentIndex == 3)
                    ? AppColors.allPrimaryColor
                    : AppColors.c9E9E9E,
              ),
              title: Text(
                "Profile",
                style: TextFontStyle.headline12w400C9E9E9EStyleInter.copyWith(
                  color: (_currentIndex == 3)
                      ? AppColors.allPrimaryColor
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
