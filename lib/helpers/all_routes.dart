import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:lsebert/features_pro/auth/presentatiom/forgot_password/forgot_pass_screen.dart';
import 'package:lsebert/features_pro/auth/presentatiom/forgot_password/otp_success_screen.dart';
import 'package:lsebert/features_pro/auth/presentatiom/forgot_password/otp_verify_screen.dart';
import 'package:lsebert/features_pro/auth/presentatiom/forgot_password/reset_pass_screen.dart';
import 'package:lsebert/features_pro/auth/presentatiom/login/login_screen.dart';
import 'package:lsebert/features_pro/auth/presentatiom/sign_up/sign_up_screen.dart';
import 'package:lsebert/features_pro/dashboard/presentation/dashboard_screen.dart';
import 'package:lsebert/features_pro/intro/onboarding_screen.dart';
import 'package:lsebert/features_pro/intro/role_screen.dart';
import 'package:lsebert/features_pro/intro/splash_screen.dart';
import 'package:lsebert/features_pro/message/presentation/message_screen.dart';
import 'package:lsebert/features_pro/notification/presentation/notification_screen.dart';
import 'package:lsebert/features_pro/paymnet_history/presentation/payment_history_screen.dart';
import 'package:lsebert/features_pro/profile/presentation/add_new_experiance.dart';
import 'package:lsebert/features_pro/profile/presentation/bio_edit_screen.dart';
import 'package:lsebert/features_pro/profile/presentation/change_pass_screen.dart';
import 'package:lsebert/features_pro/profile/presentation/experiance_edit_screen.dart';
import 'package:lsebert/features_pro/profile/presentation/other_details_edit.dart';
import 'package:lsebert/features_pro/profile/presentation/personal_details_edit_screen.dart';
import 'package:lsebert/features_pro/profile/presentation/profile_edit_screen.dart';
import 'package:lsebert/features_pro/profile/presentation/profile_screen.dart';
import 'package:lsebert/features_pro/question/presentation/question_screen.dart';
import 'package:lsebert/features_pro/security/presentation/security_screen.dart';
import 'package:lsebert/features_pro/subscription/presentation/subscription_screen.dart';
import 'package:lsebert/features_trade/pro_notification/notification.dart';
import 'package:lsebert/features_trade/trade_dashboard/presentation/trade_dashboard.dart';
import 'package:lsebert/features_trade/pro_message/presentation/pro_message_screen.dart';
import 'package:lsebert/features_trade/pro_paymnet_history/pro_peyment_history_screen.dart';
import 'package:lsebert/features_trade/pro_subscription/presentation/pro_subscription_screen.dart';
import 'package:lsebert/features_trade/view_profile/presentation/view_profile.dart';
import 'package:lsebert/loading_screen.dart';
import 'package:lsebert/navigation_screen.dart';

import '../common_widgets/webview_helper.dart';
import '../features_pro/support/presentation/help_and_support.dart';
import '../features_pro/support/presentation/support_history.dart';
import '../features_trade/pro_navigation_screen.dart';
import '../features_trade/pro_profile/presentation/trade_edit_profile.dart';

final class Routes {
  static final Routes _routes = Routes._internal();
  Routes._internal();
  static Routes get instance => _routes;

  static const String webview = '/webView';
  static const String dashboard = '/dashboard';
  static const String subscription = '/subscription';
  static const String message = '/message';
  static const String profile = '/profile';
  static const String bottomNavScreen = '/bottomNavScreen';
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String role = '/role';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPass = '/forgotPass';
  static const String otpVerify = '/otpVerify';
  static const String resetPass = '/resetPass';
  static const String otpSuccess = '/otpSuccess';
  static const String question = '/questionScreen';
  static const String loading = '/loading_screen';
  static const String personalDetailsEdit = '/personalDetailsEdit';
  static const String bioEdit = '/bioEdit';
  static const String otherDetailsEdit = '/otherDetailsEdit';
  static const String experianceEdit = '/experianceEdit';
  static const String changePass = '/changePass';
  // static const String notification = '/notification';
  static const String paymentHistory = '/paymentHistory';
  static const String profileEdit = '/profileEdit';
  static const String helpAndSupport = '/HelpSupport';
  static const String addNewExperiance = '/addNewExperiance';
  static const String supportHistory = '/supportHistory';
  static const String securityScreen = '/securityScreen';

