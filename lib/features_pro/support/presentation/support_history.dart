// ignore_for_file: override_on_non_overriding_member, annotate_overrides, dead_code

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/auth_button.dart';
import '../../../common_widgets/loading_indicators.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/dateuitl.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';
import '../../../networks/api_acess.dart';
import 'widget/replay_bottom_sheet.dart';

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
            NavigationService.goBack;
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
        child: StreamBuilder(
            stream: getIssueDetailsRXObj.dataFetcher,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map data = snapshot.data["data"];
                List list = data["replies"];
                if (list.isNotEmpty) {
                  return Column(
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
                              data['title'],
                              style: TextFontStyle
                                  .headline16w600C00000StyleInter
                                  .copyWith(color: AppColors.c000000),
                            ),
                            const Spacer(),
                            UIHelper.customDivider(width: .8.sw),
                            UIHelper.verticalSpaceSmall,
                            Text(
                              "Request ID",
                              style: TextFontStyle
                                  .headline14w400C000000StyleInter
                                  .copyWith(color: AppColors.c000000),
                            ),
                            Text(data['random_ticket_id'],
                                style: TextFontStyle
                                    .headline12w400C9E9E9EStyleInter
                                    .copyWith(color: AppColors.c9E9E9E)),
                          ],
                        ),
                      ),
                      UIHelper.verticalSpaceSmall,
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                            color: AppColors.allPrimaryColor,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              data['message'],
                              style: TextFontStyle
                                  .headline12w400C9E9E9EStyleInter
                                  .copyWith(color: AppColors.c141414),
                            ),
                            UIHelper.verticalSpaceSmall,
                            UIHelper.customDivider(width: .8.sw),
                            UIHelper.verticalSpaceSmall,
                            Text(
                              data['email'],
                              style: TextFontStyle
                                  .headline16w600C00000StyleInter
                                  .copyWith(color: AppColors.c000000),
                            ),
                            Text(
                              DateFormatedUtils()
                                  .date12format(data["created_at"]),
                              style: TextFontStyle
                                  .headline12w400C9E9E9EStyleInter
                                  .copyWith(color: AppColors.c5A5C5F),
                            ),
                          ],
                        ),
                      ),
                      UIHelper.verticalSpaceSmall,
                      SizedBox(
                        height: .42.sh,
                        child: ListView.separated(
                          //  physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              UIHelper.verticalSpaceSmall,
                          shrinkWrap: true,
                          itemCount: list.length,
                          itemBuilder: (context, i) => Flexible(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 15.h),
                              decoration: BoxDecoration(
                                  color: list[i]["is_user"] == "0"
                                      ? AppColors.allPrimaryColor
                                      : AppColors.cffffff,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    list[i]["content"],
                                    style: TextFontStyle
                                        .headline12w400C9E9E9EStyleInter
                                        .copyWith(
                                            color: list[i]["is_user"] == "1"
                                                ? AppColors.c000000
                                                : AppColors.cffffff),
                                  ),
                                  UIHelper.verticalSpaceSmall,
                                  UIHelper.customDivider(width: .8.sw),
                                  UIHelper.verticalSpaceSmall,
                                  Text(
                                    list[i]["is_user"] == "1" ? "Admin" : "You",
                                    style: TextFontStyle
                                        .headline16w600C00000StyleInter
                                        .copyWith(
                                            color: list[i]["is_user"] == "1"
                                                ? AppColors.c000000
                                                : AppColors.cffffff),
                                  ),
                                  UIHelper.verticalSpaceSmall,
                                  Text(
                                      DateFormatedUtils()
                                          .date12format(list[i]["created_at"]),
                                      style: TextFontStyle
                                          .headline12w400C9E9E9EStyleInter
                                          .copyWith(
                                              color: list[i]["is_user"] == "1"
                                                  ? AppColors.c000000
                                                  : AppColors.cffffff)),
                                  // UIHelper.verticalSpaceSmall,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      AuthCustomeButton(
                          name: "Replay",
                          onCallBack: () {
                            showBottomNav(data['id'].toString());
                          },
                          height: .050.sh,
                          minWidth: .7.sw,
                          borderRadius: 15,
                          color: AppColors.allPrimaryColor,
                          textStyle: TextFontStyle
                              .headline14w600C141414StyleInter
                              .copyWith(color: AppColors.cffffff),
                          context: context),
                      // UIHelper.verticalSpaceMedium,
                    ],
                  );
                } else {
                  return const Expanded(
                      child: Center(child: Text("You Have No Replays Yet")));
                }
              } else {
                return loadingIndicatorCircle(context: context);
              }
            }),
      ),
    );
  }

  void showBottomNav(String id) {
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
            id: id,
            detailController: _detailController,
          ),
        );
      },
    );
  }
}
