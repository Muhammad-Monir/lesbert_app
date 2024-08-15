import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../gen/colors.gen.dart';

class DividerContainer extends StatelessWidget {
  final double height;
  const DividerContainer({
    this.height = 12,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      decoration: const BoxDecoration(color: AppColors.cE7ECF1),
    );
  }
}
