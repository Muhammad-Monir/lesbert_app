import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/common_widgets/custom_drawer.dart';
import 'package:lsebert/helpers/ui_helpers.dart';

import '../../../common_widgets/bio_widegt.dart';
import '../../../common_widgets/divider_container.dart';
import '../../../common_widgets/experiance_data_widget.dart';
import '../../../common_widgets/other_details_widget.dart';
import '../../../common_widgets/personal_details_widget.dart';
import '../../../constants/text_font_style.dart';
import '../../../common_widgets/user_name_image_widget.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';

class ProProfileScreen extends StatefulWidget {
  const ProProfileScreen({super.key});

  @override
  State<ProProfileScreen> createState() => _ProProfileScreenState();
}

class _ProProfileScreenState extends State<ProProfileScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
          child: Column(
            children: [
              UIHelper.verticalSpace(20.h),
              UserImageAndNameWidget(
                userImage: Assets.images.userImage.path,
                userName: 'Andrew Hussy',
                userSubtitle: 'Professional',
                onTapProfileEdit: () =>
                    NavigationService.navigateTo(Routes.proEditProfile),
              ),
              PersonalDetailsWidget(
                isEdit: false,
                onTap: () {
                  NavigationService.navigateTo(Routes.personalDetailsEdit);
                },
                name: 'Nasib Hasan',
                phoneNum: '+01234567890',
                email: 'youremail@email.com',
                gender: 'Male',
                address: 'H#28, R#03, Block#H, City Name, Area, Area Code',
              ),
              UIHelper.verticalSpace(20.h),
              Padding(
                padding: EdgeInsets.all(25.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Bio',
                      style: TextFontStyle.headline16w600C00000StyleInter,
                    ),
                    UIHelper.verticalSpace(20.h),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt malesuada ornare. Proin sollicitudin eros mauris, non viverra ante fermentum sed. Aliquam efficitur, augue at condimentum elementum, turpis nisi tincidunt mi, ut finibus mi nibh nec mi. In auctor libero turpis, et placerat velit eleifend eget. Suspendisse congue hendrerit lacus id sodales. Morbi non nunc ipsum. ',
                      style: TextFontStyle.headline12w400C9E9E9EStyleInter
                          .copyWith(color: AppColors.c5A5C5F),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        drawer: CustomDrawer(
          isTextColor: true,
          onTapNotification: () {
            NavigationService.navigateTo(Routes.proNotification);
          },
          onTapPaymnetHistory: () =>
              NavigationService.navigateTo(Routes.proPaymnetHistory),
        ),
      ),
    );
  }
}
