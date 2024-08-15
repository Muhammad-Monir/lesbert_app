// ignore_for_file: library_private_types_in_public_api
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/common_widgets/custom_text_feild.dart';
import '../../../common_widgets/auth_button.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/ui_helpers.dart';
import 'widget/custom_radio_button.dart';
import 'widget/step1.dart';
import 'widget/step2.dart';
import 'widget/step4.dart';
import 'widget/step5.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final _detailsController1 = TextEditingController();
  final _detailsController2 = TextEditingController();
  int currentStep = 1;
  double progressValue = 0;
  final int totalSteps = 6;
  List<String> items1 = [
    'Full-Time',
    'Part-Time',
    'Project-Based',
    'Temporary',
    'Not Sure'
  ];
  List<String> items2 = ['Option A', 'Option B', 'Option C', 'Option D'];
  int selectValue1 = -1;
  int selectValue2 = -1;

  List<bool> isCheckedList;
  final List<String> titles = [
    'Full-Time',
    'Part-Time',
    'Project-Based',
    'Temporary',
    'Not Sure',
    'Freelance',
    'Internship',
    'Contract',
    'Seasonal',
    'Volunteer'
  ];

  _QuestionScreenState() : isCheckedList = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: currentStep == 1
          ? null
          : AppBar(
              leading: GestureDetector(
                onTap: () {
                  setState(() {
                    if (currentStep > 1) {
                      currentStep -= 1;
                      progressValue = currentStep / totalSteps;
                    }
                  });
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 24.sp,
                  color: AppColors.c000000,
                ),
              ),
              elevation: 0,
              backgroundColor: AppColors.cffffff,
              title: Text(
                'Back To Previous Page',
                style: TextFontStyle.headline18w700C22252DStyleInter,
              ),
            ),
      body: SizedBox(
        height: 900,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (currentStep == 1) ...[
                  UIHelper.verticalSpace(50.w),
                  Text(
                    textAlign: TextAlign.center,
                    'Go through these phases\n to complete the profile\n building process.',
                    style: TextFontStyle.headline24w700C000000StyleInter,
                  ),
                ],
                UIHelper.verticalSpace(50.h),
                // Progress Bar
                SizedBox(
                  height: 50.h, // Ensure it has a fixed height
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.centerLeft,
                    children: [
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 10),
                          overlayShape:
                              const RoundSliderOverlayShape(overlayRadius: 15),
                        ),
                        child: Slider(
                          thumbColor: AppColors.allPrimaryColor,
                          value: progressValue,
                          onChanged: (newValue) {
                            // Prevent slider interaction if you only want it to update via the Next button
                          },
                          min: 0.0,
                          max: 1.0,
                          activeColor: AppColors.allPrimaryColor,
                          inactiveColor: AppColors.cB3BAC5,
                        ),
                      ),
                      Positioned(
                        top: 40.h,
                        left: progressValue *
                            (MediaQuery.of(context).size.width -
                                32.w -
                                28.w), // Adjust for padding and thumb size
                        child: Text(
                          "${(progressValue * 100).round()}%",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                _getStepContent(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          left: 35.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    currentStep = 1;
                    progressValue = 0.02;
                  });
                },
                child: Text(
                  'Skip',
                  style: TextFontStyle.headline20w600C141414StyleInter,
                )),
            GestureDetector(
                onTap: () {
                  setState(() {
                    if (currentStep < totalSteps) {
                      currentStep += 1;
                      progressValue = currentStep / totalSteps;
                    } else {
                      // Handle when the last step is reached, e.g., navigate to another screen
                    }
                  });
                },
                child: Text(
                  currentStep < totalSteps ? "Next" : "Finish",
                  style: TextFontStyle.headline20w600C141414StyleInter,
                )),
          ],
        ),
      ),
    );
  }

  Widget _getStepContent() {
    switch (currentStep) {
      case 1:
        return const Step1Content();
      case 2:
        return const Step2Content();
      case 3:
        return Column(
          children: [
            UIHelper.verticalSpace(37.w),
            Text(
              'What are your Pro-time Preferences?',
              style: TextFontStyle.headline18w500C848484StyleInter
                  .copyWith(color: AppColors.c141414),
            ),
            UIHelper.verticalSpace(27.h),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: items1.length,
              itemBuilder: (context, index) {
                return CustomRadio(
                  value: index,
                  groupValue: selectValue1,
                  onChanged: (value) {
                    setState(() {
                      selectValue1 = value!;
                      log('Selected value 1: $value');
                    });
                  },
                  label: items1[index],
                );
              },
            ),
            UIHelper.verticalSpace(52.w),
            Text(
              'What are your fees for professional services for this Trade?',
              style: TextFontStyle.headline18w500C848484StyleInter
                  .copyWith(color: AppColors.c141414),
            ),
            UIHelper.verticalSpace(27.w),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: items2.length,
              itemBuilder: (context, index) {
                return CustomRadio(
                  value: index,
                  groupValue: selectValue2,
                  onChanged: (value) {
                    setState(() {
                      selectValue2 = value!;
                      log('Selected value 2: $value');
                    });
                  },
                  label: items2[index],
                );
              },
            ),
            UIHelper.verticalSpace(50.h),
          ],
        );
      case 4:
        return Step4Content(
          isCheckedList: isCheckedList,
          title: titles,
          onChanged: (value) {
            setState(() {
              final index = titles.indexOf(value!);
              if (index != -1) {
                isCheckedList[index] = !isCheckedList[index];
              }
            });
          },
        );
      case 5:
        return Step5Content(
          controller: _detailsController1,
        );
      case 6:
        return Step6Content(
          controller: _detailsController2,
        );
      default:
        return const Center(child: Text('Completed'));
    }
  }
}

class Step6Content extends StatelessWidget {
  final TextEditingController controller;
  const Step6Content({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UIHelper.verticalSpace(31.h),
        Text(
          'How do you stay up-to-date with industry regulations and best practices in your chosen trade industry?',
          style: TextFontStyle.headline20w400C141414StyleInter,
        ),
        UIHelper.verticalSpace(14.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AuthCustomeButton(
              borderRadius: 10.r,
              color: AppColors.cB3BAC5,
              context: context,
              height: 50.h,
              minWidth: 150.w,
              name: 'Yes',
              onCallBack: () {
                // NavigationService.navigateToReplacement(Routes.otpVerify);
              },
              textStyle: TextFontStyle.headline18w500C848484StyleInter
                  .copyWith(color: AppColors.cffffff),
            ),
            AuthCustomeButton(
              borderRadius: 10.r,
              color: AppColors.cB3BAC5,
              context: context,
              height: 50.h,
              minWidth: 150.w,
              name: 'No',
              onCallBack: () {
                // NavigationService.navigateToReplacement(Routes.otpVerify);
              },
              textStyle: TextFontStyle.headline18w500C848484StyleInter
                  .copyWith(color: AppColors.cffffff),
            ),
          ],
        ),
        UIHelper.verticalSpace(46.h),
        Text(
          'Do you agree to provide references to Trade Support Pros and agree to a background check? ',
          style: TextFontStyle.headline20w400C141414StyleInter,
        ),
        UIHelper.verticalSpace(22.h),
        CustomTextFormField(
          isPrefixIcon: false,
          hintText: 'Add details',
          controller: controller,
          maxline: 5,
        )
      ],
    );
  }
}
