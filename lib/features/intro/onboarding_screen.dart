import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/helpers/all_routes.dart';
import 'package:lsebert/helpers/navigation_service.dart';

import '../../common_widgets/auth_button.dart';
import '../../constants/text_font_style.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../helpers/ui_helpers.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24.sp),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    UIHelper.verticalSpace(75.h),
                    Image.asset(
                      Assets.images.onboardImage1.path,
                      width: 155.w,
                    ),
                    UIHelper.verticalSpace(10.h),
                    Image.asset(
                      Assets.images.onboardingImage2.path,
                      width: 155.w,
                    ),
                  ],
                ),
                Column(
                  children: [
                    UIHelper.verticalSpace(28.h),
                    Image.asset(
                      Assets.images.onboardingImage3.path,
                      width: 155.w,
                    ),
                    UIHelper.verticalSpace(10.h),
                    Image.asset(
                      Assets.images.onboardingImage4.path,
                      width: 155.w,
                    ),
                  ],
                )
              ],
            ),
            UIHelper.verticalSpace(63.h),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Where Skilled ',
                  style: TextFontStyle.headline24w700C000000StyleInter,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Trades ',
                      style: TextFontStyle.headline24w700C000000StyleInter
                          .copyWith(color: AppColors.c073D71),
                    ),
                    TextSpan(
                      text: 'Meet Professional Support',
                      style: TextFontStyle.headline24w700C000000StyleInter,
                    ),
                  ],
                ),
              ),
            ),
            UIHelper.verticalSpace(48.h),
            AuthCustomeButton(
              borderRadius: 10.r,
              color: AppColors.allPrimaryColor,
              context: context,
              height: 50.h,
              minWidth: double.infinity,
              name: 'Continue',
              onCallBack: () {
                NavigationService.navigateToReplacement(Routes.role);
              },
              textStyle: TextFontStyle.headline16w700CffffffStyleInter,
            ),
          ],
        ),
      ),
    );
  }
}
