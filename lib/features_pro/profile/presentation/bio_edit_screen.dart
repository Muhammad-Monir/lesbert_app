import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/networks/api_acess.dart';

import '../../../common_widgets/auth_button.dart';
import '../../../common_widgets/custom_text_feild.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';

class BioEditScreen extends StatefulWidget {
  final String? bioDescription;
  final String? curntCompany;
  final String? designation;
  final String? industry;
  final String? preferLocation;
  const BioEditScreen(
      {super.key,
      this.bioDescription,
      this.curntCompany,
      this.designation,
      this.industry,
      this.preferLocation});

  @override
  State<BioEditScreen> createState() => _BioEditScreenState();
}

class _BioEditScreenState extends State<BioEditScreen> {
  final _bioDesController = TextEditingController();
  final _curentCompanyController = TextEditingController();
  final _designationController = TextEditingController();
  final _industryController = TextEditingController();
  final _locationController = TextEditingController();
  //final _endDateController = TextEditingController();

  @override
  void initState() {
    _bioDesController.text = widget.bioDescription!;
    _curentCompanyController.text = widget.curntCompany!;
    _designationController.text = widget.designation!;
    _industryController.text = widget.industry!;
    _locationController.text = widget.preferLocation!;
    super.initState();
  }

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
          'Edit Your Bio',
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
                'Current Company',
                style: TextFontStyle.headline14w600C141414StyleInter,
              ),
              UIHelper.verticalSpace(4.h),
              CustomTextFormField(
                controller: _curentCompanyController,
                isPrefixIcon: false,
                hintText: 'Current Company',
              ),
              UIHelper.verticalSpace(12.h),
              Text(
                'Designation',
                style: TextFontStyle.headline14w600C141414StyleInter,
              ),
              UIHelper.verticalSpace(4.h),
              CustomTextFormField(
                controller: _designationController,
                isPrefixIcon: false,
                hintText: 'Designation',
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
                controller: _locationController,
                isPrefixIcon: false,
                hintText: 'Preferred Location',
              ),
              // UIHelper.verticalSpace(12.h),
              // Text(
              //   'End Date',
              //   style: TextFontStyle.headline14w600C141414StyleInter,
              // ),
              // UIHelper.verticalSpace(4.h),
              // CustomTextFormField(
              //   controller: _endDateController,
              //   isPrefixIcon: false,
              //   hintText: 'Currently Working Here',
              // ),
              UIHelper.verticalSpace(20.h),
              AuthCustomeButton(
                name: 'Save & Continue',
                onCallBack: () async {
                  await postBioUpdateRxObj.postBioUpdate(
                      _bioDesController.text,
                      _curentCompanyController.text,
                      _designationController.text,
                      _locationController.text,
                      _industryController.text);
                },
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
