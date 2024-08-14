import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class CustomRadio extends StatelessWidget {
  final int value;
  final int groupValue;
  final ValueChanged<int?>? onChanged;
  final String label;

  const CustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;
    return GestureDetector(
      onTap: () {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          children: [
            Container(
              height: 25.h,
              width: 25.w,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.cB3BAC5, width: 3),
                shape: BoxShape.circle,
                color:
                    isSelected ? AppColors.allPrimaryColor : AppColors.cB3BAC5,
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        height: 22.h,
                        width: 22.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.allPrimaryColor,
                        ),
                      ),
                    )
                  : null,
            ),
            UIHelper.horizontalSpace(20.w),
            Text(label,
                style: TextFontStyle.headline16w400C848484StyleInter
                    .copyWith(color: AppColors.c141414)),
          ],
        ),
      ),
    );
  }
}
