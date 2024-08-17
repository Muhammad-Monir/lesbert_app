import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lsebert/common_widgets/auth_button.dart';
import 'package:lsebert/common_widgets/custom_text_feild.dart';
import '../../../common_widgets/divider_container.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final ValueNotifier<XFile?> _imageFileNotifier = ValueNotifier<XFile?>(null);
  final _nameController = TextEditingController();
  final _professionController = TextEditingController();
  final _currentPassController = TextEditingController();
  final _newPassController = TextEditingController();
  final _reTypePassController = TextEditingController();

  bool _isNewPass = false;
  bool _isRetypePass = false;
  bool _isCureentPass = false;

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
            'Edit Profile',
            style: TextFontStyle.headline20w600C141414StyleInter,
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const DividerContainer(),
              UIHelper.verticalSpace(20.h),
              DottedBorder(
                color: AppColors.c3B5998,
                borderType: BorderType.Circle,
                dashPattern: const [2, 0, 4],
                child: CircleAvatar(
                  radius: 50.r,
                  backgroundColor: AppColors.cF4F5F7,
                  child: ValueListenableBuilder<XFile?>(
                    valueListenable: _imageFileNotifier,
                    builder: (context, imageFile, child) {
                      if (imageFile != null) {
                        return ClipOval(
                          child: Image.file(
                            File(imageFile.path),
                            fit: BoxFit.cover,
                            height: 100.h,
                          ),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsets.all(26.sp),
                          child: Image.asset(
                            Assets.icons.cameraIcon.path,
                            width: 40.w,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              UIHelper.verticalSpace(10.h),
              Padding(
                padding: EdgeInsets.all(25.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: TextFontStyle.headline14w600C141414StyleInter,
                    ),
                    UIHelper.verticalSpace(8.h),
                    CustomTextFormField(
                      isPrefixIcon: false,
                      hintText: 'Andrew Hussy',
                      controller: _nameController,
                    ),
                    UIHelper.verticalSpace(14.h),
                    Text(
                      'Profession',
                      style: TextFontStyle.headline14w600C141414StyleInter,
                    ),
                    UIHelper.verticalSpace(8.h),
                    CustomTextFormField(
                      isPrefixIcon: false,
                      hintText: 'Professional',
                      controller: _professionController,
                    ),
                  ],
                ),
              ),
              const DividerContainer(),
              Padding(
                padding: EdgeInsets.all(24.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIHelper.verticalSpace(5.h),
                    Text(
                      'Change Your Password',
                      style: TextFontStyle.headline16w600C00000StyleInter,
                    ),
                    UIHelper.verticalSpace(30.h),
                    Text(
                      'Current Password',
                      style: TextFontStyle.headline14w600C141414StyleInter,
                    ),
                    UIHelper.verticalSpace(8.h),
                    CustomTextFormField(
                      obscureText: _isCureentPass,
                      suffixIcon: _isCureentPass == true
                          ? Icons.visibility_off
                          : Icons.visibility,
                      isPrefixIcon: false,
                      onSuffixIconTap: () {
                        setState(() {
                          _isCureentPass = !_isCureentPass;
                        });
                      },
                      hintText: '******************',
                      controller: _currentPassController,
                    ),
                    UIHelper.verticalSpace(14.h),
                    Text(
                      'New Password',
                      style: TextFontStyle.headline14w600C141414StyleInter,
                    ),
                    UIHelper.verticalSpace(8.h),
                    CustomTextFormField(
                      obscureText: _isNewPass,
                      suffixIcon: _isNewPass == true
                          ? Icons.visibility_off
                          : Icons.visibility,
                      isPrefixIcon: false,
                      onSuffixIconTap: () {
                        setState(() {
                          _isNewPass = !_isNewPass;
                        });
                      },
                      hintText: '******************',
                      controller: _newPassController,
                    ),
                    UIHelper.verticalSpace(14.h),
                    Text(
                      'Re-enter New Password',
                      style: TextFontStyle.headline14w600C141414StyleInter,
                    ),
                    UIHelper.verticalSpace(8.h),
                    CustomTextFormField(
                      obscureText: _isRetypePass,
                      suffixIcon: _isRetypePass == true
                          ? Icons.visibility_off
                          : Icons.visibility,
                      isPrefixIcon: false,
                      onSuffixIconTap: () {
                        setState(() {
                          _isRetypePass = !_isRetypePass;
                        });
                      },
                      hintText: '******************',
                      controller: _reTypePassController,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(25.sp),
                child: AuthCustomeButton(
                    name: 'Update',
                    onCallBack: () {},
                    height: 56.h,
                    minWidth: double.infinity,
                    borderRadius: 28.r,
                    color: AppColors.allPrimaryColor,
                    textStyle: TextFontStyle.headline14w600C141414StyleInter
                        .copyWith(color: AppColors.cffffff),
                    context: context),
              ),
              DividerContainer(
                height: 50.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
