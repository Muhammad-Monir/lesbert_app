import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/helpers/navigation_service.dart';

import '../constants/text_font_style.dart';
import '../gen/assets.gen.dart';
import '../helpers/all_routes.dart';
import '../helpers/ui_helpers.dart';

class BioWidget extends StatelessWidget {
  final String? bioDescription;
  final String? lstQualification;
  final String? title;
  final String? industry;
  final String? prepredLocation;
  final String? endDate;
  final bool isEdit;

  const BioWidget({
    this.bioDescription,
    this.lstQualification,
    this.title,
    this.industry,
    this.prepredLocation,
    this.endDate,
    this.isEdit = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsetsDirectional.symmetric(vertical: 15.h, horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Your Bio',
                style: TextFontStyle.headline16w600C000000tyleiPoppins,
              ),
              const Spacer(),
              isEdit == true
                  ? GestureDetector(
                      onTap: () {
                        NavigationService.navigateTo(Routes.bioEdit);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            Assets.icons.editIcon.path,
                            width: 12.w,
                          ),
                          UIHelper.horizontalSpace(8.w),
                          Text(
                            'Edit Details',
                            style:
                                TextFontStyle.headline12w600CprimaryStyleInter,
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
          UIHelper.verticalSpace(20.h),
          Text(
            bioDescription ?? '',
            style: TextFontStyle.headline12w400C9E9E9EStyleInter,
          ),
          UIHelper.verticalSpace(20.h),
          Text(
            'Last Qualification',
            style: TextFontStyle.headline14w600C141414StyleInter,
          ),
          UIHelper.verticalSpace(4.h),
          Text(
            lstQualification ?? '',
            style: TextFontStyle.headline12w400C9E9E9EStyleInter,
          ),
          UIHelper.verticalSpace(20.h),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title',
                    style: TextFontStyle.headline14w600C141414StyleInter,
                  ),
                  UIHelper.verticalSpace(4.h),
                  Text(
                    title ?? '',
                    style: TextFontStyle.headline12w400C9E9E9EStyleInter,
                  ),
                  UIHelper.verticalSpace(20.h),
                  Text(
                    'Industry',
                    style: TextFontStyle.headline14w600C141414StyleInter,
                  ),
                  UIHelper.verticalSpace(4.h),
                  Text(
                    industry ?? '',
                    style: TextFontStyle.headline12w400C9E9E9EStyleInter,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Preferred Location',
                    style: TextFontStyle.headline14w600C141414StyleInter,
                  ),
                  UIHelper.verticalSpace(4.h),
                  Text(
                    prepredLocation ?? '',
                    style: TextFontStyle.headline12w400C9E9E9EStyleInter,
                  ),
                  UIHelper.verticalSpace(20.h),
                  Text(
                    'End Date',
                    style: TextFontStyle.headline14w600C141414StyleInter,
                  ),
                  UIHelper.verticalSpace(4.h),
                  Text(
                    endDate ?? '',
                    style: TextFontStyle.headline12w400C9E9E9EStyleInter,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
