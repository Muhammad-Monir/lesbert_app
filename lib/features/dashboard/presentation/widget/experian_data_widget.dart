import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class ExperianceDataWidget extends StatelessWidget {
  final String? compnayName;
  final String? proffession;
  final String? location;
  final String? dateAndTime;
  final String? shortDescription;
  const ExperianceDataWidget({
    this.compnayName,
    this.proffession,
    this.location,
    this.dateAndTime,
    this.shortDescription,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppColors.cffffff,
      ),
      child: Padding(
        padding:  EdgeInsets.all(24.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelper.verticalSpaceMedium,
            Text(
              "Experience",
              style: TextFontStyle.headline24w700C000000StyleInter,
            ),
            UIHelper.verticalSpaceMedium,
            SizedBox(
              height: 80.h,
              width: double.infinity,
              //color: AppColors.allPrimaryColor,
              child: Stack(
                children: [
                  Image.asset(
                    Assets.icons.experience.path,
                    height: 24.h,
                    width: 24.w,
                  ),
                  Positioned(
                    left: 40.w,
                    child: Text(compnayName ?? '',
                        style: TextFontStyle.headline16w600C00000StyleInter),
                  ),
                  Positioned(
                      top: 35.h,
                      left: 40.w,
                      child: Text(
                        proffession ?? '',
                        style: TextFontStyle.headline14w400C000000StyleInter,
                      )),
                ],
              ),
            ),
            Row(
              children: [
                Image.asset(
                  Assets.icons.location.path,
                  height: 24.h,
                  width: 24.w,
                ),
                UIHelper.horizontalSpaceSmall,
                Text(location ?? ''),
                UIHelper.horizontalSpaceMedium,
                Image.asset(
                  Assets.icons.duration.path,
                  height: 24.h,
                  width: 24.w,
                ),
                UIHelper.horizontalSpaceSmall,
                Text(dateAndTime ?? ''),
              ],
            ),
            UIHelper.verticalSpaceMedium,
            Text(
              shortDescription ?? '',
              textAlign: TextAlign.justify,
              style: TextFontStyle.headline14w400C848484StyleInter
                  .copyWith(color: AppColors.c5A5C5F),
            ),
            UIHelper.horizontalSpaceSmall,
          ],
        ),
      ),
    );
  }
}
