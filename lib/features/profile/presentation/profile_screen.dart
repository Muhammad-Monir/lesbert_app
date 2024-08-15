import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/text_font_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            child: Image.asset(
              Assets.icons.menuIcon.path,
              width: 48.w,
            ),
          )
        ],
      ),
      body: Column(
        children: [
         const DividerContainer(),
         Container(
          padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 25.w),
          child: Row(children: [
            //CircleAvatar(backgroundImage: AssetImage(Assets.),),
          ],),
         ),
          
        ],
      ),
    );
  }
}

class DividerContainer extends StatelessWidget {
  const DividerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      decoration: BoxDecoration(color: AppColors.cE7ECF1),
    );
  }
}
