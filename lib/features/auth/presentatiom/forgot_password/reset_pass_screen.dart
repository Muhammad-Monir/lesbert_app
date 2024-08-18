import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/common_widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/auth_button.dart';
import '../../../../common_widgets/custom_text_feild.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../networks/api_acess.dart';
import '../../../../provider/email_provider.dart';

class ResetPassScreen extends StatefulWidget {
  final String otp;
  const ResetPassScreen({super.key, required this.otp});

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  final _passController = TextEditingController();
  final _conPassController = TextEditingController();
  bool _pass = false;
  bool _confPass = false;

  @override
  Widget build(BuildContext context) {
    EmailProvider emailProvider =
        Provider.of<EmailProvider>(context, listen: false);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Reset Password'),
      body: Padding(
        padding: EdgeInsets.all(24.sp),
        child: Column(
          children: [
            UIHelper.verticalSpace(34.h),
            Text(
              'Enter OTP shared in your email address.',
              style: TextFontStyle.headline24w700C000000StyleInter,
            ),
            UIHelper.verticalSpace(20.h),
            CustomTextFormField(
              controller: _passController,
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
              hintText: 'New Password',
            ),
            UIHelper.verticalSpace(14.h),
            CustomTextFormField(
              controller: _conPassController,
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
              hintText: 'Re-Type Password',
            ),
            UIHelper.verticalSpace(30.h),
            AuthCustomeButton(
              borderRadius: 10.r,
              color: AppColors.allPrimaryColor,
              context: context,
              height: 50.h,
              minWidth: double.infinity,
              name: 'Save & Continue',
              onCallBack: () async {
                postForgertPwRXObj.postForgetPasswordData(emailProvider.email,
                    _passController.text, _conPassController.text, widget.otp);
                NavigationService.navigateToReplacement(Routes.otpSuccess);
              },
              textStyle: TextFontStyle.headline16w700CffffffStyleInter,
            ),
          ],
        ),
      ),
    );
  }
}
