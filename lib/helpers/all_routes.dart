import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:lsebert/features/auth/forgot_password/presentation/forgot_pass_screen.dart';
import 'package:lsebert/features/auth/forgot_password/presentation/otp_success_screen.dart';
import 'package:lsebert/features/auth/forgot_password/presentation/otp_verify_screen.dart';
import 'package:lsebert/features/auth/forgot_password/presentation/reset_pass_screen.dart';
import 'package:lsebert/features/auth/login/presentation/login_screen.dart';
import 'package:lsebert/features/auth/signup/presentation/sign_up_screen.dart';
import 'package:lsebert/features/dashboard/presentation/dashboard_screen.dart';
import 'package:lsebert/features/intro/onboarding_screen.dart';
import 'package:lsebert/features/intro/role_screen.dart';
import 'package:lsebert/features/intro/splash_screen.dart';
import 'package:lsebert/features/message/presentation/message_screen.dart';
import 'package:lsebert/features/profile/presentation/bio_edit_screen.dart';
import 'package:lsebert/features/profile/presentation/change_pass_screen.dart';
import 'package:lsebert/features/profile/presentation/experiance_edit_screen.dart';
import 'package:lsebert/features/profile/presentation/other_details_edit.dart';
import 'package:lsebert/features/profile/presentation/personal_details_edit_screen.dart';
import 'package:lsebert/features/profile/presentation/profile_screen.dart';
import 'package:lsebert/features/question/presentation/question_screen.dart';
import 'package:lsebert/features/subscription/presentation/subscription_screen.dart';

final class Routes {
  static final Routes _routes = Routes._internal();
  Routes._internal();
  static Routes get instance => _routes;

  static const String dashboard = '/dashboard';
  static const String subscription = '/subscription';
  static const String message = '/message';
  static const String profile = '/profile';
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
  static const String personalDetailsEdit = '/personalDetailsEdit';
  static const String bioEdit = '/bioEdit';
  static const String otherDetailsEdit = '/otherDetailsEdit';
  static const String experianceEdit = '/experianceEdit';
   static const String changePass = '/changePass';
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
      case Routes.signup:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: SignUpScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const SignUpScreen());
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
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: ResetPassScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const ResetPassScreen());
      case Routes.otpSuccess:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: OtpSuccessScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const OtpSuccessScreen());
      case Routes.question:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: QuestionScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const QuestionScreen());
      case Routes.personalDetailsEdit:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: PersonalDetailsEditScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const PersonalDetailsEditScreen());
      case Routes.bioEdit:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: BioEditScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const BioEditScreen());
      case Routes.otherDetailsEdit:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: OtherDetailsEditScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const OtherDetailsEditScreen());
      case Routes.experianceEdit:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: ExperianceEditScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const ExperianceEditScreen());
                case Routes.changePass:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: ChangePassScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const ChangePassScreen());

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
