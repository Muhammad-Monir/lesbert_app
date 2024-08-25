import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/common_widgets/custom_text_feild.dart';
import 'package:lsebert/constants/text_font_style.dart';
import 'package:lsebert/helpers/navigation_service.dart';
import '../../../../common_widgets/auth_button.dart';
import '../../../../common_widgets/or_divider.dart';
import '../../../../common_widgets/social_icon.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../networks/api_acess.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = false;
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UIHelper.verticalSpace(80.h),
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
              CustomTextFormField(
                controller: _emailController,
                isPrefixIcon: true,
                iconpath: Assets.icons.emailIcon.path,
                borderRadius: 10.r,
                hintText: 'Email Address',
              ),
              UIHelper.verticalSpace(16.h),
              CustomTextFormField(
                controller: _passController,
                isPrefixIcon: true,
                obscureText: _isObscure,
                iconpath: Assets.icons.lockIcon.path,
                suffixIcon: _isObscure == true
                    ? Icons.visibility_off
                    : Icons.visibility,
                onSuffixIconTap: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                borderRadius: 10.r,
                hintText: 'Password',
              ),
              UIHelper.verticalSpace(8.h),
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      NavigationService.navigateTo(Routes.forgotPass);
                    },
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.c3B5998,
                        decorationThickness: 1.5,
                        color: AppColors.c3B5998,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpace(32.h),
              AuthCustomeButton(
                borderRadius: 10.r,
                color: AppColors.allPrimaryColor,
                context: context,
                height: 50.h,
                minWidth: double.infinity,
                name: 'Sign In',
                onCallBack: () async {
                  getLoginRXObj.login(
                      _emailController.text, _passController.text);

                  NavigationService.navigateToReplacement(Routes.loading);
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
                      text: 'Sign Up',
                      style: TextFontStyle.headline16w400C848484StyleInter
                          .copyWith(
                        color: AppColors.c073D71,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          NavigationService.navigateTo(Routes.role);
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
