import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/custom_drawer.dart';
import '../../../common_widgets/delete_dilouge_widget.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';
import '../../../networks/api_acess.dart';
import '../../../networks/endpoints.dart';
import '../../../networks/stream_cleaner.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 75.h,
            backgroundColor: AppColors.cffffff,
            elevation: 0,
            title: Text(
              'Message',
              style: TextFontStyle.headline20w600C141414StyleInter
                  .copyWith(color: AppColors.c000000),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: GestureDetector(
                  onTap: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  child: Image.asset(
                    Assets.icons.menuIcon.path,
                     width: 38.w,
                  ),
                ),
              )
            ],
          ),
          drawer: CustomDrawer(
            isTextColor: false,
            onTapNotification: () {
              NavigationService.navigateTo(Routes.proNotification);
              _scaffoldKey.currentState!.closeDrawer();
            },
            onTapPaymnetHistory: () =>
                NavigationService.navigateTo(Routes.proPaymnetHistory),
            onTapSecurity: () {
              NavigationService.navigateTo(Routes.securityScreen);
              _scaffoldKey.currentState!.closeDrawer();
            },
            onTapAboutus: () {
              NavigationService.navigateToWithArgs(Routes.webview,
                  {"name": "About US", "url": "$url/page/about-us"});
              _scaffoldKey.currentState!.closeDrawer();
            },
            onTapPrivacy: () {
              NavigationService.navigateToWithArgs(Routes.webview, {
                "name": "Privacy & Policy",
                "url": "$url/page/privacy-policy"
              });
              _scaffoldKey.currentState!.closeDrawer();
            },
            onTapHelpAndSuport: () {
              NavigationService.navigateTo(Routes.helpAndSupport);
              _scaffoldKey.currentState!.closeDrawer();
            },
            onTapLogout: () {
              deleteButtonDialouge(context, "You are about to Logout!", () {
                //  getDeleteTokenRXObj.deleteTokenData();
                getLogOutRXObj.fetchLogoutData();
                totalDataClean();
                NavigationService.navigateToReplacement(Routes.login);
              });
            },
          ),
          body: Center(
            child: Text(
              'Message Section is Upcomming.......',
              style: TextFontStyle.headline16w600C00000StyleInter,
            ),
          )),
    );
  }
}
