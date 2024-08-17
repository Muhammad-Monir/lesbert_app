import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/helpers/navigation_service.dart';
import 'package:lsebert/helpers/ui_helpers.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/all_routes.dart';
import 'widgets/bio_widegt.dart';
import 'widgets/divider_container.dart';
import 'widgets/experiance_data_widget.dart';
import 'widgets/other_details_widget.dart';
import 'widgets/personal_details_widget.dart';
import 'widgets/user_name_image_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isSettingOpen = false;

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
            'Profile Screen',
            style: TextFontStyle.headline20w600C141414StyleInter,
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
                  width: 48.w,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const DividerContainer(),
              UserImageAndNameWidget(
                userImage: Assets.images.userImage.path,
                userName: 'Andrew Hussy',
                userSubtitle: 'Professional',
              ),
              const DividerContainer(),
              PersonalDetailsWidget(
                onTap: () {
                  NavigationService.navigateTo(Routes.personalDetailsEdit);
                },
                name: 'Nasib Hasan',
                phoneNum: '+01234567890',
                email: 'youremail@email.com',
                gender: 'Male',
                address: 'H#28, R#03, Block#H, City Name, Area, Area Code',
              ),
              const DividerContainer(),
              const BioWidget(
                bioDescription:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt malesuada ornare. Proin sollicitudin eros mauris, non viverra ante fermentum sed. Aliquam efficitur, augue at condimentum elementum, turpis nisi tincidunt mi, ut finibus mi nibh nec mi. In auctor libero turpis, et placerat velit eleifend eget. Suspendisse congue hendrerit lacus id sodales. Morbi non nunc ipsum. ',
                lstQualification: 'BSC in Computer Science',
                title: 'Abc Category',
                industry: 'IT/ Software',
                prepredLocation: 'USA',
                endDate: 'Currently Working Here',
              ),
              const DividerContainer(),
              const OtherDetailsWidget(
                skill: 'Programming, Coding, Playing, Programming, Coding',
                language: 'Bangla, English, Hindi',
              ),
              const DividerContainer(),
              const ExperiencesDataWidget(
                crntCompanyName: 'Xbox',
                designation: 'Abc Category',
                employeeType: 'Abc Category',
                endDate: 'Currently Working Here',
                jobLocation: 'H#28, R#03, Block#H, City Name, Area, Area Code',
                startDate: '20/10/2024',
              ),
              DividerContainer(
                height: 40.h,
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Image.asset(
                Assets.icons.logo.path,
                width: 133.w,
                height: 92.h,
              ),
              UIHelper.verticalSpace(40.w),
              DrawerItemWidget(
                widget: CircleAvatar(
                  radius: 12.r,
                  backgroundColor: AppColors.cFF5630,
                  child: Text(
                    '22',
                    style: TextFontStyle.headline12w400C9E9E9EStyleInter
                        .copyWith(color: AppColors.cffffff),
                  ),
                ),
                isCircleAvatar: true,
                itemName: 'Notifications',
              ),
              UIHelper.verticalSpace(25.w),
              const DrawerItemWidget(
                widget: SizedBox.shrink(),
                itemName: 'About Us',
              ),
              UIHelper.verticalSpace(25.w),
              DrawerItemWidget(
                isCircleAvatar: true,
                widget: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSettingOpen = !_isSettingOpen;
                    });
                  },
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // The arrow icon that toggles up/down
                      Icon(
                        _isSettingOpen
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: AppColors.allPrimaryColor,
                      ),
                      // Positioned Column with additional items
                      if (_isSettingOpen)
                        Positioned(
                          bottom: -55.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Security',
                                style: TextFontStyle
                                    .headline16w400C848484StyleInter
                                    .copyWith(
                                  color: AppColors.c141414,
                                ),
                              ),
                              UIHelper.verticalSpace(10.h),
                              Text(
                                'Payment History',
                                style: TextFontStyle
                                    .headline16w400C848484StyleInter
                                    .copyWith(
                                  color: AppColors.c141414,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                itemName: 'Settings',
              ),
              UIHelper.verticalSpace(_isSettingOpen == true ? 70.w : 25.w),
              const DrawerItemWidget(
                widget: SizedBox.shrink(),
                itemName: 'Help & Support',
              ),
              UIHelper.verticalSpace(25.w),
              const DrawerItemWidget(
                widget: SizedBox.shrink(),
                itemName: 'Privacy & Policy',
              ),
              UIHelper.verticalSpace(181.h),
              const DrawerItemWidget(
                widget: SizedBox.shrink(),
                itemName: 'Log Out',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItemWidget extends StatelessWidget {
  final bool isCircleAvatar;
  final String? itemName;

  final Widget widget;
  const DrawerItemWidget({
    this.isCircleAvatar = false,
    this.itemName,
    required this.widget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.sp),
      child: Row(
        children: [
          Image.asset(
            Assets.icons.boxIcon.path,
            width: 20.w,
          ),
          UIHelper.horizontalSpace(16.w),
          Text(
            itemName ?? '',
            style: TextFontStyle.headline16w400C848484StyleInter
                .copyWith(color: AppColors.c141414),
          ),
          UIHelper.horizontalSpace(5.w),
          isCircleAvatar == true ? widget : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
