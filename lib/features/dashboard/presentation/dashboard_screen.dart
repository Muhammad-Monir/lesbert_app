// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/constants/text_font_style.dart';
import 'package:lsebert/gen/assets.gen.dart';
import 'package:lsebert/gen/colors.gen.dart';
import 'package:lsebert/helpers/ui_helpers.dart';
import 'package:provider/provider.dart';

import '../../../provider/image_picker_provider.dart';
import 'widget/dotted_container.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Screen'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
        child: Column(
          children: [
            DashBoardCardProfessional(
              darkMode: true,
              count: "30",
              detail: "Total COnnect People",
              imagepath: Assets.icons.totalConnect.path,
              isThirdOption: false,
            ),
            UIHelper.verticalSpaceSmall,
            DashBoardCardProfessional(
              darkMode: false,
              count: "00",
              detail: "Boost",
              imagepath: Assets.icons.totalConnect.path,
              isThirdOption: true,
            ),
            UIHelper.verticalSpaceSmall,
            DashBoardCardProfessional(
              darkMode: false,
              count: "00",
              detail: "Boost",
              imagepath: Assets.icons.totalConnect.path,
              isThirdOption: false,
            ),
            UIHelper.verticalSpaceMedium,
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  "Your Photo",
                  style: TextFontStyle.headline24w700C000000StyleInter,
                ),
              ),
            ),
            //  UIHelper.verticalSpaceSmall,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer<ImagePickerProvider>(builder: (context, provider, _) {
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
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UIHelper.verticalSpaceMedium,
                        Text(
                          "About Me",
                          style: TextFontStyle.headline24w700C000000StyleInter,
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
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: AppColors.cffffff,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UIHelper.verticalSpaceMedium,
                        Text(
                          "Experience",
                          style: TextFontStyle.headline24w700C000000StyleInter,
                        ),
                        UIHelper.verticalSpaceMedium,
                        SizedBox(
                          height: 80,
                          width: double.infinity,
                          //color: AppColors.allPrimaryColor,
                          child: Stack(
                            children: [
                              Image.asset(
                                Assets.icons.experience.path,
                                height: 24,
                                width: 24,
                              ),
                              Positioned(
                                left: 40,
                                child: Text("Abcd Pvt Ltd",
                                    style: TextFontStyle
                                        .headline16w600C00000StyleInter),
                              ),
                              Positioned(
                                  top: 35,
                                  left: 40,
                                  child: Text(
                                    "PHP Programmer",
                                    style: TextFontStyle
                                        .headline14w400C000000StyleInter,
                                  )),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              Assets.icons.location.path,
                              height: 24,
                              width: 24,
                            ),
                            UIHelper.horizontalSpaceSmall,
                            Text("USA"),
                            UIHelper.horizontalSpaceMedium,
                            Image.asset(
                              Assets.icons.duration.path,
                              height: 24,
                              width: 24,
                            ),
                            UIHelper.horizontalSpaceSmall,
                            Text("April 2023 - April 2024"),
                          ],
                        ),
                        UIHelper.verticalSpaceMedium,
                        Text(
                          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor.",
                          textAlign: TextAlign.justify,
                          style: TextFontStyle.headline14w400C848484StyleInter
                              .copyWith(color: AppColors.c5A5C5F),
                        ),
                        UIHelper.horizontalSpaceSmall,
                      ],
                    ),
                  ),
                ),
                UIHelper.verticalSpaceExtraLarge,
              ],
            ),
          ],
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

class DashBoardCardProfessional extends StatelessWidget {
  final String count;
  final String detail;
  final String imagepath;
  final bool darkMode;
  final bool isThirdOption;

  const DashBoardCardProfessional({
    super.key,
    required this.count,
    required this.detail,
    required this.imagepath,
    required this.darkMode,
    required this.isThirdOption,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: darkMode ? AppColors.allPrimaryColor : AppColors.cffffff,
      ),
      height: .15.sh,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Positioned(
              left: 10,
              top: 5,
              child: Text(
                count,
                style:
                    TextFontStyle.headline48w600CFFFFFFFFStylePoppins.copyWith(
                  color:
                      darkMode ? AppColors.cffffff : AppColors.allPrimaryColor,
                ),
              ),
            ),
            Positioned(
              left: 15,
              bottom: 10,
              child: Text(
                detail,
                style:
                    TextFontStyle.headline16w600CFFFFFFFFStyleintere.copyWith(
                  color:
                      darkMode ? AppColors.cffffff : AppColors.allPrimaryColor,
                ),
              ),
            ),
            Positioned(
                right: 15,
                top: 0,
                child: Image.asset(
                  imagepath,
                  color: AppColors.c000000,
                  height: 80,
                  width: 80,
                )),
            if (isThirdOption)
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.white,
                    width: 2.0, // Underline thickness
                  ))),
                  child: Text(
                    "+ Add Boost",
                    style: TextFontStyle.headline16w600CFFFFFFFFStyleintere
                        .copyWith(
                      color: darkMode
                          ? AppColors.cffffff
                          : AppColors.allPrimaryColor,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
