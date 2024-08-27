// ignore_for_file: camel_case_types

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:lsebert/common_widgets/auth_button.dart';
import 'package:lsebert/common_widgets/custom_drawer.dart';
import 'package:lsebert/common_widgets/loading_indicators.dart';
import 'package:lsebert/constants/text_font_style.dart';
import 'package:lsebert/gen/assets.gen.dart';
import 'package:lsebert/gen/colors.gen.dart';
import 'package:lsebert/helpers/ui_helpers.dart';
import '../../../common_widgets/delete_dilouge_widget.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/toast.dart';
import '../../../networks/api_acess.dart';
import '../../../networks/endpoints.dart';
import '../../../networks/stream_cleaner.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;

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
            'Subscription',
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "All-Access Pass",
                  style: TextFontStyle.headline24w700C000000StyleInter,
                ),
                UIHelper.verticalSpaceMedium,
                const Text(
                  "Boost your productivity with instant access to all 9,183 existing products and daily new releases.",
                  textAlign: TextAlign.center,
                ),
                UIHelper.verticalSpace(22.h),
                StreamBuilder(
                    stream: getSubscriptionPackagesRxObj.dataFetcher,
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        Map? data = snapshot.data?["data"];
                        List? packages = data?["subscriptions"];
                        if (packages != null && packages.isNotEmpty) {
                          return SizedBox(
                            height: .55.sh,
                            child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) =>
                                  UIHelper.horizontalSpaceMedium,
                              itemCount: packages.length,
                              itemBuilder: (context, index) {
                                return SubscriptionPlan(
                                  packageName: packages[index]["package_type"],
                                  amount: packages[index]["price"],
                                  duration: packages[index]["timeline"],
                                  messageLimit: packages[index]
                                      ["message_limit"],
                                  viewLimit: packages[index]["view_limit"],
                                  features: packages[index]["feature"],
                                  onSelect: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  borderColor: selectedIndex == index
                                      ? AppColors.allPrimaryColor
                                      : Colors
                                          .transparent, // Change border color based on selection
                                );
                              },
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      } else if (snapshot.hasError) {
                        return const SizedBox.shrink();
                      } else {
                        return loadingIndicatorCircle(context: context);
                      }
                      return loadingIndicatorCircle(context: context);
                    }),
                UIHelper.verticalSpaceMedium,
                //this will be optional based on if subscription purchased
                Container(
                  height: 280.h,
                  width: .9.sw,
                  decoration: BoxDecoration(
                      color: AppColors.cffffff,
                      borderRadius: BorderRadius.all(Radius.circular(15.r))),
                  child: Column(
                    children: [
                      UIHelper.verticalSpaceMedium,
                      CircleAvatar(
                        radius: 45.r,
                        child: ClipOval(
                          child: Image.network(
                            "https://images.unsplash.com/photo-1494790108377-be9c29b29330?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
                            fit: BoxFit.cover,
                            width: 100.w,
                            height: 100.h,
                          ),
                        ),
                      ),
                      UIHelper.verticalSpaceMedium,
                      const Text("MIA HULULU"),
                      UIHelper.verticalSpaceMedium,
                      const Text("Subscribed To - Basic Plan"),
                      UIHelper.verticalSpaceMedium,
                      AuthCustomeButton(
                          name: "Change Suscription Plan",
                          onCallBack: () {},
                          height: .05.sh,
                          minWidth: .4.sw,
                          borderRadius: 20.r,
                          color: AppColors.allPrimaryColor,
                          textStyle: TextFontStyle
                              .headline12w400C9E9E9EStyleInter
                              .copyWith(color: AppColors.cffffff),
                          context: context),
                    ],
                  ),
                ),
                UIHelper.verticalSpaceMedium,
                Container(
                  height: 240.h,
                  width: .9.sw,
                  decoration: BoxDecoration(
                      color: AppColors.cffffff,
                      borderRadius: BorderRadius.all(Radius.circular(15.r))),
                  child: Column(
                    children: [
                      UIHelper.verticalSpaceMedium,
                      Padding(
                        padding: EdgeInsets.all(8.sp),
                        child: Image.asset(
                          Assets.icons.flameIcon.path,
                          height: 71.sp,
                          width: 70.sp,
                        ),
                      ),
                      UIHelper.verticalSpaceMedium,
                      const Text("Get Boost"),
                      UIHelper.verticalSpaceMedium,
                      AuthCustomeButton(
                          name: "Get More",
                          onCallBack: () {
                            _showAlertDialog(context);
                          },
                          height: .05.sh,
                          minWidth: .4.sw,
                          borderRadius: 20.r,
                          color: AppColors.allPrimaryColor,
                          textStyle: TextFontStyle
                              .headline12w400C9E9E9EStyleInter
                              .copyWith(color: AppColors.cffffff),
                          context: context),
                    ],
                  ),
                ),
                UIHelper.verticalSpaceExtraLarge,
              ],
            ),
          ),
        ),
        drawer: CustomDrawer(
          isTextColor: false,
          onTapNotification: () {
            NavigationService.navigateTo(Routes.proNotification);
            _scaffoldKey.currentState!.closeDrawer();
          },
          onTapPaymnetHistory: () =>
              NavigationService.navigateTo(Routes.paymentHistory),
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
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
          icon: Row(
            children: [
              const Spacer(),
              GestureDetector(
                onTap: () => NavigationService.goBack,
                child: Icon(
                  Icons.close,
                  size: 28.sp,
                ),
              )
            ],
          ),
          title: Text(
            'My Boosts',
            style: TextFontStyle.headline24w700C000000StyleInter,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                textAlign: TextAlign.center,
                'Be a top profile your area for 30 minutes to get more matches',
                style: TextFontStyle.headline14w400C848484StyleInter
                    .copyWith(color: AppColors.c000000),
              ),
              UIHelper.verticalSpace(20.h),
              Padding(
                padding: EdgeInsets.only(left: 25.w),
                child: Row(
                  children: [
                    Image.asset(
                      Assets.icons.boostIcon.path,
                      width: 48.w,
                    ),
                    UIHelper.horizontalSpace(8.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My Boosts',
                          style: TextFontStyle.headline24w700C000000StyleInter,
                        ),
                        UIHelper.verticalSpace(8.h),
                        Text(
                          textAlign: TextAlign.center,
                          '\$2.0',
                          style: TextFontStyle.headline14w400C848484StyleInter,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              UIHelper.verticalSpace(43.h),
              AuthCustomeButton(
                  name: 'Get More Boosts',
                  onCallBack: () {},
                  height: 48.h,
                  minWidth: 228.w,
                  borderRadius: 24.r,
                  color: AppColors.allPrimaryColor,
                  textStyle: TextFontStyle.headline16w600CFFFFFFFFStyleintere,
                  context: context)
            ],
          ),
        );
      },
    );
  }
}

