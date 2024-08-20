import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/common_widgets/auth_button.dart';
import 'package:lsebert/helpers/ui_helpers.dart';

import '../../../common_widgets/custom_switch.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/navigation_service.dart';

class HelpSupport extends StatefulWidget {
  const HelpSupport({super.key});

  @override
  State<HelpSupport> createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
  bool _enable = false;
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
            'Payment History',
            style: TextFontStyle.headline20w600C141414StyleInter,
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 25.sp, left: 25.sp, right: 25.sp),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: AppColors.cE7ECF1),
          child: Column(
            children: [
              Center(
                child: CustomSwitch(
                  value: _enable,
                  onChanged: (bool val) {
                    setState(() {
                      _enable = val;
                    });
                  },
                ),
              ),
              UIHelper.verticalSpaceMedium,
              SizedBox(
                height: .69.sh,
                //    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: ListView.separated(
                  //   physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      UIHelper.verticalSpace(10),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) => SupportCard(
                    title: 'I want to connect my paypal account.',
                    description:
                        "Lorem ipsum dolor sit amet consectetur. Ac nullam lorem vel risus sed hendrerit.",
                    date: "Fri, Mar 20, 2020, 02:40 PM ",
                    type: _enable,
                  ),
                ),
              ),
              UIHelper.verticalSpaceSmall,
              AuthCustomeButton(
                  name: "Open New Ticket",
                  onCallBack: () {},
                  height: .050.sh,
                  minWidth: .7.sw,
                  borderRadius: 15,
                  color: AppColors.allPrimaryColor,
                  textStyle: TextFontStyle.headline14w600C141414StyleInter
                      .copyWith(color: AppColors.cffffff),
                  context: context)
            ],
          ),
        ));
  }
}

class SupportCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final bool type;
  const SupportCard({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: .22.sh,
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColors.cffffff, borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //UIHelper.verticalSpaceMedium,
          Text(
            title,
            style: TextFontStyle.headline16w600C00000StyleInter
                .copyWith(color: AppColors.c000000),
          ),
          UIHelper.verticalSpaceMedium,
          Text(
            description,
            style: TextFontStyle.headline12w400C9E9E9EStyleInter
                .copyWith(color: AppColors.c141414),
          ),
          UIHelper.verticalSpaceSmall,
          Spacer(),
          UIHelper.customDivider(width: .8.sw),
          // UIHelper.verticalSpaceMedium,
          // Text(
          //   "Cameron Williamson",
          //   style: TextFontStyle.headline16w600C00000StyleInter
          //       .copyWith(color: AppColors.c000000),
          // ),
          UIHelper.verticalSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: TextFontStyle.headline12w400C9E9E9EStyleInter
                    .copyWith(color: AppColors.c5A5C5F),
              ),
              Text(
                type ? "Resolved" : "Pending",
                style: !type
                    ? TextFontStyle.headline12w400C9E9E9EStyleInter
                        .copyWith(color: AppColors.c9E9E9E)
                    : TextFontStyle.headline12w700C9E9E9EStyleInter
                        .copyWith(color: AppColors.allPrimaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
