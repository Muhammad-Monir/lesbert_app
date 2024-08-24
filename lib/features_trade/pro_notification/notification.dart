import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common_widgets/notification_widget.dart';
import '../../constants/text_font_style.dart';
import '../../gen/colors.gen.dart';
import '../../helpers/navigation_service.dart';
import '../../helpers/ui_helpers.dart';

class ProNotificationScreen extends StatefulWidget {
  const ProNotificationScreen({super.key});

  @override
  State<ProNotificationScreen> createState() => _ProNotificationScreenState();
}

class _ProNotificationScreenState extends State<ProNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.h,
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
          'Notifications',
          style: TextFontStyle.headline20w600C141414StyleInter,
        ),
      ),
      
      body: ListView.separated(
        separatorBuilder: (context, index) => UIHelper.customDivider(),
        itemCount: 10,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return const NotificationWidget(
            firstWord: "A",
            time: '12.25 am',
            title: 'This is the notification on every other placement.',
          );
        },
      ),
    );
  }
}
