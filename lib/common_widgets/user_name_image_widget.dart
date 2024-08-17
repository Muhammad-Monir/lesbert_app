import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/helpers/navigation_service.dart';
import '../constants/text_font_style.dart';
import '../gen/assets.gen.dart';
import '../helpers/all_routes.dart';
import '../helpers/ui_helpers.dart';

class UserImageAndNameWidget extends StatelessWidget {
  final VoidCallback? onTapProfileEdit;
  final String? userImage;
  final String? userName;
  final String? userSubtitle;
  const UserImageAndNameWidget({
    this.userImage,
    this.userName,
    this.userSubtitle,
     this.onTapProfileEdit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 35.r,
            backgroundImage: AssetImage(userImage ?? ''),
          ),
          UIHelper.horizontalSpace(14.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName ?? '',
                style: TextFontStyle.headline16w600C00000StyleInter,
              ),
              UIHelper.verticalSpace(4.h),
              Text(
                userSubtitle ?? '',
                style: TextFontStyle.headline12w400C9E9E9EStyleInter,
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: onTapProfileEdit,
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
                  style: TextFontStyle.headline12w600CprimaryStyleInter,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
