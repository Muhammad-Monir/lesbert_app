import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/common_widgets/custom_text_feild.dart';
import 'package:lsebert/helpers/navigation_service.dart';

import '../../../../constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../../common_widgets/auth_button.dart';
import '../../../../common_widgets/custom_dropdown.dart';
import '../../../../networks/api_acess.dart';

class BottomSheetWidget extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController mailController;
  final TextEditingController detailController;
  final TextEditingController typeController;

  const BottomSheetWidget(
      {super.key,
      required this.titleController,
      required this.mailController,
      required this.detailController,
      required this.typeController});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  final List<String> dropDownValue = ["subscription", "technical", "general"];

  String selectedValue = "subscription";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: .57.sh,
      decoration: BoxDecoration(
          color: AppColors.cffffff,
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.sp))),
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Container(
              height: 5.h,
              width: 135.w,
              decoration: BoxDecoration(
                  color: AppColors.allPrimaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(100.sp))),
            ),
          ),
          UIHelper.verticalSpaceMediumLarge,
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: UIHelper.kDefaulutPadding()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Fill Up & Submit Your Ticket",
                  style: TextFontStyle.headline24w700C000000StyleInter
                      .copyWith(fontSize: 16.sp),
                ),
                UIHelper.verticalSpaceMedium,
                CustomTextFormField(
                  controller: widget.titleController,
                  isPrefixIcon: false,
                  labelText: 'Add Your Title',
                ),
                UIHelper.verticalSpaceSmall,
                MyCustomDropdown(
                  dropDownValue: dropDownValue,
                  selectedValue: widget.typeController.text,
                  onTap: (value) {
                    setState(() {
                      widget.typeController.text = value!;
                      selectedValue = value;
                    });
                  },
                  horizonPadding: 15,
                ),
                UIHelper.verticalSpaceSmall,
                CustomTextFormField(
                  isPrefixIcon: false,
                  controller: widget.mailController,
                  labelText: 'Mail Address',
                ),
                UIHelper.verticalSpaceSmall,
                CustomTextFormField(
                  maxline: 5,
                  isPrefixIcon: false,
                  controller: widget.detailController,
                  labelText: 'Details',
                ),
              ],
            ),
          ),

          UIHelper.verticalSpaceMedium,

          AuthCustomeButton(
              name: "Submit Issue",
              onCallBack: () async {
                await postTicketRXObj.postIssues(
                    widget.titleController.text,
                    widget.typeController.text,
                    widget.mailController.text,
                    widget.detailController.text);
                NavigationService.goBack;
              },
              height: .050.sh,
              minWidth: .7.sw,
              borderRadius: 15,
              color: AppColors.allPrimaryColor,
              textStyle: TextFontStyle.headline14w600C141414StyleInter
                  .copyWith(color: AppColors.cffffff),
              context: context)
          // Padding(
          //   padding: EdgeInsets.symmetric(
          //       horizontal: UIHelper.kDefaulutPadding(), vertical: 20.h),
          //   child: CustomButtonWidget(onTap: onTapConfirm, title: "Confirm"),
          // )
        ],
      ),
    );
  }
}
