import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/common_widgets/auth_button.dart';
import 'package:lsebert/helpers/navigation_service.dart';

import '../../constants/text_font_style.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../helpers/all_routes.dart';
import '../../helpers/ui_helpers.dart';

class RoleScreen extends StatefulWidget {
  const RoleScreen({super.key});

  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UIHelper.verticalSpace(100.h),
              Image.asset(
                Assets.icons.logo.path,
                width: 169.w,
              ),
              UIHelper.verticalSpace(95.h),
              Text(
                textAlign: TextAlign.center,
                'What do you want to \njoin as?',
                style: TextFontStyle.headline16w700CffffffStyleInter
                    .copyWith(color: AppColors.c000000),
              ),
              UIHelper.verticalSpace(8.h),
              Text(
                  textAlign: TextAlign.center,
                  'Please choose an option',
                  style: TextFontStyle.headline16w400C848484StyleInter),
              UIHelper.verticalSpace(35.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AuthCustomeButton(
                      name: 'Trader',
                      onCallBack: () {},
                      height: 50.h,
                      minWidth: 150.w,
                      borderRadius: 10.r,
                      color: AppColors.cF4F5F7,
                      textStyle: TextFontStyle.headline18w500C848484StyleInter,
                      context: context),
                  AuthCustomeButton(
                      name: 'Professional',
                      onCallBack: () {
                        NavigationService.navigateToReplacement(Routes.login);
                      },
                      height: 50.h,
                      minWidth: 150.w,
                      borderRadius: 10.r,
                      color: AppColors.allPrimaryColor,
                      textStyle: TextFontStyle.headline18w500C848484StyleInter
                          .copyWith(color: AppColors.cffffff),
                      context: context)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
