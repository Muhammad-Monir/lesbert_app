import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/auth_button.dart';
import '../../../common_widgets/custom_text_feild.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';
import '../../../networks/api_acess.dart';

class OtherDetailsEditScreen extends StatefulWidget {
  final String? kkeySkill;
  final String? language;
  const OtherDetailsEditScreen(
      {super.key, required this.kkeySkill, required this.language});

  @override
  State<OtherDetailsEditScreen> createState() => _OtherDetailsEditScreenState();
}

class _OtherDetailsEditScreenState extends State<OtherDetailsEditScreen> {
  final _skillsController = TextEditingController();
  final _languageController = TextEditingController();

  @override
  void initState() {
    _skillsController.text = widget.kkeySkill!;
    _languageController.text = widget.language!;
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
            NavigationService.goBack;
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.c000000,
          ),
        ),
        title: Text(
          'Other Details',
          style: TextFontStyle.headline20w600C141414StyleInter,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Key Skills',
                style: TextFontStyle.headline14w600C141414StyleInter,
              ),
              UIHelper.verticalSpace(4.h),
              CustomTextFormField(
                maxline: 1,
                controller: _skillsController,
                isPrefixIcon: false,
                hintText: 'Programming, Coding,',
              ),
              UIHelper.verticalSpace(12.h),
              Text(
                'Language Proficiency',
                style: TextFontStyle.headline14w600C141414StyleInter,
              ),
              UIHelper.verticalSpace(4.h),
              CustomTextFormField(
                maxline: 1,
                controller: _languageController,
                isPrefixIcon: false,
                hintText: 'Bangla, English, Hindi',
              ),
              UIHelper.verticalSpace(30.h),
              AuthCustomeButton(
                name: 'Save & Continue',
                onCallBack: () async {
                  await postOtherDetailsEdit.postOtherDetails(
                      _skillsController.text, _languageController.text);
                },
                height: 50.h,
                minWidth: double.infinity,
                borderRadius: 25.r,
                color: AppColors.allPrimaryColor,
                textStyle: TextFontStyle.headline14w600C141414StyleInter
                    .copyWith(color: AppColors.cffffff),
                context: context,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
