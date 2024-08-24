import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/common_widgets/auth_button.dart';
import 'package:lsebert/helpers/toast.dart';

import '../../../common_widgets/custom_text_feild.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';
import '../../../networks/api_acess.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  final _currentPassController = TextEditingController();
  final _newPassController = TextEditingController();
  final _reTypePassController = TextEditingController();

  bool _isNewPass = false;
  bool _isRetypePass = false;
  bool _isCureentPass = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Security',
          style: TextFontStyle.headline20w600C141414StyleInter,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
              UIHelper.verticalSpace(80.h),
              AuthCustomeButton(
                  name: 'Save Changes',
                  onCallBack: () {
                    if (_newPassController.text != _reTypePassController.text) {
                      ToastUtil.showLongToast('Password Not Matched');
                    } else {
                      postChangePass.changePass(_currentPassController.text,
                          _newPassController.text, _reTypePassController.text);
                    }
                  },
                  height: 50.h,
                  minWidth: double.infinity,
                  borderRadius: 25.r,
                  color: AppColors.allPrimaryColor,
                  textStyle: TextFontStyle.headline16w600CFFFFFFFFStyleintere,
                  context: context)
            ],
          ),
        ),
      ),
    );
  }
}
