import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/helpers/navigation_service.dart';

import '../constants/text_font_style.dart';
import '../gen/assets.gen.dart';
import '../helpers/all_routes.dart';
import '../helpers/ui_helpers.dart';

class OtherDetailsWidget extends StatelessWidget {
  final String? skill;
  final String? language;
  final bool isEdit;
  final VoidCallback? onTapOtherDetailsEdit;
  const OtherDetailsWidget({
    this.language,
    this.skill,
    this.isEdit = true,
    this.onTapOtherDetailsEdit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Other Details',
                style: TextFontStyle.headline16w600C000000tyleiPoppins,
              ),
              const Spacer(),
              isEdit == true
                  ? GestureDetector(
                      onTap: onTapOtherDetailsEdit,
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
            'Key Skills',
            style: TextFontStyle.headline14w600C141414StyleInter,
          ),
          UIHelper.verticalSpace(4.h),
          Text(
            skill ?? '',
            style: TextFontStyle.headline12w400C9E9E9EStyleInter,
          ),
          UIHelper.verticalSpace(20.h),
          Text(
            'Language Proficiency',
            style: TextFontStyle.headline14w600C141414StyleInter,
          ),
          UIHelper.verticalSpace(4.h),
          Text(
            language ?? '',
            style: TextFontStyle.headline12w400C9E9E9EStyleInter,
          ),
        ],
      ),
    );
  }
}
