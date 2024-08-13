import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common_widgets/auth_button.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../helpers/ui_helpers.dart';

class OtpSuccessScreen extends StatelessWidget {
  const OtpSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.images.otpSuccessFlower.path,
              width: 180.w,
            ),
            UIHelper.verticalSpace(20.h),
            Text(
              'Successfull',
              style: TextFontStyle.headline24w700C000000StyleInter,
            ),
            UIHelper.verticalSpace(16.h),
            Text(
              textAlign: TextAlign.center,
              'You have created your account successfully. Now, you can search and connect.',
              style: TextFontStyle.headline16w400C848484StyleInter,
            ),
            UIHelper.verticalSpace(195.h),
            AuthCustomeButton(
              borderRadius: 10.r,
              color: AppColors.allPrimaryColor,
              context: context,
              height: 50.h,
              minWidth: double.infinity,
              name: 'Continue',
              onCallBack: () {
                NavigationService.navigateToReplacement(Routes.login);
              },
              textStyle: TextFontStyle.headline16w700CffffffStyleInter,
            ),
          ],
        ),
      ),
    );
  }
}
