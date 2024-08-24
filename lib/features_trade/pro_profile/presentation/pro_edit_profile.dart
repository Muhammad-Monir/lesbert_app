import 'dart:developer';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/common_widgets/auth_button.dart';
import '../../../common_widgets/custom_text_feild.dart';
import '../../../common_widgets/image_picker_widget.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';

class ProEditProfileScreen extends StatefulWidget {
  const ProEditProfileScreen({super.key});

  @override
  State<ProEditProfileScreen> createState() => _ProEditProfileScreenState();
}

class _ProEditProfileScreenState extends State<ProEditProfileScreen> {
  final _imageFileNotifier = ValueNotifier<String?>(null);

  final _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.h,
        elevation: 0,
        backgroundColor: AppColors.allPrimaryColor,
        leading: GestureDetector(
          onTap: () {
            NavigationService.goBack();
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.cffffff,
          ),
        ),
        title: Text(
          'Edit Personal Details',
          style: TextFontStyle.headline20w600C141414StyleInter
              .copyWith(color: AppColors.cffffff),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    _showImageSourceDialog(context);
                  },
                  child: DottedBorder(
                    color: AppColors.c3B5998,
                    borderType: BorderType.Circle,
                    dashPattern: const [2, 0, 4],
                    child: CircleAvatar(
                      radius: 50.r,
                      backgroundColor: AppColors.cF4F5F7,
                      child: ValueListenableBuilder<String?>(
                        valueListenable: _imageFileNotifier,
                        builder: (context, imagePath, child) {
                          if (imagePath != null) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(50.r),
                              child: Image.file(
                                File(imagePath),
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
                ),
              ),
              
              UIHelper.verticalSpace(20.h),
              Text(
                'Name',
                style: TextFontStyle.headline14w600C141414StyleInter,
              ),
              UIHelper.verticalSpace(4.h),
              CustomTextFormField(
                controller: _nameController,
                isPrefixIcon: false,
                hintText: 'Enter your name',
              ),
              UIHelper.verticalSpace(16.h),
              Text(
                'Email Address',
                style: TextFontStyle.headline14w600C141414StyleInter,
              ),
              UIHelper.verticalSpace(4.h),
              CustomTextFormField(
                controller: _nameController,
                isPrefixIcon: false,
                hintText: 'Enter your email',
              ),
              UIHelper.verticalSpace(16.h),
              Text(
                'Phone Number',
                style: TextFontStyle.headline14w600C141414StyleInter,
              ),
              UIHelper.verticalSpace(4.h),
              CustomTextFormField(
                controller: _nameController,
                isPrefixIcon: false,
                hintText: 'Enter your phone number',
              ),
              UIHelper.verticalSpace(16.h),
              Text(
                'Address',
                style: TextFontStyle.headline14w600C141414StyleInter,
              ),
              UIHelper.verticalSpace(4.h),
              CustomTextFormField(
                maxline: 3,
                controller: _nameController,
                isPrefixIcon: false,
                hintText: 'Enter your address',
              ),
              UIHelper.verticalSpace(16.h),
              Text(
                'About you',
                style: TextFontStyle.headline14w600C141414StyleInter,
              ),
              UIHelper.verticalSpace(4.h),
              CustomTextFormField(
                maxline: 3,
                controller: _nameController,
                isPrefixIcon: false,
                hintText: 'Write about you.....',
              ),
              UIHelper.verticalSpace(40.h),
              AuthCustomeButton(
                  name: 'Update Profile',
                  onCallBack: () {
                    log('Image Source : ${_imageFileNotifier}');
                  },
                  height: 56.h,
                  minWidth: double.infinity,
                  borderRadius: 28.r,
                  color: AppColors.allPrimaryColor,
                  textStyle: TextFontStyle.headline16w600CFFFFFFFFStyleintere,
                  context: context),
            ],
          ),
        ),
      ),
    );
  }

  void _showImageSourceDialog(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => ImageSourceDialog(
        onImageSelected: (String imagePath) {
          _imageFileNotifier.value = imagePath;
        },
      ),
    );
  }
}
