// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/common_widgets/auth_button.dart';
import 'package:lsebert/helpers/ui_helpers.dart';
import '../../../common_widgets/custom_text_feild.dart';
import '../../../common_widgets/divider_container.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/navigation_service.dart';
import '../../../networks/api_acess.dart';

class PersonalDetailsEditScreen extends StatefulWidget {
  final String phoneNum;
  final String address;

  const PersonalDetailsEditScreen(
      {super.key, required this.phoneNum, required this.address});

  @override
  State<PersonalDetailsEditScreen> createState() =>
      _PersonalDetailsEditScreenState();
}

class _PersonalDetailsEditScreenState extends State<PersonalDetailsEditScreen> {
  // final _nameController = TextEditingController();
  // final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  // final List<String> _genderList = ['Male', 'Female', 'Other'];
  // String? _selectedGender;

  @override
  void initState() {
    _phoneController.text = widget.phoneNum;
    _addressController.text = widget.address;
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
          physics: const BouncingScrollPhysics(),
          child: EditPersonalDataWidget(
            // nameController: _nameController,
            // emailController: _emailController,
            phoneController: _phoneController,
            addressController: _addressController,
            // genderList: _genderList,
            // selectedGender: _selectedGender,
            // onChange: (value) {
            //   setState(() {
            //     _selectedGender = value;
            //   });
            // },
            onTap: () {
              postPersonalInfoEdit.personalInfoEdit(
                  _phoneController.text, _addressController.text);
            },
          ),
        ),
      ),
    );
  }
}

class EditPersonalDataWidget extends StatelessWidget {
  const EditPersonalDataWidget({
    super.key,
    // required this.nameController,
    // required this.emailController,
    required this.phoneController,
    required this.addressController,
    // required this.genderList,
    // required this.selectedGender,
    // required this.onChange,
    required this.onTap,
  });

  // final TextEditingController nameController;
  // final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  // final List<String>? genderList;
  // final String? selectedGender;
  // final Function(String?) onChange;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DividerContainer(),
        // Padding(
        //   padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
        //   child: Row(
        //     children: [
        //       CircleAvatar(
        //         radius: 35.r,
        //         backgroundImage: AssetImage(Assets.images.userImage.path),
        //       ),
        //       UIHelper.horizontalSpace(28.w),
        //       Column(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(
        //             'Andrew Hussy',
        //             style: TextFontStyle.headline16w600C00000StyleInter,
        //           ),
        //           UIHelper.verticalSpace(4.h),
        //           Text(
        //             'Professional',
        //             style: TextFontStyle.headline12w400C9E9E9EStyleInter,
        //           ),
        //         ],
        //       )
        //     ],
        //   ),
        // ),
        const DividerContainer(),
        Padding(
          padding: EdgeInsets.all(25.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   'Personal Details',
              //   style: TextFontStyle.headline16w600C00000StyleInter,
              // ),
              // UIHelper.verticalSpace(30.h),
              // Text(
              //   'Name',
              //   style: TextFontStyle.headline14w600C141414StyleInter,
              // ),
              // UIHelper.verticalSpace(4.h),
              // CustomTextFormField(
              //   controller: nameController,
              //   isPrefixIcon: false,
              //   hintText: 'Enter your name',
              // ),
              // UIHelper.verticalSpace(12.h),
              // Text(
              //   'Email Address',
              //   style: TextFontStyle.headline14w600C141414StyleInter,
              // ),
              // UIHelper.verticalSpace(4.h),
              // CustomTextFormField(
              //   readOnly: true,
              //   controller: emailController,
              //   isPrefixIcon: false,
              //   hintText: 'Enter your email',
              // ),
              UIHelper.verticalSpace(12.h),
              // Text(
              //   'Gender',
              //   style: TextFontStyle.headline14w600C141414StyleInter,
              // ),
              // UIHelper.verticalSpace(4.h),
              // MyCustomDropdown(
              //   verticPadding: 4.h,
              //   horizonPadding: 20.w,
              //   dropDownValue: genderList!,
              //   selectedValue: selectedGender,
              //   onTap: onChange,
              // ),
              // UIHelper.verticalSpace(12.h),
              Text(
                'Phone Number',
                style: TextFontStyle.headline14w600C141414StyleInter,
              ),
              UIHelper.verticalSpace(4.h),
              CustomTextFormField(
                keyboardType: TextInputType.phone,
                controller: phoneController,
                isPrefixIcon: false,
                hintText: 'Enter your phone number',
              ),
              UIHelper.verticalSpace(12.h),
              Text(
                'Address',
                style: TextFontStyle.headline14w600C141414StyleInter,
              ),
              UIHelper.verticalSpace(4.h),
              CustomTextFormField(
                maxline: 4,
                controller: addressController,
                isPrefixIcon: false,
                hintText: 'Enter your address',
              ),
              UIHelper.verticalSpace(20.h),
              AuthCustomeButton(
                name: 'Save & Continue',
                onCallBack: onTap,
                height: 50,
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
      ],
    );
  }
}
