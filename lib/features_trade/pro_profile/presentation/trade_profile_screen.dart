import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/common_widgets/custom_drawer.dart';
import 'package:lsebert/helpers/ui_helpers.dart';
import 'package:lsebert/networks/endpoints.dart';
import '../../../common_widgets/personal_details_widget.dart';
import '../../../common_widgets/user_name_image_widget.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';
import '../../../networks/api_acess.dart';

class TradeProfileScreen extends StatefulWidget {
  const TradeProfileScreen({super.key});

  @override
  State<TradeProfileScreen> createState() => _TradeProfileScreenState();
}

class _TradeProfileScreenState extends State<TradeProfileScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    getTradeProfileRXObj.fetchTradeProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 75.h,
          backgroundColor: AppColors.allPrimaryColor,
          elevation: 0,
          title: Text(
            'Pro Profile',
            style: TextFontStyle.headline20w600C141414StyleInter
                .copyWith(color: AppColors.cffffff),
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
                  width: 40.w,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: StreamBuilder(
              stream: getTradeProfileRXObj.dataFetcher,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Map? data = snapshot.data!['data'];
                  Map? userDetail = data!['user']['user_detail'];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UIHelper.verticalSpace(20.h),
                      UserImageAndNameWidget(
                        userImage: data['user']['avatar'] != null
                            ? '$imageUrl${data['user']['avatar']}'
                            : Assets.images.userImage.path,
                        userName: data['user']['name'] ?? 'N/A',
                        userSubtitle: data['user']['profession'] ?? 'N/A',
                        onTapProfileEdit: () =>
                            NavigationService.navigateToWithArgs(
                                Routes.proEditProfile, {
                          'name': data['user']['name'] ?? 'N/A',
                          'about': userDetail?['bio'] ?? 'N/A',
                          'address': userDetail?['address'] ?? 'N/A',
                          'email': data['user']['email'],
                          'image': '$imageUrl${userDetail?['profile_picture']}',
                          'phone': userDetail?['phone_number'] ?? 'N/A',
                        }),
                      ),
                      PersonalDetailsWidget(
                        isEdit: false,
                        onTap: () {
                          NavigationService.navigateTo(
                              Routes.personalDetailsEdit);
                        },
                        name: data['user']['name'] ?? 'N/A',
                        phoneNum: userDetail?['phone_number'] ?? 'N/A',
                        email: data['user']['email'],
                        // gender: 'Male',
                        address: userDetail?['address'] ?? 'N/A',
                      ),
                      UIHelper.verticalSpace(20.h),
                      Padding(
                        padding: EdgeInsets.all(25.sp),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your Bio',
                              style:
                                  TextFontStyle.headline16w600C00000StyleInter,
                            ),
                            UIHelper.verticalSpace(20.h),
                            Text(
                              userDetail?['bio'] ?? 'N/A',
                              style: TextFontStyle
                                  .headline12w400C9E9E9EStyleInter
                                  .copyWith(color: AppColors.c5A5C5F),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                } else {
                  return const Text('No Data Available');
                }
              }),
        ),
        drawer: CustomDrawer(
          isTextColor: true,
          onTapNotification: () {
            NavigationService.navigateTo(Routes.proNotification);
          },
          onTapPaymnetHistory: () =>
              NavigationService.navigateTo(Routes.proPaymnetHistory),
          onTapSecurity: () =>
              NavigationService.navigateTo(Routes.securityScreen),
        ),
      ),
    );
  }
}
