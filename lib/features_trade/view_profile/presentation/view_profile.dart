import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common_widgets/bio_widegt.dart';
import '../../../common_widgets/divider_container.dart';
import '../../../common_widgets/experiance_data_widget.dart';
import '../../../common_widgets/other_details_widget.dart';
import '../../../common_widgets/personal_details_widget.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/all_routes.dart';
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
                          backgroundImage:
                              AssetImage(Assets.images.viewProfileImage.path),
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
                      itemCount: 10,
                      separatorBuilder: (context, index) =>
                          UIHelper.verticalSpace(10.h),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return const ExperiencesDataWidget(
                          isEdit: false,
                          crntCompanyName: 'Xbox',
                          designation: 'Abc Category',
                          employeeType: 'Abc Category',
                          endDate: 'Currently Working Here',
                          jobLocation:
                              'H#28, R#03, Block#H, City Name, Area, Area Code',
                          startDate: '20/10/2024',
                        );
                      },
                    ),
                    DividerContainer(
                      height: 40.h,
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 30.h),
        child: Image.asset(
          Assets.icons.sendMessageIcon.path,
          width: 35.w,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
