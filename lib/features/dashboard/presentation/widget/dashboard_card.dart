import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';

class DashBoardCardProfessional extends StatelessWidget {
  final String count;
  final String detail;
  final String imagepath;
  final bool darkMode;
  final bool isText;

  const DashBoardCardProfessional({
    super.key,
    required this.count,
    required this.detail,
    required this.imagepath,
    required this.darkMode,
    required this.isText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: darkMode ? AppColors.allPrimaryColor : AppColors.cffffff,
      ),
      height: .15.sh,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Stack(
          children: [
            Positioned(
              left: 10.w,
              top: 5.h,
              child: Text(
                count,
                style:
                    TextFontStyle.headline48w600CFFFFFFFFStylePoppins.copyWith(
                  color:
                      darkMode ? AppColors.cffffff : AppColors.allPrimaryColor,
                ),
              ),
            ),
            Positioned(
              left: 15.w,
              bottom: 10.h,
              child: Text(
                detail,
                style:
                    TextFontStyle.headline16w600CFFFFFFFFStyleintere.copyWith(
                  color:
                      darkMode ? AppColors.cffffff : AppColors.allPrimaryColor,
                ),
              ),
            ),
            Positioned(
                right: 15.w,
                top: isText == false ? 25.h : 20.h,
                child: Image.asset(
                  imagepath,
                  color:
                      darkMode == true ? AppColors.c1F507F : AppColors.cE7ECF1,
                  height: 80.h,
                  width: 80.w,
                )),
            isText == true
                ? Positioned(
                    bottom: 0.h,
                    right: 10.w,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: Colors.white,
                        width: 2.w, // Underline thickness
                      ))),
                      child: Text(
                        "+ Add Boost",
                        style: TextStyle(
                          fontSize: 16.sp,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600,
                          color: darkMode
                              ? AppColors.cffffff
                              : AppColors.allPrimaryColor,
                        ),
                        // style: TextFontStyle.headline16w600CFFFFFFFFStyleintere
                        //     .copyWith(
                        //   color: darkMode
                        //       ? AppColors.cffffff
                        //       : AppColors.allPrimaryColor,
                        // ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

