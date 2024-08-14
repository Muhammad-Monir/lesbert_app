import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/common_widgets/auth_button.dart';
import 'package:lsebert/constants/text_font_style.dart';
import 'package:lsebert/gen/assets.gen.dart';
import 'package:lsebert/gen/colors.gen.dart';
import 'package:lsebert/helpers/ui_helpers.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  List<Widget> items = [
    SubscriptionPlan(),
    SubscriptionPlan(),
    SubscriptionPlan()
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subcription Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "All-Access Pass",
              style: TextFontStyle.headline24w700C000000StyleInter,
            ),
            UIHelper.verticalSpaceMedium,
            const Text(
              "Boost your productivity with instant access to all 9,183 existing products and daily new releases.",
              textAlign: TextAlign.center,
            ),
            UIHelper.verticalSpaceLarge,
            SizedBox(
              height: .6.sh,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    UIHelper.horizontalSpaceMedium,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return items[index];
                },
              ),
            ),
            UIHelper.verticalSpaceMedium,
            //this will be optional based on if subscription purchased
            UIHelper.verticalSpaceMedium,
          ],
        ),
      ),
    );
  }
}

class SubscriptionPlan extends StatelessWidget {
  const SubscriptionPlan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: .7.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppColors.cffffff,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UIHelper.verticalSpaceMedium,
          Row(
            children: [
              Text("Basic"),
              UIHelper.horizontalSpaceSmall,
              Text("Popular"),
            ],
          ),
          UIHelper.verticalSpaceSmall,
          RichText(
            text: TextSpan(
              text: '\$144',
              style: TextFontStyle.headline48w600CFFFFFFFFStylePoppins
                  .copyWith(color: AppColors.c000000),
              children: [
                TextSpan(
                  text: '/Bold',
                  style: TextFontStyle.headline14w400C848484StyleInter,
                ),
              ],
            ),
          ),
          UIHelper.verticalSpaceSmall,
          Container(
            height: 50,
            width: .5.sw,
            decoration: const BoxDecoration(
              color: AppColors.c073D71,
            ),
            child: const Center(child: Text("Pay Monthly")),
          ),
          UIHelper.verticalSpaceMedium,
          const subscriptionFeatures(
            feature: "Enhance Your Experience",
          ),
          const subscriptionFeatures(
            feature: "Enhance Your Experience",
          ),
          const subscriptionFeatures(
            feature: "Enhance Your Experience",
          ),
          const Spacer(),
          Center(
            child: AuthCustomeButton(
                name: "Get Boost",
                onCallBack: () {},
                height: .05.sh,
                minWidth: .6.sw,
                borderRadius: 20.r,
                color: AppColors.allPrimaryColor,
                textStyle: TextFontStyle.headline12w400C9E9E9EStyleInter
                    .copyWith(color: AppColors.cffffff),
                context: context),
          ),
          UIHelper.verticalSpaceMedium
        ],
      ),
    );
  }
}

class subscriptionFeatures extends StatelessWidget {
  final String feature;
  const subscriptionFeatures({
    super.key,
    required this.feature,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Image.asset(
            Assets.icons.tickCircle.path,
            height: 18.r,
          ),
          UIHelper.horizontalSpaceSmall,
          Text(
            feature,
            style: TextFontStyle.headline12w400C9E9E9EStyleInter.copyWith(
              color: AppColors.c000000,
            ),
          ),
        ],
      ),
    );
  }
}
