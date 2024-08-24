
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common_widgets/auth_button.dart';
import '../../../../common_widgets/loading_indicators.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../networks/endpoints.dart';

class HomeWidget extends StatelessWidget {
  final String? imageLink;
  final String? userName;
  final String? location;
  final String? skills;
  final String? expart;
  final VoidCallback? onTapViewProfile;
  final VoidCallback? onTapSendMessage;

  const HomeWidget({
    this.userName,
    this.expart,
    this.imageLink,
    this.location,
    this.skills,
    this.onTapSendMessage,
    this.onTapViewProfile,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UIHelper.verticalSpace(118.h),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              color: AppColors.allPrimaryColor,
              height: 80.h,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: .70.sh,
                  width: .9.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.r),
                        child: CachedNetworkImage(
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          imageUrl:
                              imageLink != null ? imageUrl + imageLink! : '',
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  loadingIndicatorCircle(context: context),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Column(
                          children: [
                            Container(
                              height: .22.sh,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                gradient: const LinearGradient(
                                  stops: [0.0, 50],
                                  colors: [
                                    Color(
                                        0xff000000), // Opaque black color at the bottom
                                    Colors.transparent,
                                    // Transparent at the top
                                  ],
                                  begin: Alignment
                                      .bottomCenter, // Start from bottom
                                  end: Alignment.topCenter, // End at top
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -15,
              left: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AuthCustomeButton(
                      name: "View Profle",
                      onCallBack: onTapViewProfile!,
                      height: 50.h,
                      minWidth: 160.w,
                      borderRadius: 6.r,
                      color: AppColors.cffffff,
                      textStyle: TextFontStyle.headline14w600C141414StyleInter
                          .copyWith(color: AppColors.c000000),
                      context: context),
                  UIHelper.horizontalSpaceSmall,
                  AuthCustomeButton(
                      name: "Send Message",
                      onCallBack: onTapSendMessage!,
                      height: 50.h,
                      minWidth: 160.w,
                      borderRadius: 6.r,
                      color: AppColors.allPrimaryColor,
                      textStyle: TextFontStyle.headline14w600C141414StyleInter
                          .copyWith(color: AppColors.cffffff),
                      context: context)
                ],
              ),
            ),
            Positioned(
              left: 40.w,
              bottom: 50.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userName ?? '',
                      style: TextFontStyle.headline24w600CffffffStyleInter),
                  UIHelper.verticalSpace(8.h),
                  Row(
                    children: [
                      Image.asset(
                        Assets.icons.homeIcon.path,
                        width: 18.w,
                      ),
                      UIHelper.horizontalSpace(6.w),
                      Text(
                        location ?? '',
                        style: TextFontStyle.headline12w400C9E9E9EStyleInter,
                      ),
                    ],
                  ),
                  UIHelper.verticalSpace(6.h),
                  Row(
                    children: [
                      Image.asset(
                        Assets.icons.search.path,
                        width: 18.w,
                      ),
                      UIHelper.horizontalSpace(6.w),
                      Text(
                        skills ?? '',
                        style: TextFontStyle.headline12w400C9E9E9EStyleInter,
                      ),
                    ],
                  ),
                  UIHelper.verticalSpace(6.h),
                  Row(
                    children: [
                      Image.asset(
                        Assets.icons.bagIcon.path,
                        width: 18.w,
                      ),
                      UIHelper.horizontalSpace(6.w),
                      Text(
                        expart ?? '',
                        style: TextFontStyle.headline12w400C9E9E9EStyleInter,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
