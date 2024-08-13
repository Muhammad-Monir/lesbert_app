import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../gen/colors.gen.dart';

class TextFontStyle {
//Initialising Constractor
  TextFontStyle._();
  //new
  // static final headline50StyleMontserrat = GoogleFonts.montserrat(color: AppColors.cFFFFFF,fontSize: 50.sp, fontWeight: FontWeight.w400);
  // static final headline27StyleMontserrat =
  //     GoogleFonts.montserrat(color: AppColors.c0A0909, fontSize: 27.sp, fontWeight: FontWeight.w600);
  static final headline12w400C9E9E9EStyleInter = GoogleFonts.inter(
      color: AppColors.c9E9E9E, fontSize: 12.sp, fontWeight: FontWeight.w400);

  static final headline48w600CFFFFFFFFStylePoppins = GoogleFonts.poppins(
      color: AppColors.cffffff, fontSize: 48.sp, fontWeight: FontWeight.w600);

  static final headline16w600CFFFFFFFFStyleintere = GoogleFonts.inter(
      color: AppColors.cffffff, fontSize: 16.sp, fontWeight: FontWeight.w600);
}
