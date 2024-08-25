import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/helpers/loading_helper.dart';
import 'package:lsebert/helpers/navigation_service.dart';
import '../../../common_widgets/custom_drawer.dart';
import '../../../common_widgets/delete_dilouge_widget.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/all_routes.dart';
import '../../../networks/api_acess.dart';
import '../../../networks/endpoints.dart';
import '../../../networks/stream_cleaner.dart';
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
        child: StreamBuilder(
            stream: getTradeProfileRXObj.dataFetcher,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map? data = snapshot.data!['data'];
                return Scaffold(
                  extendBodyBehindAppBar: true,
                  key: _scaffoldKey,
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    bottomOpacity: 0,
                    toolbarHeight: 120.h,
                    elevation: 0,
                    backgroundColor: AppColors.allPrimaryColor,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello ${data?['user']['name'] ?? 'N/A'},",
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
                        if (userData.isEmpty) {
                          return Center(
                              child: Text(
                            "You Need to Purchase a Subscription \n Plan to See Pro Users Profile",
                            style:
                                TextFontStyle.headline16w500C141414StyleInter,
                            textAlign: TextAlign.center,
                          ));
                        } else {
                          return PageView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: userData.length,
                            itemBuilder: (context, index) {
                              Map user = userData[index];
                              log("User Data : $user");
                              return HomeWidget(
                                userName: userData[index]['name'] ?? '',
                                location: userData[index]?['user_detail']
                                        ?['location'] ??
                                    '',
                                skills: userData[index]?['user_detail']
                                        ?['industry'] ??
                                    '',
                                expart: userData[index]['profession'] ?? '',
                                imageLink: userData[index]?['user_detail']
                                    ?['profile_picture'],
                                onTapSendMessage: () {},
                                onTapViewProfile: () async {
                                  await getTradeDetailsDataRXObj
                                      .fetchTradeProfileDetailsData(
                                          userData[index]['id']);

                                  NavigationService.navigateTo(
                                    Routes.viewProfile,
                                  );
                                },
                              );
                            },
                          );
                        }
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                  drawer: CustomDrawer(
                    isTextColor: true,
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
                    // onTapHelpAndSuport: () {
                    //   NavigationService.navigateTo(Routes.helpAndSupport);
                    //   _scaffoldKey.currentState!.closeDrawer();
                    // },
                    onTapLogout: () {
                      deleteButtonDialouge(context, "You are about to Logout!",
                          () {
                        //  getDeleteTokenRXObj.deleteTokenData();
                        getLogOutRXObj.fetchLogoutData();
                        totalDataClean();
                        NavigationService.navigateToReplacement(Routes.login);
                      });
                    },
                  ),
                );
              } else {
                return const Text('No Data Available');
              }
            }));
  }
}
