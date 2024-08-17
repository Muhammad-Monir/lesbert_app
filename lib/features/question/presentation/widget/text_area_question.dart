import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common_widgets/custom_text_feild.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../helpers/ui_helpers.dart';

class TextAreaQuestion extends StatelessWidget {
  final TextEditingController controller;
  final String question;
  const TextAreaQuestion(
      {super.key, required this.controller, required this.question});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UIHelper.verticalSpace(46.h),
        Text(
          question,
          style: TextFontStyle.headline20w400C141414StyleInter,
        ),
        UIHelper.verticalSpace(22.h),
        CustomTextFormField(
          isPrefixIcon: false,
          hintText: 'Add details',
          controller: controller,
          maxline: 5,
        )
      ],
    );
  }
}
