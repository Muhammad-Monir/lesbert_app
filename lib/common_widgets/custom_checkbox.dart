import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/text_font_style.dart';
import '../gen/colors.gen.dart';

class CheckboxListItem extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final String label;

  const CheckboxListItem({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8.h),
      leading: Checkbox(
        checkColor: AppColors.allPrimaryColor,
        value: value,
        onChanged: onChanged,
        fillColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return Colors.grey; // color when disabled
            }
            return value == true
                ? AppColors.allPrimaryColor
                : AppColors.cD9D9D9; // fill color
          },
        ),
        side: WidgetStateBorderSide.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(
                color: AppColors.cD9D9D9,
                width: 2.w); // border color and width when disabled
          }
          return BorderSide(
              color: AppColors.cD9D9D9,
              width: 2.w); // custom border color and width
        }),
        activeColor: AppColors.allPrimaryColor,
      ),
      title: Text(label,
          style: TextFontStyle.headline16w400C848484StyleInter
              .copyWith(color: AppColors.c141414)),
    );
  }
}