  //========<>======<>=======<>=======<>=======<>=========
  //===============<><><>==============<><><><>===============
  // Pro Section
  static const String proNavBar = '/proNavBar';
  static const String proDashboard = '/proDashboard';
  static const String proSubscription = '/proSubscription';
  static const String proMessage = '/proMessage';
  static const String proProfile = '/proProfile';
  static const String viewProfile = '/viewProfile';
  static const String proNotification = '/proNotification';
  static const String proPaymnetHistory = '/proPaymnetHistory';
  static const String proEditProfile = '/proEditProfile';
  static const String aboutUs = '/aboutUs';
}

final class RouteGenerator {
  static final RouteGenerator _routeGenerator = RouteGenerator._internal();
  RouteGenerator._internal();
  static RouteGenerator get instance => _routeGenerator;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.dashboard:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: DashboardScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const DashboardScreen());
      case Routes.subscription:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: SubscriptionScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const SubscriptionScreen());
      case Routes.message:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: MessageScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const MessageScreen());
      case Routes.profile:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: ProfileScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const ProfileScreen());
      case Routes.splash:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: SplashScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const SplashScreen());
      case Routes.onboarding:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: OnboardingScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const OnboardingScreen());
      case Routes.role:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: RoleScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const RoleScreen());
      case Routes.login:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: LoginScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const LoginScreen());
      case Routes.helpAndSupport:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: HelpSupport()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const HelpSupport());
      case Routes.supportHistory:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: SupportHistory()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const SupportHistory());
      case Routes.signup:
        final args = settings.arguments as Map<String, dynamic>?;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ScreenTitle(
                  widget: SignUpScreen(
                    role: args?['trade'],
                    proffesion: args?['tradeQuestion'],
                  ),
                ),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => SignUpScreen(
                      role: args?['trade'],
                      proffesion: args?['tradeQuestion'],
                    ));
      case Routes.forgotPass:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: ForgotPassScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const ForgotPassScreen());
      case Routes.otpVerify:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: OtpVerifyScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const OtpVerifyScreen());
      case Routes.resetPass:
        final args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ScreenTitle(
                    widget: ResetPassScreen(
                  otp: args["otp"],
                )),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => ResetPassScreen(otp: args["otp"]));
      case Routes.otpSuccess:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: OtpSuccessScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const OtpSuccessScreen());
      case Routes.loading:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: Loading()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const Loading());
      case Routes.question:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: QuestionScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const QuestionScreen());
      case Routes.personalDetailsEdit:
        final args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ScreenTitle(
                    widget: PersonalDetailsEditScreen(
                  phoneNum: args['phone'],
                  address: args['address'],
                )),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => PersonalDetailsEditScreen(
                      phoneNum: args['phone'],
                      address: args['address'],
                    ));
      case Routes.bioEdit:
        final args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ScreenTitle(
                    widget: BioEditScreen(
                  bioDescription: args['bioDes'],
                  curntCompany: args['curntCompany'],
                  designation: args['designation'],
                  industry: args['industry'],
                  preferLocation: args['location'],
                )),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => BioEditScreen(
                      bioDescription: args['bioDes'],
                      curntCompany: args['curntCompany'],
                      designation: args['designation'],
                      industry: args['industry'],
                      preferLocation: args['location'],
                    ));
      case Routes.otherDetailsEdit:
        final args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ScreenTitle(
                    widget: OtherDetailsEditScreen(
                  kkeySkill: args['skill'],
                  language: args['language'],
                )),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => OtherDetailsEditScreen(
                      kkeySkill: args['skill'],
                      language: args['language'],
                    ));
      case Routes.experianceEdit:
        final args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ScreenTitle(
                    widget: ExperianceEditScreen(
                  id: args['id'],
                  crntCompanyName: args['companyName'],
                  designation: args['designation'],
                  startDate: args['startDate'],
                  endDate: args['endDate'],
                  employeetype: args['employeeTaype'],
                  jobLocation: args['location'],
                )),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => ExperianceEditScreen(
                      id: args['id'],
                      crntCompanyName: args['companyName'],
                      designation: args['designation'],
                      startDate: args['startDate'],
                      endDate: args['endDate'],
                      employeetype: args['employeeTaype'],
                      jobLocation: args['location'],
                    ));
      case Routes.changePass:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: ChangePassScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const ChangePassScreen());
      // case Routes.notification:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const ScreenTitle(widget: NotificationScreen()),
      //           settings: settings)
      //       : CupertinoPageRoute(
      //           builder: (context) => const NotificationScreen());
      case Routes.paymentHistory:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: PaymentHistoryScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const PaymentHistoryScreen());
      case Routes.profileEdit:
        final args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ScreenTitle(
                    widget: ProfileEditScreen(
                  name: args['name'],
                  email: args['email'],
                  image: args['image'],
                  proffession: args['proffession'],
                )),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => ProfileEditScreen(
                      name: args['name'],
                      email: args['email'],
                      image: args['image'],
                      proffession: args['proffession'],
                    ));

      case Routes.bottomNavScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: NavigationScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const NavigationScreen());
      case Routes.addNewExperiance:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: AddNewExperiance()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const AddNewExperiance());
      case Routes.securityScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: SecurityScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const SecurityScreen());
      case Routes.webview:
        final args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: WebviewHelper(
                  name: args["name"],
                  url: args["url"],
                ),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => WebviewHelper(
                      name: args["name"],
                      url: args["url"],
                    ));

      //========<>======<>=======<>=======<>=======<>=========
      //===============<><><>==============<><><><>===============
      // Pro Section

      case Routes.proNavBar:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: TardeNavigationScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const TardeNavigationScreen());
      case Routes.proDashboard:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: ProDashboardScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const ProDashboardScreen());
      case Routes.proSubscription:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: ProSubscriptionScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const ProSubscriptionScreen());
      case Routes.proMessage:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: ProMessageScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const ProMessageScreen());
      case Routes.proProfile:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: ProfileScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const ProfileScreen());
      case Routes.viewProfile:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: ViewProfileScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const ViewProfileScreen());
      case Routes.proNotification:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: ProNotificationScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const ProNotificationScreen());
      case Routes.proPaymnetHistory:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: ProPaymnetHistoryScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const ProPaymnetHistoryScreen());
      case Routes.proEditProfile:
        final args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ScreenTitle(
                    widget: TradeEditProfileScreen(
                  name: args['name'],
                  about: args['about'],
                  address: args['address'],
                  email: args['email'],
                  image: args['image'],
                  phoneNum: args['phone'],
                )),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => TradeEditProfileScreen(
                      name: args['name'],
                      about: args['about'],
                      address: args['address'],
                      email: args['email'],
                      image: args['image'],
                      phoneNum: args['phone'],
                    ));

      // case Routes.sliderWebViewPage:
      //   final args = settings.arguments as Map;
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget:
      //               SliderWebViewPage(title: args["title"], url: args["url"]),
      //           settings:
      //               settings) //_FadedTransitionRoute(builder: (context)=> const SobrenosScreen())
      //       : CupertinoPageRoute(
      //           builder: (context) =>
      //               SliderWebViewPage(title: args["title"], url: args["url"]));

      default:
        return null;
    }
  }
}

//  weenAnimationBuilder(
//   child: Widget,
//   tween: Tween<double>(begin: 0, end: 1),
//   duration: Duration(milliseconds: 1000),
//   curve: Curves.bounceIn,
//   builder: (BuildContext context, double _val, Widget child) {
//     return Opacity(
//       opacity: _val,
//       child: Padding(
//         padding: EdgeInsets.only(top: _val * 50),
//         child: child
//       ),
//     );
//   },
// );

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  _FadedTransitionRoute({required this.widget, required this.settings})
      : super(
          settings: settings,
          reverseTransitionDuration: const Duration(milliseconds: 1),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 1),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.ease,
              ),
              child: child,
            );
          },
        );
}

class ScreenTitle extends StatelessWidget {
  final Widget widget;

  const ScreenTitle({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: .5, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: widget,
    );
  }
}
