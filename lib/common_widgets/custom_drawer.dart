import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/text_font_style.dart';
import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';
import '../helpers/ui_helpers.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback? onTapNotification;
  final VoidCallback? onTapPaymnetHistory;
  final VoidCallback? onTapAboutus;
  final VoidCallback? onTapHelpAndSuport;
  final VoidCallback? onTapPrivacy;
  final VoidCallback? onTapLogout;
  final bool isTextColor;
  const CustomDrawer({
    this.onTapNotification,
    this.onTapPaymnetHistory,
    this.onTapAboutus,
    this.onTapHelpAndSuport,
    this.onTapPrivacy,
    this.onTapLogout,
    this.isTextColor = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:
          isTextColor == true ? AppColors.allPrimaryColor : AppColors.cffffff,
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
            isColor: isTextColor,
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
            isColor: isTextColor,
            onTap: onTapPaymnetHistory,
            widget: const SizedBox.shrink(),
            itemName: 'Payment History',
          ),
          UIHelper.verticalSpace(25.w),
          DrawerItemWidget(
            isColor: isTextColor,
            onTap: onTapAboutus,
            widget: const SizedBox.shrink(),
            itemName: 'About Us',
          ),
          UIHelper.verticalSpace(25.w),
          DrawerItemWidget(
            isColor: isTextColor,
            onTap: onTapHelpAndSuport,
            widget: const SizedBox.shrink(),
            itemName: 'Help & Support',
          ),
          UIHelper.verticalSpace(25.w),
          DrawerItemWidget(
            isColor: isTextColor,
            onTap: onTapPrivacy,
            widget: const SizedBox.shrink(),
            itemName: 'Privacy & Policy',
          ),
          UIHelper.verticalSpace(181.h),
          DrawerItemWidget(
            isColor: isTextColor,
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
  final bool isColor;
  final bool isCircleAvatar;
  final String? itemName;
  final VoidCallback? onTap;

  final Widget widget;
  const DrawerItemWidget({
    this.isCircleAvatar = false,
    this.isColor = false,
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
              color: isColor == true ? AppColors.cffffff : AppColors.c292D32,
              width: 20.w,
            ),
            UIHelper.horizontalSpace(16.w),
            Text(
              itemName ?? '',
              style: TextFontStyle.headline16w400C848484StyleInter.copyWith(
                  color:
                      isColor == true ? AppColors.cffffff : AppColors.c141414),
            ),
            UIHelper.horizontalSpace(5.w),
            isCircleAvatar == true ? widget : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
