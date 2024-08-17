import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/auth_button.dart';
import '../../../common_widgets/custom_text_feild.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';

class ExperianceEditScreen extends StatefulWidget {
  const ExperianceEditScreen({super.key});

  @override
  State<ExperianceEditScreen> createState() => _ExperianceEditScreenState();
}

class _ExperianceEditScreenState extends State<ExperianceEditScreen> {
  final _companyName = TextEditingController();
  final _designation = TextEditingController();
  final _employeeType = TextEditingController();
  final _endDate = TextEditingController();
  final _startDate = TextEditingController();
  final _jobLocation = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 75.h,
          elevation: 0,
          backgroundColor: AppColors.cffffff,
          leading: GestureDetector(
            onTap: () {
              NavigationService.goBack();
            },
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.c000000,
            ),
          ),
          title: Text(
            'Edit Experiences',
            style: TextFontStyle.headline20w600C141414StyleInter,
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(25.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Company Name',
                  style: TextFontStyle.headline14w600C141414StyleInter,
                ),
                UIHelper.verticalSpace(4.h),
                CustomTextFormField(
                  maxline: 1,
                  controller: _companyName,
                  isPrefixIcon: false,
                  hintText: 'Xbox',
                ),
                UIHelper.verticalSpace(12.h),
                Text(
                  'Designation',
                  style: TextFontStyle.headline14w600C141414StyleInter,
                ),
                UIHelper.verticalSpace(4.h),
                CustomTextFormField(
                  maxline: 1,
                  controller: _designation,
                  isPrefixIcon: false,
                  hintText: 'Abc Category',
                ),
                UIHelper.verticalSpace(12.h),
                Text(
                  'Employee Type',
                  style: TextFontStyle.headline14w600C141414StyleInter,
                ),
                UIHelper.verticalSpace(4.h),
                CustomTextFormField(
                  maxline: 1,
                  controller: _employeeType,
                  isPrefixIcon: false,
                  hintText: 'Abc Category',
                ),
                UIHelper.verticalSpace(12.h),
                Text(
                  'Start Date',
                  style: TextFontStyle.headline14w600C141414StyleInter,
                ),
                UIHelper.verticalSpace(4.h),
                CustomTextFormField(
                  maxline: 1,
                  controller: _startDate,
                  isPrefixIcon: false,
                  hintText: '20/10/2024',
                ),
                UIHelper.verticalSpace(12.h),
                Text(
                  'End Date',
                  style: TextFontStyle.headline14w600C141414StyleInter,
                ),
                UIHelper.verticalSpace(4.h),
                CustomTextFormField(
                  maxline: 1,
                  controller: _endDate,
                  isPrefixIcon: false,
                  hintText: 'Currently Working Here',
                ),
                UIHelper.verticalSpace(12.h),
                Text(
                  'Job Location',
                  style: TextFontStyle.headline14w600C141414StyleInter,
                ),
                UIHelper.verticalSpace(4.h),
                CustomTextFormField(
                  maxline: 1,
                  controller: _jobLocation,
                  isPrefixIcon: false,
                  hintText: 'H#28, R#03, Block#H, City Name, Area, Area Code',
                ),
                UIHelper.verticalSpace(30.h),
                AuthCustomeButton(
                  name: 'Save & Continue',
                  onCallBack: () {},
                  height: 50.h,
                  minWidth: double.infinity,
                  borderRadius: 25.r,
                  color: AppColors.allPrimaryColor,
                  textStyle: TextFontStyle.headline14w600C141414StyleInter
                      .copyWith(color: AppColors.cffffff),
                  context: context,
                ),
              ],
            ),
          ),
        ),
       
      ),
    );
  }
}
