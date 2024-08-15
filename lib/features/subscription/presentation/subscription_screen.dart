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
      body: SingleChildScrollView(
        child: Padding(
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
              Container(
                height: 280,
                width: .9.sw,
                decoration: const BoxDecoration(
                    color: AppColors.cffffff,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  children: [
                    UIHelper.verticalSpaceMedium,
                    CircleAvatar(
                      radius: 45,
                      child: ClipOval(
                        child: Image.network(
                          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                    UIHelper.verticalSpaceMedium,
                    Text("MIA HULULU"),
                    UIHelper.verticalSpaceMedium,
                    Text("Subscribed To - Basic Plan"),
                    UIHelper.verticalSpaceMedium,
                    AuthCustomeButton(
                        name: "Change Suscription Plan",
                        onCallBack: () {},
                        height: .05.sh,
                        minWidth: .4.sw,
                        borderRadius: 20.r,
                        color: AppColors.allPrimaryColor,
                        textStyle: TextFontStyle.headline12w400C9E9E9EStyleInter
                            .copyWith(color: AppColors.cffffff),
                        context: context),
                  ],
                ),
              ),
              UIHelper.verticalSpaceMedium,
              Container(
                height: 240,
                width: .9.sw,
                decoration: const BoxDecoration(
                    color: AppColors.cffffff,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  children: [
                    UIHelper.verticalSpaceMedium,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        Assets.icons.flameIcon.path,
                        height: 71.sp,
                        width: 70.sp,
                      ),
                    ),
                    UIHelper.verticalSpaceMedium,
                    Text("Get Boost"),
                    UIHelper.verticalSpaceMedium,
                    AuthCustomeButton(
                        name: "Get More",
                        onCallBack: () {},
                        height: .05.sh,
                        minWidth: .4.sw,
                        borderRadius: 20.r,
                        color: AppColors.allPrimaryColor,
                        textStyle: TextFontStyle.headline12w400C9E9E9EStyleInter
                            .copyWith(color: AppColors.cffffff),
                        context: context),
                  ],
                ),
              ),
              UIHelper.verticalSpaceExtraLarge,
            ],
          ),
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
