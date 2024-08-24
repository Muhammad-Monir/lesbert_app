import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class SupportCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final bool type;
  final VoidCallback callback;
  const SupportCard({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.type,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: .22.sh,
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: AppColors.cffffff,
            borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //UIHelper.verticalSpaceMedium,
            Text(
              title,
              style: TextFontStyle.headline16w600C00000StyleInter
                  .copyWith(color: AppColors.c000000),
            ),
            UIHelper.verticalSpaceMedium,
            Text(
              description,
              style: TextFontStyle.headline12w400C9E9E9EStyleInter
                  .copyWith(color: AppColors.c141414),
            ),
            UIHelper.verticalSpaceSmall,
            Spacer(),
            UIHelper.customDivider(width: .8.sw),
            // UIHelper.verticalSpaceMedium,
            // Text(
            //   "Cameron Williamson",
            //   style: TextFontStyle.headline16w600C00000StyleInter
            //       .copyWith(color: AppColors.c000000),
            // ),
            UIHelper.verticalSpaceSmall,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: TextFontStyle.headline12w400C9E9E9EStyleInter
                      .copyWith(color: AppColors.c5A5C5F),
                ),
                Text(
                  type ? "Resolved" : "Pending",
                  style: !type
                      ? TextFontStyle.headline12w400C9E9E9EStyleInter
                          .copyWith(color: AppColors.c9E9E9E)
                      : TextFontStyle.headline12w700C9E9E9EStyleInter
                          .copyWith(color: AppColors.allPrimaryColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
