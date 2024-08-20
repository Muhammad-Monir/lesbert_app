import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../common_widgets/custom_checkbox.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../provider/resault_provider.dart';

class CheckBoxQuestion extends StatefulWidget {
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

  @override
  State<CheckBoxQuestion> createState() => _CheckBoxQuestionState();
}

class _CheckBoxQuestionState extends State<CheckBoxQuestion> {
  // List<bool> isCheckedList = [];

  @override
  Widget build(BuildContext context) {
    ResaultProvider resaultProvider =
        Provider.of<ResaultProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UIHelper.verticalSpace(34.h),
        Text(
          widget.question,
          style: TextFontStyle.headline20w400C141414StyleInter,
        ),
        UIHelper.verticalSpace(37.h),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.title.length,
          itemBuilder: (context, index) {
            log(index.toString());
            return CheckboxListItem(
              value: context.read<ResaultProvider>().isCheckedList[index],
              onChanged: (bool? value) {
                List<Map<int, String>> value = [];
                //   log(value.toString());
                //final index = title.indexOf(title[index]);
                //  if (index != -1) {
                setState(() {
                  context.read<ResaultProvider>().isCheckedList[index] =
                      !context.read<ResaultProvider>().isCheckedList[index];
                  List<bool> checkedList =
                      context.read<ResaultProvider>().isCheckedList;

                  for (int i = 0; i < checkedList.length; i++) {
                    log('Fruit at index $i: ${checkedList[i]}');
                    log('Title at index $i: ${widget.title[i]}');
                    if (checkedList[i]) {
                      Map<int, String> chekBox = {i: widget.title[i]};
                      value.add(chekBox);
                    }
                  }
                  resaultProvider.removeByKey(widget.qustionId);
                  resaultProvider.addAnswer({widget.qustionId: value});
                });

                //  }
                //  onChanged?.call(title[index]);
              },
              label: widget.title[index],
            );
          },
        ),
      ],
    );
  }
}

Map a = {
  "id": [
    {"index": "value"},
    {"index": "value"},
    {"index": "value"}
  ]
};
