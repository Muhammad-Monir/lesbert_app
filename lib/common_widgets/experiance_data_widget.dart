import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/helpers/navigation_service.dart';

import 'auth_button.dart';
import '../constants/text_font_style.dart';
import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';
import '../helpers/all_routes.dart';
import '../helpers/ui_helpers.dart';

class ExperiencesDataWidget extends StatelessWidget {
  final String? crntCompanyName;
  final String? designation;
  final String? startDate;
  final String? employeeType;
  final String? endDate;
  final String? jobLocation;
  final bool isEdit;
  final VoidCallback? onTapExperianceEdit;

  const ExperiencesDataWidget({
    this.crntCompanyName,
    this.designation,
    this.startDate,
    this.endDate,
    this.employeeType,
    this.jobLocation,
    this.isEdit = true,
    this.onTapExperianceEdit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25..w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Experiences',
                style: TextFontStyle.headline16w600C000000tyleiPoppins,
              ),
              const Spacer(),
              isEdit == true
                  ? GestureDetector(
                      onTap:onTapExperianceEdit,
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
            'Current Company Name',
            style: TextFontStyle.headline14w600C141414StyleInter,
          ),
          UIHelper.verticalSpace(4.h),
          Text(
            crntCompanyName ?? '',
            style: TextFontStyle.headline12w400C9E9E9EStyleInter,
          ),
          UIHelper.verticalSpace(20.h),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Designation',
                    style: TextFontStyle.headline14w600C141414StyleInter,
                  ),
                  UIHelper.verticalSpace(4.h),
                  Text(
                    designation ?? '',
                    style: TextFontStyle.headline12w400C9E9E9EStyleInter,
                  ),
                  UIHelper.verticalSpace(20.h),
                  Text(
                    'Start Date',
                    style: TextFontStyle.headline14w600C141414StyleInter,
                  ),
                  UIHelper.verticalSpace(4.h),
                  Text(
                    startDate ?? '',
                    style: TextFontStyle.headline12w400C9E9E9EStyleInter,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Employee Type',
                    style: TextFontStyle.headline14w600C141414StyleInter,
                  ),
                  UIHelper.verticalSpace(4.h),
                  Text(
                    employeeType ?? '',
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
          ),
          UIHelper.verticalSpace(20.h),
          Text(
            'Job Location',
            style: TextFontStyle.headline14w600C141414StyleInter,
          ),
          UIHelper.verticalSpace(4.h),
          Text(
            jobLocation ?? '',
            style: TextFontStyle.headline12w400C9E9E9EStyleInter,
          ),
          UIHelper.verticalSpace(20.h),
          isEdit == true
              ? AuthCustomeButton(
                  name: '+ Add New Experience',
                  onCallBack: () {},
                  height: 50.h,
                  minWidth: double.infinity,
                  borderRadius: 30.r,
                  color: AppColors.allPrimaryColor,
                  textStyle: TextFontStyle.headline14w600C141414StyleInter
                      .copyWith(color: AppColors.cffffff),
                  context: context)
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
