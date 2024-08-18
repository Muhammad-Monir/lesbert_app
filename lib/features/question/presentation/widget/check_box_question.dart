import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common_widgets/custom_checkbox.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../helpers/ui_helpers.dart';

class CheckBoxQuestion extends StatelessWidget {
  final List<String> title;
  final ValueChanged<String?>? onChanged;
  final String question;
  final int qustionId;

  CheckBoxQuestion({
    super.key,
    required this.title,
    required this.onChanged,
    required this.question,
    required this.qustionId,
  });

  List<bool> isCheckedList = [];

  @override
  Widget build(BuildContext context) {
    isCheckedList = List.generate(title.length, (index) => false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UIHelper.verticalSpace(34.h),
        Text(
          question,
          style: TextFontStyle.headline20w400C141414StyleInter,
        ),
        UIHelper.verticalSpace(37.h),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: title.length,
          itemBuilder: (context, index) {
            return CheckboxListItem(
              value: isCheckedList[index],
              onChanged: (bool? value) {
                log(value.toString());
                onChanged?.call(title[index]);
              },
              label: title[index],
            );
          },
        ),
      ],
    );
  }
}
