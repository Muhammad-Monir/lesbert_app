import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/common_widgets/auth_button.dart';
import 'package:lsebert/features/auth/presentatiom/forgot_password/otp_verify_screen.dart';
import 'package:lsebert/helpers/loading_helper.dart';
import 'package:lsebert/helpers/ui_helpers.dart';

import '../../../common_widgets/loading_indicators.dart';
import '../../../helpers/dateuitl.dart';
import '../../../networks/api_acess.dart';
import 'widget/support_bottom_sheet.dart';
import '../../../common_widgets/custom_switch.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';
import 'widget/support_card.dart';

class HelpSupport extends StatefulWidget {
  const HelpSupport({super.key});

  @override
  State<HelpSupport> createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
  bool _enable = false;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  @override
  void initState() {
    _typeController.text = "subscription";
    getResolvedListRXObj.fetchResolvedData();
    getPendingListRXObj.fetchPendingListData();
    super.initState();
  }

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
            'Help & Support',
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
              _enable
                  ? StreamBuilder(
                      stream: getResolvedListRXObj.dataFetcher,
                      builder: (context, snapshot) {
                        if (snapshot.hasData && !snapshot.hasError) {
                          List data = snapshot.data['data'];
                          return SizedBox(
                            height: .65.sh,
                            //    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            child: ListView.separated(
                              //   physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, data) =>
                                  UIHelper.verticalSpace(10),
                              shrinkWrap: true,
                              itemCount: data.length,
                              itemBuilder: (context, index) => SupportCard(
                                callback: () async {
                                  await getIssueDetailsRXObj
                                      .fetchIssueDetailsData(data[index]['id'])
                                      .waitingForFuture();
                                  NavigationService.navigateTo(
                                      Routes.supportHistory);
                                  NavigationService.navigateTo(
                                      Routes.supportHistory);
                                },
                                title: data[index]["title"],
                                description: data[index]["message"],
                                date: DateFormatedUtils()
                                    .date12format(data[index]["created_at"]),
                                type: _enable,
                              ),
                            ),
                          );
                        } else {
                          return loadingIndicatorCircle(context: context);
                        }
                      })
                  : StreamBuilder(
                      stream: getPendingListRXObj.dataFetcher,
                      builder: (context, snapshot) {
                        if (snapshot.hasData && !snapshot.hasError) {
                          List data = snapshot.data['data'];
                          return SizedBox(
                            height: .65.sh,
                            //    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            child: ListView.separated(
                              //   physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, data) =>
                                  UIHelper.verticalSpace(10),
                              shrinkWrap: true,
                              itemCount: data.length,
                              itemBuilder: (context, index) => SupportCard(
                                callback: () async {
                                  await getIssueDetailsRXObj
                                      .fetchIssueDetailsData(data[index]['id'])
                                      .waitingForFuture();
                                  NavigationService.navigateTo(
                                      Routes.supportHistory);
                                },
                                title: data[index]["title"],
                                description: data[index]["message"],
                                date: DateFormatedUtils()
                                    .date12format(data[index]["created_at"]),
                                type: _enable,
                              ),
                            ),
                          );
                        } else {
                          return loadingIndicatorCircle(context: context);
                        }
                      }),
              UIHelper.verticalSpaceSmall,
              AuthCustomeButton(
                  name: "Open New Ticket",
                  onCallBack: () {
                    showBottomNav();
                  },
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
          child: BottomSheetWidget(
              detailController: _detailController,
              mailController: _mailController,
              titleController: _titleController,
              typeController: _typeController),
        );
      },
    );
  }
}
