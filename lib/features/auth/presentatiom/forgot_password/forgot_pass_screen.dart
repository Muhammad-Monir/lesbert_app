import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/helpers/loading_helper.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/auth_button.dart';
import '../../../../common_widgets/custom_appbar.dart';
import '../../../../common_widgets/custom_text_feild.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../helpers/toast.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../networks/api_acess.dart';
import '../../../../networks/exception_handler/error_response.dart';
import '../../../../provider/email_provider.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    EmailProvider emailProvider =
        Provider.of<EmailProvider>(context, listen: false);
    return Scaffold(
      appBar: const CustomAppBar(
        showBackButton: true,
        title: 'Forgot Password',
      ),
      body: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          children: [
            UIHelper.verticalSpace(38.h),
            Text(
              'Enter your connected email.',
              style: TextFontStyle.headline24w700C000000StyleInter,
            ),
            UIHelper.verticalSpace(30.h),
            Form(
              key: _formKey,
              child: CustomTextFormField(
                controller: _emailController,
                isPrefixIcon: true,
                iconpath: Assets.icons.emailIcon.path,
                borderRadius: 10.r,
                hintText: 'Email Address',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email Can\'t be empty';
                  }
                  return null;
                },
              ),
            ),
            UIHelper.verticalSpace(37.h),
            AuthCustomeButton(
              borderRadius: 10.r,
              color: AppColors.allPrimaryColor,
              context: context,
              height: 50.h,
              minWidth: double.infinity,
              name: 'Submit',
              onCallBack: () async {
                try {
                  if (_formKey.currentState!.validate()) {
                    await postForgetEmailRXObj
                        .postForgetEmail(email: _emailController.text)
                        .waitingForFutureWithoutBg()
                        .then(
                      (value) {
                        if (value) {
                          emailProvider.changeemail(_emailController.text);
                          NavigationService.navigateToWithArgs(
                              Routes.otpVerify, {"isrest": true});
                        }
                      },
                    );
                  }
                } catch (error) {
                  log(error.toString());
                  ToastUtil.showShortToast(ResponseMessage.DEFAULT);
                }
              },
              textStyle: TextFontStyle.headline16w700CffffffStyleInter,
            ),
          ],
        ),
      ),
    );
  }
}
