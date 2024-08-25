import 'dart:developer';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/common_widgets/auth_button.dart';
import 'package:lsebert/features/auth/presentatiom/forgot_password/otp_verify_screen.dart';
import 'package:lsebert/helpers/all_routes.dart';
import 'package:lsebert/helpers/loading_helper.dart';
import '../../../common_widgets/custom_text_feild.dart';
import '../../../common_widgets/image_picker_widget.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';
import '../../../networks/api_acess.dart';

class TradeEditProfileScreen extends StatefulWidget {
  final String? name;
  final String? email;
  final String? phoneNum;
  final String? address;
  final String? about;
  final String? image;
  const TradeEditProfileScreen(
      {super.key,
      this.name,
      this.email,
      this.phoneNum,
      this.about,
      this.address,
      this.image});

  @override
  State<TradeEditProfileScreen> createState() => _TradeEditProfileScreenState();
}

class _TradeEditProfileScreenState extends State<TradeEditProfileScreen> {
  final _imageFileNotifier = ValueNotifier<File?>(null);
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _aboutController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.name ?? 'N/A';
    _emailController.text = widget.email ?? '';
    _phoneController.text = widget.phoneNum ?? 'N/A';
    _addressController.text = widget.address ?? 'N/A';
    _aboutController.text = widget.about ?? 'N/A';
    super.initState();
  }

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
                      child: ValueListenableBuilder<File?>(
                        valueListenable: _imageFileNotifier,
                        builder: (context, imagePath, child) {
                          if (imagePath != null) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(50.r),
                              child: Image.file(
                                File(imagePath.path),
                                fit: BoxFit.cover,
                                height: 100.h,
                              ),
                            );
                          } else {
                            if (widget.image != null) {
                              return Padding(
                                padding: EdgeInsets.all(0.sp),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30.r),
                                  child: CircleAvatar(
                                    radius: 50.r,
                                    backgroundImage:
                                        NetworkImage(widget.image ?? ''),
                                  ),
                                ),
                              );
                            } else {
                              return Padding(
                                padding: EdgeInsets.all(26.sp),
                                child: CircleAvatar(
                                  radius: 35.r,
                                  backgroundImage:
                                      AssetImage(Assets.icons.cameraIcon.path),
                                ),
                              );
                            }
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
                readOnly: true,
                controller: _emailController,
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
                controller: _phoneController,
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
                controller: _addressController,
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
                maxline: 6,
                controller: _aboutController,
                isPrefixIcon: false,
                hintText: 'Write about you.....',
              ),
              UIHelper.verticalSpace(40.h),
              AuthCustomeButton(
                  name: 'Update Profile',
                  onCallBack: () async {
                    File file = File(_imageFileNotifier.value!.path);
                    await postTradeEditRXObj
                        .postTradeEditData(
                            _nameController.text,
                            file,
                            _phoneController.text,
                            _addressController.text,
                            _aboutController.text)
                        .waitingForFuture();
                    await getTradeProfileRXObj.fetchTradeProfileData();

                    log('Image Source : ${_imageFileNotifier}');
                    log('Image path : $file');
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
          File file = File(imagePath);
          _imageFileNotifier.value = file;
        },
      ),
    );
  }
}
