import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../provider/resault_provider.dart';
import 'custom_radio_button.dart';

class RadioQuestion extends StatefulWidget {
  const RadioQuestion({
    super.key,
    required this.items1,
    required this.question,
    required this.qustionId,
  });

  final List<String> items1;

  final String question;
  final int qustionId;

  @override
  State<RadioQuestion> createState() => _RadioQuestionState();
}

class _RadioQuestionState extends State<RadioQuestion> {
  @override
  Widget build(BuildContext context) {
    ResaultProvider resaultProvider =
        Provider.of<ResaultProvider>(context, listen: true);
    return Column(
      children: [
        UIHelper.verticalSpace(37.w),
        Text(
          widget.question,
          style: TextFontStyle.headline18w500C848484StyleInter
              .copyWith(color: AppColors.c141414),
        ),
        UIHelper.verticalSpace(27.h),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.items1.length,
          itemBuilder: (context, index) {
            return CustomRadio(
              value: index,
              groupValue: resaultProvider.getradioValueByKey(widget.qustionId),
              onChanged: (value) {
                setState(() {
                  log('Selected value 1: $value');
                  log('Selected value 1: ${widget.items1[index]}');
                  Map data = {value: widget.items1[index]};
                  resaultProvider.removeByKey(widget.qustionId);
                  resaultProvider.addAnswer({widget.qustionId: data});
                  //resaultProvider.getradioValueByKey(widget.qustionId);
                });
              },
              label: widget.items1[index],
            );
          },
        ),
        UIHelper.verticalSpace(52.w),
        // Text(
        //   'What are your fees for professional services for this Trade?',
        //   style: TextFontStyle.headline18w500C848484StyleInter
        //       .copyWith(color: AppColors.c141414),
        // ),
        // UIHelper.verticalSpace(27.w),
        // ListView.builder(
        //   physics: const NeverScrollableScrollPhysics(),
        //   shrinkWrap: true,
        //   itemCount: items2.length,
        //   itemBuilder: (context, index) {
        //     return CustomRadio(
        //       value: index,
        //       groupValue: selectValue2,
        //       onChanged: (value) {
        //         setState(() {
        //           selectValue2 = value!;
        //           log('Selected value 2: $value');
        //         });
        //       },
        //       label: items2[index],
        //     );
        //   },
        // ),
        // UIHelper.verticalSpace(50.h),
      ],
    );
  }
}
