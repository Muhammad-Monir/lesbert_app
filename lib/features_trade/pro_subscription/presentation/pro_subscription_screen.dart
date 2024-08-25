import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsebert/common_widgets/custom_drawer.dart';
import '../../../common_widgets/auth_button.dart';
import '../../../constants/text_font_style.dart';
import '../../../features_pro/subscription/presentation/subscription_screen.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';
import '../../../helpers/ui_helpers.dart';

class ProSubscriptionScreen extends StatefulWidget {
  const ProSubscriptionScreen({super.key});

  @override
  State<ProSubscriptionScreen> createState() => _ProSubscriptionScreenState();
}

class _ProSubscriptionScreenState extends State<ProSubscriptionScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;
  final List<Widget> items = const [
    SubscriptionPlan(
      borderColor: AppColors.allPrimaryColor,
    ),
    SubscriptionPlan(
      borderColor: AppColors.c000000,
    ),
    SubscriptionPlan(
      borderColor: AppColors.allPrimaryColor,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 75.h,
        backgroundColor: AppColors.allPrimaryColor,
        elevation: 0,
        title: Text(
          'Subscription',
          style: TextFontStyle.headline20w600C141414StyleInter
              .copyWith(color: AppColors.cffffff),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: GestureDetector(
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              child: Image.asset(
                Assets.icons.whiteMenuIcon.path,
                width: 40.w,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
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
              UIHelper.verticalSpace(22.h),
              SizedBox(
                height: .6.sh,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) =>
                      UIHelper.horizontalSpaceMedium,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return SubscriptionPlan(
                      onSelect: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      borderColor: selectedIndex == index
                          ? AppColors.allPrimaryColor
                          : Colors
                              .transparent, // Change border color based on selection
                    );
                  },
                ),
              ),
              UIHelper.verticalSpaceMedium,
              //this will be optional based on if subscription purchased
              Container(
                height: 280.h,
                width: .9.sw,
                decoration: BoxDecoration(
                    color: AppColors.cffffff,
                    borderRadius: BorderRadius.all(Radius.circular(15.r))),
                child: Column(
                  children: [
                    UIHelper.verticalSpaceMedium,
                    CircleAvatar(
                      radius: 45.r,
                      child: ClipOval(
                        child: Image.network(
                          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
                          fit: BoxFit.cover,
                          width: 100.w,
                          height: 100.h,
                        ),
                      ),
                    ),
                    UIHelper.verticalSpaceMedium,
                    const Text("MIA HULULU"),
                    UIHelper.verticalSpaceMedium,
                    const Text("Subscribed To - Basic Plan"),
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
                height: 240.h,
                width: .9.sw,
                decoration: BoxDecoration(
                    color: AppColors.cffffff,
                    borderRadius: BorderRadius.all(Radius.circular(15.r))),
                child: Column(
                  children: [
                    UIHelper.verticalSpaceMedium,
                    Padding(
                      padding: EdgeInsets.all(8.sp),
                      child: Image.asset(
                        Assets.icons.flameIcon.path,
                        height: 71.sp,
                        width: 70.sp,
                      ),
                    ),
                    UIHelper.verticalSpaceMedium,
                    const Text("Get Boost"),
                    UIHelper.verticalSpaceMedium,
                    AuthCustomeButton(
                        name: "Get More",
                        onCallBack: () {
                          _showAlertDialog(context);
                        },
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
      drawer: CustomDrawer(
        isTextColor: true,
        onTapNotification: () {
          NavigationService.navigateTo(Routes.proNotification);
        },
        onTapPaymnetHistory: () =>
            NavigationService.navigateTo(Routes.proPaymnetHistory),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
          icon: Row(
            children: [
              const Spacer(),
              GestureDetector(
                onTap: () => NavigationService.goBack,
                child: Icon(
                  Icons.close,
                  size: 28.sp,
                ),
              )
            ],
          ),
          title: Text(
            'My Boosts',
            style: TextFontStyle.headline24w700C000000StyleInter,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                textAlign: TextAlign.center,
                'Be a top profile your area for 30 minutes to get more matches',
                style: TextFontStyle.headline14w400C848484StyleInter
                    .copyWith(color: AppColors.c000000),
              ),
              UIHelper.verticalSpace(20.h),
              Padding(
                padding: EdgeInsets.only(left: 25.w),
                child: Row(
                  children: [
                    Image.asset(
                      Assets.icons.boostIcon.path,
                      width: 48.w,
                    ),
                    UIHelper.horizontalSpace(8.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My Boosts',
                          style: TextFontStyle.headline24w700C000000StyleInter,
                        ),
                        UIHelper.verticalSpace(8.h),
                        Text(
                          textAlign: TextAlign.center,
                          '\$2.0',
                          style: TextFontStyle.headline14w400C848484StyleInter,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              UIHelper.verticalSpace(43.h),
              AuthCustomeButton(
                  name: 'Get More Boosts',
                  onCallBack: () {},
                  height: 48.h,
                  minWidth: 228.w,
                  borderRadius: 24.r,
                  color: AppColors.allPrimaryColor,
                  textStyle: TextFontStyle.headline16w600CFFFFFFFFStyleintere,
                  context: context)
            ],
          ),
        );
      },
    );
  }
}
