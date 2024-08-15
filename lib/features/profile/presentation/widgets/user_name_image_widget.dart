import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../helpers/ui_helpers.dart';

class UserImageAndNameWidget extends StatelessWidget {
  final String? userImage;
  final String? userName;
  final String? userSubtitle;
  const UserImageAndNameWidget({
    this.userImage,
    this.userName,
    this.userSubtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35.r,
            backgroundImage: AssetImage(userImage ?? ''),
          ),
          UIHelper.horizontalSpace(28.w),
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
          )
        ],
      ),
    );
  }
}

