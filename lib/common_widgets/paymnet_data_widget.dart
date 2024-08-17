import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/text_font_style.dart';
import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';
import '../helpers/ui_helpers.dart';

class PaymentDataWidget extends StatelessWidget {
  final String? id;
  final String? purcheseDate;
  final String? purpose;
  final String? cardId;
  final VoidCallback? onTap;
  const PaymentDataWidget({
    this.id,
    this.purcheseDate,
    this.purpose,
    this.cardId,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 13.w),
      decoration: BoxDecoration(
        color: AppColors.cffffff,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 62.h,
              horizontal: 12.w,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: AppColors.c9AC1E7),
            child: Image.asset(
              Assets.icons.folderIcon.path,
              width: 30.w,
            ),
          ),
          UIHelper.horizontalSpace(20.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PaymnetDataTitleAndValue(
                title: 'ID: ',
                value: id ?? '',
              ),
              UIHelper.verticalSpace(6.h),
              PaymnetDataTitleAndValue(
                title: 'Purchase Date: ',
                value: purcheseDate ?? '',
              ),
              UIHelper.verticalSpace(6.h),
              PaymnetDataTitleAndValue(
                title: 'Purpose: ',
                value: purpose,
              ),
              UIHelper.verticalSpace(6.h),
              PaymnetDataTitleAndValue(
                title: 'Card ID: ',
                value: cardId,
              ),
              UIHelper.verticalSpace(6.h),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  'Download Invoice',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      color: AppColors.c141414),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class PaymnetDataTitleAndValue extends StatelessWidget {
  final String? title;
  final String? value;
  const PaymnetDataTitleAndValue({
    this.title,
    this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title ?? '',
          style: TextFontStyle.headline16w500C141414StyleInter
              .copyWith(color: AppColors.c000000),
        ),
        Text(
          value ?? '',
          style: TextFontStyle.headline16w500C141414StyleInter
              .copyWith(color: AppColors.c5A5C5F),
        ),
      ],
    );
  }
}
