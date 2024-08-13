import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../gen/colors.gen.dart';

class SocialIconWidget extends StatelessWidget {
  final String iconName;
  final VoidCallback? onTap;
  final double height;
  const SocialIconWidget({
    required this.iconName,
    this.onTap,
    this.height = 14,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: height.h),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.cDEE4F2, width: 1.w),
            borderRadius: BorderRadius.circular(15.r),
            color: AppColors.cffffff),
        child: Image.asset(
          iconName,
          width: 28.w,
        ),
      ),
    );
  }
}
