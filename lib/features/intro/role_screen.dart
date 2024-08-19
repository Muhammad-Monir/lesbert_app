import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/common_widgets/auth_button.dart';
import 'package:lsebert/common_widgets/custom_dropdown.dart';
import 'package:lsebert/helpers/navigation_service.dart';
import 'package:lsebert/helpers/toast.dart';

import '../../constants/text_font_style.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../helpers/all_routes.dart';
import '../../helpers/ui_helpers.dart';
import '../../networks/api_acess.dart';

class RoleScreen extends StatefulWidget {
  const RoleScreen({super.key});

  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  String? _selectedValue;
  List<String>? _dropDownList;

  bool _isTrade = false;
  bool _isPro = false;

  String? selectedProfileType;

  @override
  void initState() {
    getOccupationQuestionRXObj.fetchOccupationQuestionData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UIHelper.verticalSpace(100.h),
              Image.asset(
                Assets.icons.logo.path,
                width: 169.w,
              ),
              UIHelper.verticalSpace(50.h),
              Text(
                textAlign: TextAlign.center,
                'What do you want to \njoin as?',
                style: TextFontStyle.headline16w700CffffffStyleInter
                    .copyWith(color: AppColors.c000000),
              ),
              UIHelper.verticalSpace(8.h),
              Text(
                  textAlign: TextAlign.center,
                  'Please choose an option',
                  style: TextFontStyle.headline16w400C848484StyleInter),
              UIHelper.verticalSpace(35.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AuthCustomeButton(
                      name: 'Trader',
                      onCallBack: () {
                        setState(() {
                          _isTrade = true;
                          _isPro = false;
                          selectedProfileType = 'trade';
                        });
                      },
                      height: 50.h,
                      minWidth: 150.w,
                      borderRadius: 10.r,
                      color: _isTrade == true
                          ? AppColors.allPrimaryColor
                          : AppColors.cF4F5F7,
                      textStyle: TextFontStyle.headline18w500C848484StyleInter
                          .copyWith(
                              color: _isTrade == true
                                  ? AppColors.cffffff
                                  : AppColors.allPrimaryColor),
                      context: context),
                  AuthCustomeButton(
                      name: 'Pro',
                      onCallBack: () {
                        setState(() {
                          _isPro = true;
                          _isTrade = false;
                          selectedProfileType = 'pro';
                        });
                      },
                      height: 50.h,
                      minWidth: 150.w,
                      borderRadius: 10.r,
                      color: _isPro == true
                          ? AppColors.allPrimaryColor
                          : AppColors.cF4F5F7,
                      textStyle: TextFontStyle.headline18w500C848484StyleInter
                          .copyWith(
                              color: _isPro == true
                                  ? AppColors.cffffff
                                  : AppColors.allPrimaryColor),
                      context: context),
                ],
              ),
              UIHelper.verticalSpace(30.h),
              StreamBuilder(
                  stream: getOccupationQuestionRXObj.dataFetcher,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Map? data = snapshot.data;
                      _dropDownList = List<String>.from(data?['data']
                              ['question']['options']
                          .map((option) => option['option_text']));
                      return MyCustomDropdown(
                        verticPadding: 5.h,
                        horizonPadding: 10.w,
                        hinttext: 'What is your primary tarde?',
                        selectedValue: _selectedValue,
                        dropDownValue: _dropDownList!,
                        onTap: (value) {
                          setState(() {
                            _selectedValue = value;
                            log("Selected Value is : $_selectedValue");
                          });
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              UIHelper.verticalSpace(180.h),
              AuthCustomeButton(
                  name: 'Next',
                  onCallBack: () {
                    if (selectedProfileType == null) {
                      ToastUtil.showLongToast('Please select your trade!');
                    } else if (_selectedValue == null) {
                      ToastUtil.showLongToast("What's your primary Trade?");
                    } else {
                      NavigationService.navigateToWithArgs(Routes.signup, {
                        'trade': selectedProfileType,
                        'tradeQuestion': _selectedValue,
                      });
                      log("Selected Type: $selectedProfileType");
                      log("Drop down Value: $_selectedValue");
                    }
                  },
                  height: 50.h,
                  minWidth: double.infinity,
                  borderRadius: 10.r,
                  color: AppColors.allPrimaryColor,
                  textStyle: TextFontStyle.headline18w500C848484StyleInter
                      .copyWith(color: AppColors.cffffff),
                  context: context),
            ],
          ),
        ),
      ),
    );
  }
}
