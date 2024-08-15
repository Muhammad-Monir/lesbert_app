import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common_widgets/auth_button.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class Step1Content extends StatelessWidget {
  const Step1Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UIHelper.verticalSpace(27.h),
        Text(
          "Do you have experience working in the trade industry or similar fields as indicated?",
          style: TextFontStyle.headline20w400C141414StyleInter,
        ),
        UIHelper.verticalSpace(35.h),
        Text(
          "It is okay if you don’t; we just want to know your experience level for your match",
          style: TextFontStyle.headline20w400C141414StyleInter,
        ),
        UIHelper.verticalSpace(65.h),
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
