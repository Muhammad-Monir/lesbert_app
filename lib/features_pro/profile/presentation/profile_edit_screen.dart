import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/common_widgets/auth_button.dart';
import 'package:lsebert/common_widgets/custom_text_feild.dart';
import 'package:lsebert/helpers/loading_helper.dart';
import '../../../common_widgets/divider_container.dart';
import '../../../common_widgets/image_picker_widget.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';
import '../../../networks/api_acess.dart';

class ProfileEditScreen extends StatefulWidget {
  final String name;
  final String email;
  final String? image;
  final String proffession;
  const ProfileEditScreen({
    super.key,
    required this.name,
    required this.email,
    this.image,
    required this.proffession,
  });

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final _imageFileNotifier = ValueNotifier<String?>(null);
  final _nameController = TextEditingController();
  final _professionController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.name.toString();
    _professionController.text = widget.proffession.toString();
    _emailController.text = widget.email.toString();
    // _imageFileNotifier = ValueNotifier<String?>(widget.image);
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
                padding: EdgeInsets.all(25.sp),
                child: AuthCustomeButton(
                    name: 'Update',
                    onCallBack: () async {
                      File? file = _imageFileNotifier.value != null
                          ? File(_imageFileNotifier.value!)
                          : null;
                      await postProEditProfile
                          .postEditProProfile(_nameController.text, file,
                              _professionController.text)
                          .waitingForFuture();
                    },
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
