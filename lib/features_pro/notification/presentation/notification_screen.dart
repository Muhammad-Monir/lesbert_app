import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';
import '../../../common_widgets/notification_widget.dart';
import '../../../networks/api_acess.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    getNotificationRXObj.fetchNotificationData();
    super.initState();
  }

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
          'Notif',
          style: TextFontStyle.headline20w600C141414StyleInter,
        ),
      ),
      body: StreamBuilder(
          stream: getNotificationRXObj.dataFetcher,
          builder: (context, snapshot) {
            List data = snapshot.data?['data']['notifications'];

            if (snapshot.hasData) {
              return ListView.separated(
                separatorBuilder: (context, index) => UIHelper.customDivider(),
                itemCount: data.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return const NotificationWidget(
                    firstWord: "A",
                    time: '12.25 am',
                    title: 'This is the notification on every other placement.',
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
