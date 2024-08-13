import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/text_font_style.dart';
import '../helpers/ui_helpers.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        UIHelper.customDivider(width: 90.w),
        Padding(
          padding: EdgeInsets.only(right: 18.w, left: 18.w),
          child: Text(
            'Or',
            style: TextFontStyle.headline16w400C848484StyleInter,
          ),
        ),
        UIHelper.customDivider(width: 90.w),
      ],
    );
  }
}
