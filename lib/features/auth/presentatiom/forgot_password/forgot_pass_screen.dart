import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common_widgets/auth_button.dart';
import '../../../../common_widgets/custom_appbar.dart';
import '../../../../common_widgets/custom_text_feild.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/navigation_service.dart';
import '../../../../helpers/ui_helpers.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
            CustomTextFormField(
              controller: _emailController,
              isPrefixIcon: true,
              iconpath: Assets.icons.emailIcon.path,
              borderRadius: 10.r,
              hintText: 'Email Address',
            ),
            UIHelper.verticalSpace(37.h),
            AuthCustomeButton(
              borderRadius: 10.r,
              color: AppColors.allPrimaryColor,
              context: context,
              height: 50.h,
              minWidth: double.infinity,
              name: 'Submit',
              onCallBack: () {
                NavigationService.navigateTo(Routes.otpVerify);
              },
              textStyle: TextFontStyle.headline16w700CffffffStyleInter,
            ),
          ],
        ),
      ),
    );
  }
}
