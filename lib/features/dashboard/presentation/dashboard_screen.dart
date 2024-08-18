// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/common_widgets/custom_drawer.dart';
import 'package:lsebert/common_widgets/custom_text_feild.dart';
import 'package:lsebert/constants/text_font_style.dart';
import 'package:lsebert/gen/assets.gen.dart';
import 'package:lsebert/gen/colors.gen.dart';
import 'package:lsebert/helpers/ui_helpers.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/delete_dilouge_widget.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';
import '../../../networks/api_acess.dart';
import '../../../networks/stream_cleaner.dart';

import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';

import '../../../provider/image_picker_provider.dart';
import 'widget/dashboard_card.dart';
import 'widget/dotted_container.dart';
import 'widget/experian_data_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.cE7ECF1,
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: AppColors.cE7ECF1,
          elevation: 0,
          automaticallyImplyLeading: false,
          toolbarHeight: 75.w,
          leading: Padding(
            padding: EdgeInsets.only(left: 6.w),
            child: CircleAvatar(
              radius: 35.r,
              backgroundColor: AppColors.c1DB5A9,
              child: Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.c1DB5A9,
                    width: 2.w,
                  ),
                ),
                child: CircleAvatar(
                  radius: 30.r, // Inner circle radius
                  backgroundImage: AssetImage(
                    Assets.images.viewProfileImage.path,
                  ),
                ),
              ),
            ),
          ),
          title: Text(
            'Sakib Al',
            style: TextFontStyle.headline16w500C141414StyleInter
                .copyWith(color: AppColors.allPrimaryColor),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                child: Image.asset(
                  Assets.icons.menuIcon.path,
                  width: 48.w,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
          child: Column(
            children: [
              UIHelper.verticalSpace(4.h),
              CustomTextFormField(
                fillColor: AppColors.cffffff,
                isBorder: true,
                isPrefixIcon: true,
                iconpath: Assets.icons.searchIcon.path,
                controller: _searchController,
                hintText: 'Search',
              ),
              UIHelper.verticalSpace(20.h),

              DashBoardCardProfessional(
                isText: false,
                darkMode: true,
                count: "30",
                detail: "Total COnnect People",
                imagepath: Assets.icons.totalConnect.path,
              ),
              UIHelper.verticalSpaceSmall,
              DashBoardCardProfessional(
                isText: true,
                darkMode: false,
                count: "00",
                detail: "Boost",
                imagepath: Assets.icons.flameIcon.path,
              ),
              UIHelper.verticalSpaceSmall,
              DashBoardCardProfessional(
                isText: false,
                darkMode: false,
                count: "00",
                detail: "Boost",
                imagepath: Assets.icons.profileViewIcon.path,
              ),

              UIHelper.verticalSpaceMedium,
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: Text(
                    "Add Photo",
                    style: TextFontStyle.headline24w700C000000StyleInter,
                  ),
                ),
              ),
              //  UIHelper.verticalSpaceSmall,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<ImagePickerProvider>(
                      builder: (context, provider, _) {
                    return Column(
                      children: [
                        UIHelper.verticalSpaceMedium,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            provider.imageFile1 == null
                                ? const DottedContainer(
                                    index: 1,
                                  )
                                : _pickedImage(
                                    provider.imageFile1!.path, provider, 1),
                            provider.imageFile2 == null
                                ? const DottedContainer(
                                    index: 2,
                                  )
                                : _pickedImage(
                                    provider.imageFile2!.path, provider, 2)
                          ],
                        ),
                        UIHelper.verticalSpaceMediumLarge,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            provider.imageFile3 == null
                                ? const DottedContainer(
                                    index: 3,
                                  )
                                : _pickedImage(
                                    provider.imageFile3!.path, provider, 3),
                            provider.imageFile4 == null
                                ? const DottedContainer(
                                    index: 4,
                                  )
                                : _pickedImage(
                                    provider.imageFile4!.path, provider, 4),
                          ],
                        ),
                      ],
                    );
                  }),
                  UIHelper.verticalSpaceMedium,
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: AppColors.cffffff,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(24.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UIHelper.verticalSpaceMedium,
                          Text(
                            "About Me",
                            style:
                                TextFontStyle.headline24w700C000000StyleInter,
                          ),
                          UIHelper.verticalSpaceMedium,
                          Text(
                            "Hello! My name is Andrew Hussy, and I am a dedicated and passionate PHP programmer with 5 years of experience in developing dynamic and robust web applications. My journey in the world of programming began with an innate curiosity about how the web works, which led me to specialize in PHP due to its versatility and widespread use.I have extensive experience in building and maintaining websites using PHP, HTML, CSS, and JavaScript. I am adept at creating responsive and user-friendly interfaces that enhance user experience. I am proficient in using popular PHP frameworks like Laravel, Symfony, and CodeIgniter, which help streamline the development process and ensure code quality and maintainability. I have a strong understanding of database management and have worked extensively with MySQL and PostgreSQL. I am skilled in designing efficient database schemas and writing complex queries.  I have experience in integrating third-party APIs as well as developing custom APIs to enhance the functionality of web applications.",
                            textAlign: TextAlign.justify,
                            style: TextFontStyle.headline14w400C848484StyleInter
                                .copyWith(color: AppColors.c5A5C5F),
                          ),
                          UIHelper.horizontalSpaceSmall,
                        ],
                      ),
                    ),
                  ),
                  UIHelper.verticalSpaceMedium,
                  ExperianceDataWidget(
                    compnayName: 'Abcd Pvt Ltd',
                    proffession: 'PHP Programmer',
                    location: 'USA',
                    dateAndTime: 'Apr 2023 - April 2024',
                    shortDescription:
                        'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor.',
                  ),
                ],
              ),
            ],
          ),
        ),
        drawer: CustomDrawer(
          onTapLogout: () {
            deleteButtonDialouge(context, "You are about to Logout!", () {
              //  getDeleteTokenRXObj.deleteTokenData();
              getLogOutRXObj.fetchLogoutData();
              totalDataClean();
              NavigationService.navigateToReplacement(Routes.login);
            });

            () {
              _scaffoldKey.currentState!.closeDrawer();
              NavigationService.navigateTo(Routes.notification);
            };
            onTapPaymnetHistory:
            () {
              NavigationService.navigateTo(Routes.paymentHistory);
              _scaffoldKey.currentState!.closeDrawer();
            };
          },
        ),
      ),
    );
  }

  Widget _pickedImage(String path, ImagePickerProvider provider, int index) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
            width: 159.w,
            height: 154.h,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Image.file(
                File(
                  path,
                ),
                fit: BoxFit.cover)),
        Positioned(
          bottom: -12,
          right: -10,
          child: GestureDetector(
            onTap: () async {
              provider.resetImages(index);
            },
            child: CircleAvatar(
              backgroundColor: AppColors.cffffff,
              radius: 16.r,
              child: const Icon(
                Icons.close,
                color: AppColors.allPrimaryColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
