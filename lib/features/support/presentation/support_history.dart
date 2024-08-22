import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/auth_button.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';
import 'widget/replay_bottom_sheet.dart';
import 'widget/support_bottom_sheet.dart';

class SupportHistory extends StatefulWidget {
  const SupportHistory({super.key});

  @override
  State<SupportHistory> createState() => _SupportHistoryState();
}

class _SupportHistoryState extends State<SupportHistory> {
  @override
  final TextEditingController _detailController = TextEditingController();
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
            Container(
              height: .13.sh,
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: AppColors.cffffff,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "I want to connect my paypal account.",
                    style: TextFontStyle.headline16w600C00000StyleInter
                        .copyWith(color: AppColors.c000000),
                  ),
                  const Spacer(),
                  UIHelper.customDivider(width: .8.sw),
                  UIHelper.verticalSpaceSmall,
                  Text(
                    "Cameron Williamson",
                    style: TextFontStyle.headline16w600C00000StyleInter
                        .copyWith(color: AppColors.c000000),
                  ),
                  Text("Resolved",
                      style: TextFontStyle.headline12w400C9E9E9EStyleInter
                          .copyWith(color: AppColors.c9E9E9E)),
                ],
              ),
            ),
            UIHelper.verticalSpaceMedium,
            Flexible(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                    color: true ? AppColors.allPrimaryColor : AppColors.cffffff,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Hello,Lorem ipsum dolor sit amet consectetur. Cursus tortor bibendum blandit risus. Vitae etiam leo volutpat vestibulum massa eget eu massa. Magna sit lorem elementum posuere semper. Molestie vulputate rhoncus dui id a venenatis pellentesque. Magna sit lorem elementum posuere semper. Molestie vulputate rhoncus dui id a venenatis pellentesque.  Molestie vulputate rhoncus dui id a venenatis pellentesque.Molestie vulputate rhoncus dui id a venenatis pellentesque.  Molestie vulputate rhoncus dui id a venenatis pellentesque.",
                      style: TextFontStyle.headline12w400C9E9E9EStyleInter
                          .copyWith(color: AppColors.c141414),
                    ),
                    UIHelper.verticalSpaceSmall,
                    UIHelper.customDivider(width: .8.sw),
                    UIHelper.verticalSpaceSmall,
                    Text(
                      "Cameron Williamson",
                      style: TextFontStyle.headline16w600C00000StyleInter
                          .copyWith(color: AppColors.c000000),
                    ),
                    Text(
                      "Fri, Mar 20, 2020, 02:40 PM ",
                      style: TextFontStyle.headline12w400C9E9E9EStyleInter
                          .copyWith(color: AppColors.c5A5C5F),
                    ),
                    UIHelper.verticalSpaceSmall,
                  ],
                ),
              ),
            ),
            const Spacer(),
            AuthCustomeButton(
                name: "Replay",
                onCallBack: () {
                  showBottomNav();
                },
                height: .050.sh,
                minWidth: .7.sw,
                borderRadius: 15,
                color: AppColors.allPrimaryColor,
                textStyle: TextFontStyle.headline14w600C141414StyleInter
                    .copyWith(color: AppColors.cffffff),
                context: context),
          ],
        ),
      ),
    );
  }

  void showBottomNav() {
    showModalBottomSheet(
      // ignore: use_build_context_synchronously
      elevation: 0,
      // ignore: use_build_context_synchronously
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      isDismissible: true,
      isScrollControlled: true, // Allow the bottom sheet to be expanded
      builder: (builder) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ), // Adjust the padding for the keyboard
          child: ReplaySheetWidget(
            detailController: _detailController,
          ),
        );
      },
    );
  }
}
