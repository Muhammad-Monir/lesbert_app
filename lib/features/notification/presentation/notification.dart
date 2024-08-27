import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/helpers/dateuitl.dart';

import '../../../common_widgets/notification_widget.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';
import '../../../networks/api_acess.dart';

class ProNotificationScreen extends StatefulWidget {
  const ProNotificationScreen({super.key});

  @override
  State<ProNotificationScreen> createState() => _ProNotificationScreenState();
}

class _ProNotificationScreenState extends State<ProNotificationScreen> {
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
            NavigationService.goBack;
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
      body: StreamBuilder(
          stream: getNotificationRXObj.dataFetcher,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List data = snapshot.data?['data']['notifications'];
              if (data.isNotEmpty) {
                return ListView.separated(
                  separatorBuilder: (context, index) =>
                      UIHelper.customDivider(),
                  itemCount: data.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    Map message = data[index]['data'];
                    return NotificationWidget(
                      firstWord: message.entries.first.value
                          .toString()
                          .toUpperCase()
                          .trim()
                          .substring(0, 1),
                      time: DateFormatedUtils()
                          .date12format(data[index]['created_at']),
                      title: message.entries.first.value,
                    );
                  },
                );
              } else {
                return Center(
                    child: Text(
                  "No Notification for you yet",
                  style: TextFontStyle.headline12w400C9E9E9EStyleInter,
                ));
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
