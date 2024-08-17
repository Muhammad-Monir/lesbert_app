import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lsebert/features/auth/data/rx_login/rx.dart';
import 'package:lsebert/helpers/loading_helper.dart';
import 'package:lsebert/helpers/toast.dart';
import '../../../../common_widgets/auth_button.dart';
import '../../../../common_widgets/custom_text_feild.dart';
import '../../../../common_widgets/or_divider.dart';
import '../../../../common_widgets/social_icon.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../networks/api_acess.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _retypepassController = TextEditingController();
  final ValueNotifier<XFile?> _imageFileNotifier = ValueNotifier<XFile?>(null);
  bool _pass = false;
  bool _confPass = false;
  bool _isCheck = false;

  @override
  void dispose() {
    _imageFileNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            children: [
              UIHelper.verticalSpace(40.h),
              Image.asset(
                Assets.icons.logo.path,
                width: 115.w,
              ),
              UIHelper.verticalSpace(38.h),
              Text(
                'Welcome Back!',
                style: TextFontStyle.headline24w700C000000StyleInter,
              ),
              UIHelper.verticalSpace(2.h),
              Text(
                'Log in to continue.',
                style: TextFontStyle.headline16w400C848484StyleInter,
              ),
              UIHelper.verticalSpace(23.h),
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
             
              UIHelper.verticalSpace(40.h),
              CustomTextFormField(
                controller: _fullNameController,
                isPrefixIcon: true,
                iconpath: Assets.icons.personIcon.path,
                borderRadius: 10.r,
                hintText: 'Full Name',
              ),
              UIHelper.verticalSpace(10.h),
              CustomTextFormField(
                controller: _emailController,
                isPrefixIcon: true,
                iconpath: Assets.icons.emailIcon.path,
                borderRadius: 10.r,
                hintText: 'Email Address',
              ),
              UIHelper.verticalSpace(10.h),
              CustomTextFormField(
                controller: _passController,
                isPrefixIcon: true,
                obscureText: _pass,
                iconpath: Assets.icons.lockIcon.path,
                suffixIcon:
                    _pass == true ? Icons.visibility_off : Icons.visibility,
                onSuffixIconTap: () {
                  setState(() {
                    _pass = !_pass;
                  });
                },
                borderRadius: 10.r,
                hintText: 'Password',
              ),
              UIHelper.verticalSpace(15.h),
              CustomTextFormField(
                controller: _retypepassController,
                isPrefixIcon: true,
                obscureText: _confPass,
                iconpath: Assets.icons.lockIcon.path,
                suffixIcon:
                    _confPass == true ? Icons.visibility_off : Icons.visibility,
                onSuffixIconTap: () {
                  setState(() {
                    _confPass = !_confPass;
                  });
                },
                borderRadius: 10.r,
                hintText: 'Re Type Password',
              ),
              UIHelper.verticalSpace(20.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: _isCheck,
                    onChanged: (value) {
                      setState(() {
                        _isCheck = value ?? false;
                      });
                    },
                  ),
                  SizedBox(
                      width: 15.w), // Add spacing between checkbox and text
                  Expanded(
                    child: Text(
                      "I hereby confirm and accept the Terms of Service and the Privacy Policy. I certify that I am over 18 years of age.",
                      style: TextFontStyle.headline16w400C848484StyleInter,
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpace(37.h),
              AuthCustomeButton(
                borderRadius: 10.r,
                color: AppColors.allPrimaryColor,
                context: context,
                height: 50.h,
                minWidth: double.infinity,
                name: 'Sign Up',
                onCallBack: () async {
                  bool success = await postSignUpRXObj
                      .signup(
                          firstName: _fullNameController.text,
                          email: _emailController.text,
                          password: _passController.text,
                          password_confirmation: _retypepassController.text,
                          role: "pro",
                          termAccepted: _isCheck)
                      .waitingForFutureWithoutBg();
                },
                textStyle: TextFontStyle.headline16w700CffffffStyleInter,
              ),
              UIHelper.verticalSpace(32.h),
              const OrDivider(),
              UIHelper.verticalSpace(24.h),
              SocialIconWidget(
                iconName: Assets.icons.googleIcon.path,
              ),
              UIHelper.verticalSpace(32.h),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Don’t have an account? ',
                  style: TextFontStyle.headline16w400C848484StyleInter,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Log In',
                      style: TextFontStyle.headline16w400C848484StyleInter
                          .copyWith(
                        color: AppColors.c073D71,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          NavigationService.navigateTo(Routes.login);
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
