import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/provider/resault_provider.dart';
import 'package:provider/provider.dart';
import '../../../../common_widgets/auth_button.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class PolarQuestion extends StatefulWidget {
  final String question;
  final int qustionId;
  const PolarQuestion(
      {super.key, required this.question, required this.qustionId});

  @override
  State<PolarQuestion> createState() => _PolarQuestionState();
}

class _PolarQuestionState extends State<PolarQuestion> {
  bool yesSelected = false;
  bool noSelected = false;
  @override
  Widget build(BuildContext context) {
    log(widget.qustionId.toString());
    ResaultProvider resaultProvider =
        Provider.of<ResaultProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UIHelper.verticalSpace(27.h),
        Text(
          widget.question,
          style: TextFontStyle.headline20w400C141414StyleInter,
        ),
        UIHelper.verticalSpace(35.h),
        UIHelper.verticalSpace(65.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AuthCustomeButton(
              borderRadius: 10.r,
              color: resaultProvider.checkValueByKey(widget.qustionId, "yes")
                  ? AppColors.allPrimaryColor
                  : AppColors.cB3BAC5,
              context: context,
              height: 50.h,
              minWidth: 150.w,
              name: 'Yes',
              onCallBack: () {
                setState(() {
                  yesSelected = true;
                  noSelected = false;
                  resaultProvider.removeByKey(widget.qustionId);
                  resaultProvider.addAnswer({widget.qustionId: "yes"});
                });
                // NavigationService.navigateToReplacement(Routes.otpVerify);
              },
              textStyle: TextFontStyle.headline18w500C848484StyleInter
                  .copyWith(color: AppColors.cffffff),
            ),
            AuthCustomeButton(
              borderRadius: 10.r,
              color: resaultProvider.checkValueByKey(widget.qustionId, "no")
                  ? AppColors.allPrimaryColor
                  : AppColors.cB3BAC5,
              context: context,
              height: 50.h,
              minWidth: 150.w,
              name: 'No',
              onCallBack: () {
                setState(() {
                  noSelected = true;
                  yesSelected = false;
                  resaultProvider.removeByKey(widget.qustionId);
                  resaultProvider.addAnswer({widget.qustionId: "no"});
                });
                // N
                // NavigationService.navigateToReplacement(Routes.otpVerify);
              },
              textStyle: TextFontStyle.headline18w500C848484StyleInter
                  .copyWith(color: AppColors.cffffff),
            ),
          ],
        ),
      ],
    );
  }
}