class SubscriptionPlan extends StatelessWidget {
  final Color borderColor;
  final VoidCallback? onSelect;
  final String packageName;
  final String amount;
  final String duration;
  final String viewLimit;
  final String messageLimit;
  final String features;

  const SubscriptionPlan({
    required this.borderColor,
    this.onSelect,
    super.key,
    required this.packageName,
    required this.amount,
    required this.duration,
    required this.viewLimit,
    required this.messageLimit,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
        // width: .7.sw,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 3.w),
          borderRadius: BorderRadius.circular(15.r),
          color: AppColors.cffffff,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelper.verticalSpaceMedium,
            Row(
              children: [
                Text(
                  packageName,
                  style: TextFontStyle.headline16w700CffffffStyleInter
                      .copyWith(color: AppColors.c2C2126),
                ),
                UIHelper.horizontalSpace(8.w),
              ],
            ),
            UIHelper.verticalSpaceSmall,
            RichText(
              text: TextSpan(
                text: '\$$amount',
                style: TextFontStyle.headline48w600CFFFFFFFFStylePoppins
                    .copyWith(color: AppColors.c2C2126),
                children: [
                  TextSpan(
                    text: '/$duration',
                    style: TextFontStyle.headline14w400C848484StyleInter,
                  ),
                ],
              ),
            ),
            UIHelper.verticalSpace(14.h),
            Container(
              height: 50.h,
              width: .5.sw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.cECF5FE,
              ),
              child: Center(
                  child: Text(
                "Pay $duration",
                style: TextFontStyle.headline16w600C000000tyleiPoppins
                    .copyWith(color: AppColors.allPrimaryColor),
              )),
            ),
            UIHelper.verticalSpaceSmall,
            subscriptionFeatures(
              feature: "View Limit : ",
              value: viewLimit,
            ),
            subscriptionFeatures(
              feature: "Message Limit : ",
              value: messageLimit,
            ),
            UIHelper.verticalSpaceSmall,
            HtmlWidget(
              features,
              textStyle: TextFontStyle.headline14w400C000000StyleInter
                  .copyWith(color: AppColors.c000000),
              renderMode: RenderMode.column,
            ),
            const Spacer(),
            Center(
              child: AuthCustomeButton(
                  name: "Get Boost",
                  onCallBack: () {
                    ToastUtil.showLongToast('Feature is Upcomming....');
                  },
                  height: .05.sh,
                  minWidth: .6.sw,
                  borderRadius: 20.r,
                  color: AppColors.allPrimaryColor,
                  textStyle: TextFontStyle.headline12w400C9E9E9EStyleInter
                      .copyWith(color: AppColors.cffffff),
                  context: context),
            ),
            UIHelper.verticalSpace(10.h)
          ],
        ),
      ),
    );
  }
}

class subscriptionFeatures extends StatelessWidget {
  final String feature;
  final String? value;
  const subscriptionFeatures({
    super.key,
    required this.feature,
    this.value = "",
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
      child: Row(
        children: [
          Text(
            "$feature : ",
            style: TextFontStyle.headline14w400C000000StyleInter
                .copyWith(color: AppColors.c000000),
          ),
          Text(
            "$value",
            style: TextFontStyle.headline12w400C9E9E9EStyleInter.copyWith(
              color: AppColors.c000000,
            ),
          ),
        ],
      ),
    );
  }
}
