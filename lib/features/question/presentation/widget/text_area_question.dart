import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/custom_text_feild.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../helpers/debounceer.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../provider/resault_provider.dart';

class TextAreaQuestion extends StatefulWidget {
  final int qustionId;
  final String question;
  const TextAreaQuestion(
      {super.key, required this.question, required this.qustionId});

  @override
  State<TextAreaQuestion> createState() => _TextAreaQuestionState();
}

class _TextAreaQuestionState extends State<TextAreaQuestion> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ResaultProvider resaultProvider =
        Provider.of<ResaultProvider>(context, listen: false);
    controller.text = resaultProvider.getValueByKey(widget.qustionId) ?? "";
    controller.addListener(
      () {
        final debouncer = Debouncer(milliseconds: 500);
        debouncer.run(() {
          resaultProvider.removeByKey(widget.qustionId);
          resaultProvider.addAnswer({widget.qustionId: controller.text});
        });
      },
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UIHelper.verticalSpace(46.h),
        Text(
          widget.question,
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
