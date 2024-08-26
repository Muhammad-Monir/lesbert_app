import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common_widgets/paymnet_data_widget.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';

class PaymentHistoryScreen extends StatefulWidget {
  const PaymentHistoryScreen({super.key});

  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 75.h,
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
            'Payment History',
            style: TextFontStyle.headline20w600C141414StyleInter,
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(25.sp),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: AppColors.cE7ECF1),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Payment History',
                  style: TextFontStyle.headline16w600C000000tyleiPoppins,
                ),
                UIHelper.verticalSpace(24.h),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return const PaymentDataWidget();
                    },
                    separatorBuilder: (context, index) =>
                        UIHelper.verticalSpace(10.h),
                    itemCount: 20)
              ],
            ),
          ),
        ));
  }
}
