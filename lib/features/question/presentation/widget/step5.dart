import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common_widgets/auth_button.dart';
import '../../../../common_widgets/custom_text_feild.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class Step5Content extends StatelessWidget {
  final TextEditingController controller;
  const Step5Content({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UIHelper.verticalSpace(35.h),
        Text(
          'What are your Pro-time Preferences?',
          style: TextFontStyle.headline18w500C848484StyleInter
              .copyWith(color: AppColors.c141414),
        ),
        UIHelper.verticalSpace(22.h),
        CustomTextFormField(
          controller: controller,
          isPrefixIcon: false,
          maxline: 5,
          hintText: 'Add details',
        ),
        UIHelper.verticalSpace(46.h),
        Text(
          'How do you prioritize tasks and maintain organization in a busy office setting?',
          style: TextFontStyle.headline20w400C141414StyleInter,
        ),
        UIHelper.verticalSpace(12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AuthCustomeButton(
              borderRadius: 10.r,
              color: AppColors.cB3BAC5,
              context: context,
              height: 50.h,
              minWidth: 150.w,
              name: 'Yes',
              onCallBack: () {
                // NavigationService.navigateToReplacement(Routes.otpVerify);
              },
              textStyle: TextFontStyle.headline18w500C848484StyleInter
                  .copyWith(color: AppColors.cffffff),
            ),
            AuthCustomeButton(
              borderRadius: 10.r,
              color: AppColors.cB3BAC5,
              context: context,
              height: 50.h,
              minWidth: 150.w,
              name: 'No',
              onCallBack: () {
                // NavigationService.navigateToReplacement(Routes.otpVerify);
              },
              textStyle: TextFontStyle.headline18w500C848484StyleInter
                  .copyWith(color: AppColors.cffffff),
            ),
          ],
        ),
      
      ],
    );
  }
}
