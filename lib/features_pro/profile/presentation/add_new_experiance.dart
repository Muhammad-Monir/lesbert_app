import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/common_widgets/auth_button.dart';
import '../../../common_widgets/custom_text_feild.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';
import '../../../networks/api_acess.dart';

class AddNewExperiance extends StatefulWidget {
  const AddNewExperiance({super.key});

  @override
  State<AddNewExperiance> createState() => _AddNewExperianceState();
}

class _AddNewExperianceState extends State<AddNewExperiance> {
  final _companyName = TextEditingController();
  final _designation = TextEditingController();
  final _employeType = TextEditingController();
  final _startDate = TextEditingController();
  final _endDate = TextEditingController();
  final _location = TextEditingController();

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
              NavigationService.goBack;
            },
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.c000000,
            ),
          ),
          title: Text(
            'Add New Experiance',
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
                  'Company Name',
                  style: TextFontStyle.headline14w600C141414StyleInter,
                ),
                UIHelper.verticalSpace(4.h),
                CustomTextFormField(
                  maxline: 1,
                  controller: _companyName,
                  isPrefixIcon: false,
                  hintText: 'Company Name',
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
                  hintText: 'Designation',
                ),
                UIHelper.verticalSpace(12.h),
                Text(
                  'Employee Type',
                  style: TextFontStyle.headline14w600C141414StyleInter,
                ),
                UIHelper.verticalSpace(4.h),
                CustomTextFormField(
                  maxline: 1,
                  controller: _employeType,
                  isPrefixIcon: false,
                  hintText: 'Employee Type',
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
                  hintText: 'Start Date',
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
                  hintText: 'End Date',
                ),
                UIHelper.verticalSpace(12.h),
                Text(
                  'Job Location',
                  style: TextFontStyle.headline14w600C141414StyleInter,
                ),
                UIHelper.verticalSpace(4.h),
                CustomTextFormField(
                  maxline: 1,
                  controller: _location,
                  isPrefixIcon: false,
                  hintText: 'Job Location',
                ),
                UIHelper.verticalSpace(30.h),
                AuthCustomeButton(
                    name: 'Add Experiance',
                    onCallBack: () async {
                      await postAddNewExperiance.postAddNewExperiance(
                          _companyName.text,
                          _designation.text,
                          _startDate.text,
                          _endDate.text,
                          _location.text);
                    },
                    height: 56.h,
                    minWidth: double.infinity,
                    borderRadius: 15.r,
                    color: AppColors.allPrimaryColor,
                    textStyle: TextFontStyle.headline16w600CFFFFFFFFStyleintere,
                    context: context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _companyName.dispose();
    _designation.dispose();
    _employeType.dispose();
    _startDate.dispose();
    _endDate.dispose();
    _location.dispose();
  }
}
