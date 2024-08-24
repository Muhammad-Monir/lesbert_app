import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/networks/endpoints.dart';
import '../../../common_widgets/auth_button.dart';
import '../../../common_widgets/bio_widegt.dart';
import '../../../common_widgets/divider_container.dart';
import '../../../common_widgets/experiance_data_widget.dart';
import '../../../common_widgets/other_details_widget.dart';
import '../../../common_widgets/personal_details_widget.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/dateuitl.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';
import '../../../networks/api_acess.dart';

class ViewProfileScreen extends StatefulWidget {
  const ViewProfileScreen({
    super.key,
  });

  @override
  State<ViewProfileScreen> createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.h,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            NavigationService.goBack();
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.cffffff,
          ),
        ),
        title: Text(
          'Pro Profile',
          style: TextFontStyle.headline20w600C141414StyleInter
              .copyWith(color: AppColors.cffffff),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: StreamBuilder(
            stream: getTradeDetailsDataRXObj.dataFetcher,
            builder: (context, snapshot) {
              Map data = snapshot.data?['data'];
              List exData = data['user']['experiences'];
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 25.w),
                      child: CircleAvatar(
                        radius: 35.r,
                        backgroundColor: AppColors.allPrimaryColor,
                        child: CircleAvatar(
                          radius: 33.r,
                          backgroundImage: NetworkImage(imageUrl +
                              data['user']['user_detail']['profile_picture']),
                        ),
                      ),
                    ),
                    PersonalDetailsWidget(
                      isEdit: false,
                      onTap: () {
                        NavigationService.navigateTo(
                            Routes.personalDetailsEdit);
                      },
                      name: data['user']['name'],
                      phoneNum: data['user']['user_detail']['phone_number'],
                      email: data['user']['email'],
                      address: data['user']['user_detail']['address'],
                    ),
                    const DividerContainer(),
                    BioWidget(
                      isEdit: false,
                      bioDescription: data['user']['user_detail']['bio'],
                      currentCompany: data['user']['user_detail']
                          ['current_company'],
                      designation: data['user']['user_detail']
                          ['current_designation'],
                      industry: data['user']['user_detail']['industry'],
                      prepredLocation: data['user']['user_detail']['location'],
                      endDate: 'Currently Working Here',
                    ),
                    const DividerContainer(),
                    OtherDetailsWidget(
                      isEdit: false,
                      skill: data['user']['user_detail']['key_skills'],
                      language: data['user']['user_detail']['languages'],
                    ),
                    const DividerContainer(),
                    ListView.separated(
                      itemCount: exData.length,
                      separatorBuilder: (context, index) =>
                          UIHelper.verticalSpace(10.h),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ExperiencesDataWidget(
                          isEdit: false,
                          crntCompanyName: exData[index]['company_name'],
                          designation: exData[index]['designation'],
                          employeeType: exData[index]['status'],
                          endDate: DateFormatedUtils()
                              .dateformat(exData[index]['ending_date']),
                          jobLocation: exData[index]['company_location'],
                          startDate: DateFormatedUtils()
                              .dateformat(exData[index]['starting_date']),
                        );
                      },
                    ),
                    Center(
                      child: AuthCustomeButton(
                          name: "Send Message",
                          onCallBack: () {},
                          height: 50.h,
                          minWidth: 200.w,
                          borderRadius: 15.r,
                          color: AppColors.allPrimaryColor,
                          textStyle: TextFontStyle
                              .headline14w600C141414StyleInter
                              .copyWith(color: AppColors.cffffff),
                          context: context),
                    ),
                    UIHelper.verticalSpace(50.h)
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
