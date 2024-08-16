import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common_widgets/bio_widegt.dart';
import '../../common_widgets/divider_container.dart';
import '../../common_widgets/experiance_data_widget.dart';
import '../../common_widgets/other_details_widget.dart';
import '../../common_widgets/personal_details_widget.dart';
import '../../constants/text_font_style.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../helpers/all_routes.dart';
import '../../helpers/navigation_service.dart';

class ViewProfileScreen extends StatefulWidget {
  const ViewProfileScreen({super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
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
                NavigationService.navigateTo(Routes.personalDetailsEdit);
              },
              name: 'Nasib Hasan',
              phoneNum: '+01234567890',
              email: 'youremail@email.com',
              gender: 'Male',
              address: 'H#28, R#03, Block#H, City Name, Area, Area Code',
            ),
            const DividerContainer(),
            const BioWidget(
              isEdit: false,
              bioDescription:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt malesuada ornare. Proin sollicitudin eros mauris, non viverra ante fermentum sed. Aliquam efficitur, augue at condimentum elementum, turpis nisi tincidunt mi, ut finibus mi nibh nec mi. In auctor libero turpis, et placerat velit eleifend eget. Suspendisse congue hendrerit lacus id sodales. Morbi non nunc ipsum. ',
              lstQualification: 'BSC in Computer Science',
              title: 'Abc Category',
              industry: 'IT/ Software',
              prepredLocation: 'USA',
              endDate: 'Currently Working Here',
            ),
            const DividerContainer(),
            const OtherDetailsWidget(
              isEdit: false,
              skill: 'Programming, Coding, Playing, Programming, Coding',
              language: 'Bangla, English, Hindi',
            ),
            const DividerContainer(),
            const ExperiencesDataWidget(
              isEdit: false,
              crntCompanyName: 'Xbox',
              designation: 'Abc Category',
              employeeType: 'Abc Category',
              endDate: 'Currently Working Here',
              jobLocation: 'H#28, R#03, Block#H, City Name, Area, Area Code',
              startDate: '20/10/2024',
            ),
            DividerContainer(
              height: 40.h,
            ),
          ],
        ),
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
