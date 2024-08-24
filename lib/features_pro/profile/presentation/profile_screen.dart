import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/helpers/navigation_service.dart';
import 'package:lsebert/helpers/ui_helpers.dart';
import 'package:lsebert/networks/api_acess.dart';

import '../../../common_widgets/auth_button.dart';
import '../../../common_widgets/bio_widegt.dart';
import '../../../common_widgets/custom_drawer.dart';
import '../../../common_widgets/divider_container.dart';
import '../../../common_widgets/experiance_data_widget.dart';
import '../../../common_widgets/other_details_widget.dart';
import '../../../common_widgets/personal_details_widget.dart';
import '../../../common_widgets/user_name_image_widget.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/all_routes.dart';
import '../../../networks/endpoints.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 75.h,
          backgroundColor: AppColors.cffffff,
          elevation: 0,
          title: Text(
            'Profile Screen',
            style: TextFontStyle.headline20w600C141414StyleInter,
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
          physics: const BouncingScrollPhysics(),
          child: StreamBuilder(
              stream: getProProfileRxObj.dataFetcher,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Map<String, dynamic> data = snapshot.data!['data']['user'];
                  List? experianceData = data['experiences'];
                  //List<Map<String, dynamic>> experiance = data['experiences'];
                  return Column(
                    children: [
                      const DividerContainer(),
                      UserImageAndNameWidget(
                          userImage: imageUrl + data['avatar'],
                          // userImage: Assets.images.userImage.path,
                          userName: data['name'],
                          userSubtitle: data['profession'],
                          onTapProfileEdit: () =>
                              // NavigationService.navigateTo(Routes.profileEdit),
                              NavigationService.navigateToWithArgs(
                                  Routes.profileEdit, {
                                'name': data['name'],
                                'email': data['email'],
                                'image': imageUrl + data['avatar'],
                                //'image': imageUrl + data['avatar'],
                                'proffession': data['profession'],
                              })),
                      const DividerContainer(),
                      PersonalDetailsWidget(
                        onTap: () {
                          NavigationService.navigateToWithArgs(
                              Routes.personalDetailsEdit, {
                            'phone': data['user_detail']['phone_number'],
                            'address': data['user_detail']['address'],
                          });
                        },
                        name: data['name'],
                        phoneNum: data['user_detail']['phone_number'],
                        email: data['email'],
                        // gender: 'Male',
                        address: data['user_detail']['address'],
                      ),
                      const DividerContainer(),
                      BioWidget(
                          // bioDescription: appData.write(, value),
                          bioDescription: data['user_detail']['bio'],
                          currentCompany: data['user_detail']
                              ['current_company'],
                          designation: data['user_detail']
                              ['current_designation'],
                          industry: data['user_detail']['industry'],
                          prepredLocation: data['user_detail']['location'],
                          onTapBioEdit: () {
                            NavigationService.navigateToWithArgs(
                                Routes.bioEdit, {
                              'bioDes': data['user_detail']['bio'],
                              'curntCompany': data['user_detail']
                                  ['current_company'],
                              'designation': data['user_detail']
                                  ['current_designation'],
                              'industry': data['user_detail']['industry'],
                              'location': data['user_detail']['location'],
                            });
                          }),
                      const DividerContainer(),
                      OtherDetailsWidget(
                        skill: data['user_detail']['key_skills'],
                        language: data['user_detail']['languages'],
                        onTapOtherDetailsEdit: () =>
                            NavigationService.navigateToWithArgs(
                                Routes.otherDetailsEdit, {
                          'skill': data['user_detail']['key_skills'],
                          'language': data['user_detail']['languages'],
                        }),
                      ),
                      const DividerContainer(),
                      if (experianceData != null)
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 0.h, horizontal: 0.w),
                          child: Column(
                            children: [
                              ListView.separated(
                                separatorBuilder: (context, index) =>
                                    UIHelper.customDivider(),
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: experianceData.length,
                                itemBuilder: (context, index) {
                                  // if (experianceData.length == 1) {
                                  //   isEditButtonShow = true;
                                  // }
                                  return ExperiencesDataWidget(
                                      isExperianceShow: index == 0,
                                      crntCompanyName: experianceData[index]
                                          ['company_name'],
                                      designation: experianceData[index]
                                          ['designation'],
                                      employeeType: experianceData[index]
                                          ['status'],
                                      endDate: experianceData[index]
                                          ['ending_date'],
                                      jobLocation: experianceData[index]
                                          ['company_location'],
                                      startDate: experianceData[index]
                                          ['starting_date'],
                                      onTapExperianceEdit: () {
                                        log(experianceData[index].toString());
                                        NavigationService.navigateToWithArgs(
                                            Routes.experianceEdit, {
                                          'id': experianceData[index]['id'],
                                          'companyName': experianceData[index]
                                              ['company_name'],
                                          'designation': experianceData[index]
                                              ['designation'],
                                          'startDate': experianceData[index]
                                              ['starting_date'],
                                          'endDate': experianceData[index]
                                              ['ending_date'],
                                          'employeeTaype': experianceData[index]
                                              ['status'],
                                          'location': experianceData[index]
                                              ['company_location'],
                                        });
                                      });
                                },
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 25.w, right: 25.w),
                                child: AuthCustomeButton(
                                    name: '+ Add New Experience',
                                    onCallBack: () {
                                      NavigationService.navigateTo(
                                          Routes.addNewExperiance);
                                    },
                                    height: 50.h,
                                    minWidth: double.infinity,
                                    borderRadius: 30.r,
                                    color: AppColors.allPrimaryColor,
                                    textStyle: TextFontStyle
                                        .headline14w600C141414StyleInter
                                        .copyWith(color: AppColors.cffffff),
                                    context: context),
                              )
                            ],
                          ),
                        ),
                      DividerContainer(
                        height: 40.h,
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('No Data Avilable');
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
        drawer: const CustomDrawer(),
      ),
    );
  }
}
