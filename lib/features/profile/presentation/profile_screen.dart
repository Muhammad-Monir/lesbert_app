import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/helpers/navigation_service.dart';

import '../../../common_widgets/custom_drawer.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/all_routes.dart';
import '../../../common_widgets/bio_widegt.dart';
import '../../../common_widgets/divider_container.dart';
import '../../../common_widgets/experiance_data_widget.dart';
import '../../../common_widgets/other_details_widget.dart';
import '../../../common_widgets/personal_details_widget.dart';
import '../../../common_widgets/user_name_image_widget.dart';

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
          child: Column(
            children: [
              const DividerContainer(),
              UserImageAndNameWidget(
                userImage: Assets.images.userImage.path,
                userName: 'Andrew Hussy',
                userSubtitle: 'Professional',
                onTapProfileEdit: () =>
                    NavigationService.navigateTo(Routes.profileEdit),
              ),
              const DividerContainer(),
              PersonalDetailsWidget(
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
              BioWidget(
                bioDescription:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt malesuada ornare. Proin sollicitudin eros mauris, non viverra ante fermentum sed. Aliquam efficitur, augue at condimentum elementum, turpis nisi tincidunt mi, ut finibus mi nibh nec mi. In auctor libero turpis, et placerat velit eleifend eget. Suspendisse congue hendrerit lacus id sodales. Morbi non nunc ipsum. ',
                lstQualification: 'BSC in Computer Science',
                title: 'Abc Category',
                industry: 'IT/ Software',
                prepredLocation: 'USA',
                endDate: 'Currently Working Here',
                onTapBioEdit: () =>
                    NavigationService.navigateTo(Routes.bioEdit),
              ),
              const DividerContainer(),
              OtherDetailsWidget(
                skill: 'Programming, Coding, Playing, Programming, Coding',
                language: 'Bangla, English, Hindi',
                onTapOtherDetailsEdit: () =>
                    NavigationService.navigateTo(Routes.otherDetailsEdit),
              ),
              const DividerContainer(),
              ExperiencesDataWidget(
                crntCompanyName: 'Xbox',
                designation: 'Abc Category',
                employeeType: 'Abc Category',
                endDate: 'Currently Working Here',
                jobLocation: 'H#28, R#03, Block#H, City Name, Area, Area Code',
                startDate: '20/10/2024',
                onTapExperianceEdit: () =>
                    NavigationService.navigateTo(Routes.experianceEdit),
              ),
              DividerContainer(
                height: 40.h,
              ),
            ],
          ),
        ),
        drawer: const CustomDrawer(),
      ),
    );
  }
}
