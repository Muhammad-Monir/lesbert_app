import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/text_font_style.dart';
import '../gen/colors.gen.dart';
import '../helpers/ui_helpers.dart';

class NotificationWidget extends StatelessWidget {
  final String? firstWord;
  final String? title;
  final String? time;
  const NotificationWidget({
    this.firstWord,
    this.title,
    this.time,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24.r,
            backgroundColor: AppColors.c939393,
            child: Text(
              firstWord ?? '',
              style: TextFontStyle.headline16w600C000000tyleiPoppins
                  .copyWith(color: AppColors.cffffff),
            ),
          ),
          UIHelper.horizontalSpace(10.h),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  style: TextFontStyle.headline16w600C00000StyleInter,
                ),
                UIHelper.verticalSpace(4.h),
                Text(
                  time ?? '',
                  style: TextFontStyle.headline12w400C9E9E9EStyleInter,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
