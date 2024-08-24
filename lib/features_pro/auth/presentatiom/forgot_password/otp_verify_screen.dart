import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/features_pro/auth/presentatiom/forgot_password/reset_pass_screen.dart';
import 'package:lsebert/helpers/loading_helper.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/auth_button.dart';
import '../../../../common_widgets/custom_appbar.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../helpers/toast.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../networks/api_acess.dart';
import '../../../../networks/exception_handler/error_response.dart';
import '../../../../provider/email_provider.dart';
import 'reset_pass_screen.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    EmailProvider emailProvider =
        Provider.of<EmailProvider>(context, listen: false);
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'OTP',
      ),
      body: Padding(
        padding: EdgeInsets.all(24.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            UIHelper.verticalSpace(34.h),
            Text(
              'Enter OTP shared in your email address.',
              style: TextFontStyle.headline24w700C000000StyleInter,
            ),
            UIHelper.verticalSpace(24.h),
            Text(
              'OTP Code',
              style: TextFontStyle.headline16w400C848484StyleInter,
            ),
            UIHelper.verticalSpace(5.h),
            PinCodeTextField(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              controller: TextEditingController(),
              keyboardType: TextInputType.number,
              appContext: context,
              length: 4,
              obscureText: false,
              textStyle: TextFontStyle.headline18w700C22252DStyleInter
                  .copyWith(color: AppColors.allPrimaryColor),
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10.r),
                fieldHeight: 65.h,
                fieldWidth: 70.w,
                activeFillColor: AppColors.cffffff,
                inactiveColor: AppColors.cDFE1E6,
                inactiveFillColor: AppColors.cffffff,
                activeColor: AppColors.cDFE1E6,
                selectedColor: AppColors.allPrimaryColor,
                selectedFillColor: AppColors.cffffff,
              ),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              cursorColor: AppColors.cffffff,
              enablePinAutofill: true,
              onCompleted: (v) {},
              onChanged: (value) {
                _otpController.text = value;
                log(value.toString());
              },
              beforeTextPaste: (text) {
                return true;
              },
            ),
            UIHelper.verticalSpace(37.h),
            AuthCustomeButton(
              borderRadius: 10.r,
              color: AppColors.allPrimaryColor,
              context: context,
              height: 50.h,
              minWidth: double.infinity,
              name: 'Verify',
              onCallBack: () async {
                try {
                  String otpCode = _otpController.text;

                  bool success = await verifyOtpRX
                      .verifyOtp(code: otpCode, email: emailProvider.email)
                      .waitingForFutureWithoutBg();
                  if (success) {
                    //   NavigationService.navigateToReplacement(Routes.login);
                    NavigationService.navigateToWithArgs(
                      Routes.resetPass,
                      {"otp": otpCode},
                    );
                  } else {
                    //remove it
                    NavigationService.navigateToWithArgs(
                      Routes.resetPass,
                      {"otp": otpCode},
                    );
                  }
                } catch (error) {
                  log(error.toString());
                  ToastUtil.showShortToast(ResponseMessage.DEFAULT);
                }
              },
              //NavigationService.navigateTo(Routes.resetPass);
              // },
              textStyle: TextFontStyle.headline16w700CffffffStyleInter,
            ),
            UIHelper.verticalSpace(38.h),
            Center(
              child: Text(
                'Don’t receive the code yet?',
                style: TextFontStyle.headline16w400C848484StyleInter,
              ),
            ),
            UIHelper.verticalSpace(6.h),
            Center(
              child: GestureDetector(
                onTap: () async {
                  try {
                    bool success = await resendOtpRxObj
                        .resendOtp(email: emailProvider.email)
                        .waitingForFutureWithoutBg();
                    if (success) {
                      ToastUtil.showShortToast("Otp Sent");
                    } else {
                      ToastUtil.showShortToast("Otp Sent Failed");
                    }
                  } catch (error) {
                    ToastUtil.showShortToast("Otp Sent Failed");
                    log(error.toString());
                    ToastUtil.showShortToast(ResponseMessage.DEFAULT);
                  }
                },
                child: Text(
                  'Resend code',
                  style: TextFontStyle.headline16w700CffffffStyleInter
                      .copyWith(color: AppColors.allPrimaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
