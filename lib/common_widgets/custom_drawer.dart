import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/text_font_style.dart';
import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';
import '../helpers/ui_helpers.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback? onTapNotification;
  final VoidCallback? onTapPaymentHistory;
  final VoidCallback? onTapAboutus;
  final VoidCallback? onTapHelpAndSuport;
  final VoidCallback? onTapPrivacy;
  final VoidCallback? onTapLogout;
  const CustomDrawer({
    this.onTapNotification,
    this.onTapPaymentHistory,
    this.onTapAboutus,
    this.onTapHelpAndSuport,
    this.onTapPrivacy,
    this.onTapLogout,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            onTap: onTapNotification,
          ),
          UIHelper.verticalSpace(25.w),
          DrawerItemWidget(
            onTap: onTapPaymentHistory,
            widget: const SizedBox.shrink(),
            itemName: 'Payment History',
          ),
          UIHelper.verticalSpace(25.w),
          DrawerItemWidget(
            onTap: onTapAboutus,
            widget: const SizedBox.shrink(),
            itemName: 'About Us',
          ),
          UIHelper.verticalSpace(25.w),
          // DrawerItemWidget(
          //   isCircleAvatar: true,
          //   widget: GestureDetector(
          //     onTap: () {
          //       onSettingsToggle();
          //     },
          //     child: Stack(
          //       clipBehavior: Clip.none,
          //       children: [
          //         Icon(
          //           isSettingOpen
          //               ? Icons.keyboard_arrow_up
          //               : Icons.keyboard_arrow_down,
          //           color: AppColors.allPrimaryColor,
          //         ),
          //         if (isSettingOpen)
          //           Positioned(
          //             bottom: -55.h,
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text(
          //                   'Security',
          //                   style: TextFontStyle.headline16w400C848484StyleInter
          //                       .copyWith(
          //                     color: AppColors.c141414,
          //                   ),
          //                 ),
          //                 UIHelper.verticalSpace(10.h),
          //                 Text(
          //                   'Payment History',
          //                   style: TextFontStyle.headline16w400C848484StyleInter
          //                       .copyWith(
          //                     color: AppColors.c141414,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //       ],
          //     ),
          //   ),
          //   itemName: 'Settings',
          // ),
          // UIHelper.verticalSpace(isSettingOpen == true ? 70.w : 25.w),
          DrawerItemWidget(
            onTap: onTapHelpAndSuport,
            widget: const SizedBox.shrink(),
            itemName: 'Help & Support',
          ),
          UIHelper.verticalSpace(25.w),
          DrawerItemWidget(
            onTap: onTapPrivacy,
            widget: const SizedBox.shrink(),
            itemName: 'Privacy & Policy',
          ),
          UIHelper.verticalSpace(181.h),
          DrawerItemWidget(
            onTap: onTapLogout,
            widget: const SizedBox.shrink(),
            itemName: 'Log Out',
          ),
        ],
      ),
    );
  }
}

class DrawerItemWidget extends StatelessWidget {
  final bool isCircleAvatar;
  final String? itemName;
  final VoidCallback? onTap;

  final Widget widget;
  const DrawerItemWidget({
    this.isCircleAvatar = false,
    this.itemName,
    required this.widget,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
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
      ),
    );
  }
}
