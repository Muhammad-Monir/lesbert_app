import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/common_widgets/auth_button.dart';
import 'package:lsebert/common_widgets/loading_indicators.dart';
import 'package:lsebert/features_pro/auth/presentatiom/forgot_password/forgot_pass_screen.dart';
import 'package:lsebert/helpers/loading_helper.dart';
import 'package:lsebert/helpers/navigation_service.dart';
import 'package:lsebert/helpers/ui_helpers.dart';
import 'package:lsebert/networks/endpoints.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/all_routes.dart';
import '../../../networks/api_acess.dart';
import 'widgets/home_widget.dart';

class ProDashboardScreen extends StatefulWidget {
  const ProDashboardScreen({super.key});

  @override
  State<ProDashboardScreen> createState() => _ProDashboardScreenState();
}

class _ProDashboardScreenState extends State<ProDashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    getTradeDashboardRXObj.fetchTradeDashboard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      appBar: AppBar(
        bottomOpacity: 0,
        toolbarHeight: 120.h,
        elevation: 0,
        //shadowColor: const Color.fromARGB(255, 113, 7, 32),
        backgroundColor: AppColors.allPrimaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              " userDetail!['name']",
              style: TextFontStyle.headline20w400C141414StyleInter
                  .copyWith(color: AppColors.cffffff),
            ),
            Text(
              'Start swapping to find your match.',
              style: TextFontStyle.headline12w400C9E9E9EStyleInter
                  .copyWith(color: AppColors.cffffff),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: GestureDetector(
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              child: Image.asset(
                Assets.icons.whiteMenuIcon.path,
                width: 48.w,
              ),
            ),
          )
        ],
      ),
      body: StreamBuilder(
          stream: getTradeDashboardRXObj.dataFetcher,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Map? data = snapshot.data?['data'];
              List userData = data?['users'];
              return PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: userData.length,
                itemBuilder: (context, index) {
                  Map user = userData[index];
                  log("User Data : $user");
                  return HomeWidget(
                    userName: userData[index]['name'] ?? '',
                    location:
                        userData[index]?['user_detail']?['location'] ?? '',
                    skills: userData[index]?['user_detail']?['industry'] ?? '',
                    expart: userData[index]['profession'] ?? '',
                    imageLink: userData[index]?['user_detail']
                        ?['profile_picture'],
                    onTapSendMessage: () {},
                    onTapViewProfile: () async {
                      await getTradeDetailsDataRXObj
                          .fetchTradeProfileDetailsData(userData[index]['id'])
                          .waitingForFuture();
                      NavigationService.navigateTo(
                        Routes.viewProfile,
                      );
                    },
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    ));
  }
}
