import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/auth_button.dart';
import '../../../common_widgets/custom_text_feild.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';

class BioEditScreen extends StatefulWidget {
  const BioEditScreen({super.key});

  @override
  State<BioEditScreen> createState() => _BioEditScreenState();
}

class _BioEditScreenState extends State<BioEditScreen> {
  final _bioDesController = TextEditingController();
  final _lasQualificationController = TextEditingController();
  final _titleController = TextEditingController();
  final _industryController = TextEditingController();
  final _preferLocationController = TextEditingController();
  final _endDateController = TextEditingController();
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
          'Edit Personal Details',
          style: TextFontStyle.headline20w600C141414StyleInter,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bio',
                style: TextFontStyle.headline14w600C141414StyleInter,
              ),
              UIHelper.verticalSpace(4.h),
              CustomTextFormField(
                maxline: 4,
                controller: _bioDesController,
                isPrefixIcon: false,
                hintText: 'Edit Your Bio',
              ),
              UIHelper.verticalSpace(12.h),
              Text(
                'Last Qualification',
                style: TextFontStyle.headline14w600C141414StyleInter,
              ),
              UIHelper.verticalSpace(4.h),
              CustomTextFormField(
                controller: _lasQualificationController,
                isPrefixIcon: false,
                hintText: 'BSC in Computer Science',
              ),
              UIHelper.verticalSpace(12.h),
              Text(
                'Title',
                style: TextFontStyle.headline14w600C141414StyleInter,
              ),
              UIHelper.verticalSpace(4.h),
              CustomTextFormField(
                controller: _titleController,
                isPrefixIcon: false,
                hintText: 'Abc Category',
              ),
              UIHelper.verticalSpace(12.h),
              Text(
                'Industry',
                style: TextFontStyle.headline14w600C141414StyleInter,
              ),
              UIHelper.verticalSpace(4.h),
              CustomTextFormField(
                controller: _industryController,
                isPrefixIcon: false,
                hintText: 'IT/ Software',
              ),
              UIHelper.verticalSpace(12.h),
              Text(
                'Preferred Location',
                style: TextFontStyle.headline14w600C141414StyleInter,
              ),
              UIHelper.verticalSpace(4.h),
              CustomTextFormField(
                controller: _preferLocationController,
                isPrefixIcon: false,
                hintText: 'USA',
              ),
              UIHelper.verticalSpace(12.h),
              Text(
                'End Date',
                style: TextFontStyle.headline14w600C141414StyleInter,
              ),
              UIHelper.verticalSpace(4.h),
              CustomTextFormField(
                controller: _endDateController,
                isPrefixIcon: false,
                hintText: 'Currently Working Here',
              ),
              UIHelper.verticalSpace(20.h),
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
    ));
  }
}
