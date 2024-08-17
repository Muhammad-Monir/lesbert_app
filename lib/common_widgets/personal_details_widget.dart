import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/text_font_style.dart';
import '../gen/assets.gen.dart';
import '../helpers/ui_helpers.dart';

class PersonalDetailsWidget extends StatelessWidget {
  final bool isEdit;
  final String? name;
  final String? email;
  final String? phoneNum;
  final String? gender;
  final String? address;
  final VoidCallback? onTap;
  const PersonalDetailsWidget({
    this.name,
    this.email,
    this.phoneNum,
    this.gender,
    this.address,
    this.onTap,
    this.isEdit = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Text(
                  'Personal Details',
                  style: TextFontStyle.headline16w600C000000tyleiPoppins,
                ),
                const Spacer(),
                isEdit == true
                    ? GestureDetector(
                        onTap: () {},
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
                              style: TextFontStyle
                                  .headline12w600CprimaryStyleInter,
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          UIHelper.verticalSpace(30.h),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: TextFontStyle.headline14w600C141414StyleInter,
                  ),
                  UIHelper.verticalSpace(4.h),
                  Text(
                    name ?? '',
                    style: TextFontStyle.headline12w400C9E9E9EStyleInter,
                  ),
                  UIHelper.verticalSpace(20.h),
                  Text(
                    'Phone Number',
                    style: TextFontStyle.headline14w600C141414StyleInter,
                  ),
                  UIHelper.verticalSpace(4.h),
                  Text(
                    phoneNum ?? '',
                    style: TextFontStyle.headline12w400C9E9E9EStyleInter,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email Address',
                    style: TextFontStyle.headline14w600C141414StyleInter,
                  ),
                  UIHelper.verticalSpace(4.h),
                  Text(
                    email ?? '',
                    style: TextFontStyle.headline12w400C9E9E9EStyleInter,
                  ),
                  UIHelper.verticalSpace(20.h),
                  Text(
                    'Gender',
                    style: TextFontStyle.headline14w600C141414StyleInter,
                  ),
                  UIHelper.verticalSpace(4.h),
                  Text(
                    gender ?? '',
                    style: TextFontStyle.headline12w400C9E9E9EStyleInter,
                  ),
                ],
              )
            ],
          ),
          UIHelper.verticalSpace(20.h),
          Text(
            'Address',
            style: TextFontStyle.headline14w600C141414StyleInter,
          ),
          UIHelper.verticalSpace(4.h),
          Text(
            address ?? '',
            style: TextFontStyle.headline12w400C9E9E9EStyleInter,
          ),
        ],
      ),
    );
  }
}
