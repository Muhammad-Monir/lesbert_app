/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/boost_icon.png
  AssetGenImage get boostIcon =>
      const AssetGenImage('assets/icons/boost_icon.png');

  /// File path: assets/icons/camera_icon.png
  AssetGenImage get cameraIcon =>
      const AssetGenImage('assets/icons/camera_icon.png');

  /// File path: assets/icons/dashboard_icon.png
  AssetGenImage get dashboardIcon =>
      const AssetGenImage('assets/icons/dashboard_icon.png');

  /// File path: assets/icons/duration.png
  AssetGenImage get duration =>
      const AssetGenImage('assets/icons/duration.png');

  /// File path: assets/icons/email_icon.png
  AssetGenImage get emailIcon =>
      const AssetGenImage('assets/icons/email_icon.png');

  /// File path: assets/icons/experience.png
  AssetGenImage get experience =>
      const AssetGenImage('assets/icons/experience.png');

  /// File path: assets/icons/flameIcon.png
  AssetGenImage get flameIcon =>
      const AssetGenImage('assets/icons/flameIcon.png');

  /// File path: assets/icons/google_icon.png
  AssetGenImage get googleIcon =>
      const AssetGenImage('assets/icons/google_icon.png');

  /// File path: assets/icons/location.png
  AssetGenImage get location =>
      const AssetGenImage('assets/icons/location.png');

  /// File path: assets/icons/lock_icon.png
  AssetGenImage get lockIcon =>
      const AssetGenImage('assets/icons/lock_icon.png');

  /// File path: assets/icons/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/icons/logo.png');

  /// File path: assets/icons/message_icon.png
  AssetGenImage get messageIcon =>
      const AssetGenImage('assets/icons/message_icon.png');

  /// File path: assets/icons/notofocation.svg
  String get notofocation => 'assets/icons/notofocation.svg';

  /// File path: assets/icons/person_icon.png
  AssetGenImage get personIcon =>
      const AssetGenImage('assets/icons/person_icon.png');

  /// File path: assets/icons/profile_icon.png
  AssetGenImage get profileIcon =>
      const AssetGenImage('assets/icons/profile_icon.png');

  /// File path: assets/icons/subscription_icon.png
  AssetGenImage get subscriptionIcon =>
      const AssetGenImage('assets/icons/subscription_icon.png');

  /// File path: assets/icons/tick_circle.png
  AssetGenImage get tickCircle =>
      const AssetGenImage('assets/icons/tick_circle.png');

  /// File path: assets/icons/totalConnect.png
  AssetGenImage get totalConnect =>
      const AssetGenImage('assets/icons/totalConnect.png');

  /// List of all assets
  List<dynamic> get values => [
        boostIcon,
        cameraIcon,
        dashboardIcon,
        duration,
        emailIcon,
        experience,
        flameIcon,
        googleIcon,
        location,
        lockIcon,
        logo,
        messageIcon,
        notofocation,
        personIcon,
        profileIcon,
        subscriptionIcon,
        tickCircle,
        totalConnect
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/onboard_image1.png
  AssetGenImage get onboardImage1 =>
      const AssetGenImage('assets/images/onboard_image1.png');

  /// File path: assets/images/onboarding_image2.png
  AssetGenImage get onboardingImage2 =>
      const AssetGenImage('assets/images/onboarding_image2.png');

  /// File path: assets/images/onboarding_image3.png
  AssetGenImage get onboardingImage3 =>
      const AssetGenImage('assets/images/onboarding_image3.png');

  /// File path: assets/images/onboarding_image4.png
  AssetGenImage get onboardingImage4 =>
      const AssetGenImage('assets/images/onboarding_image4.png');

  /// File path: assets/images/otp_success_flower.png
  AssetGenImage get otpSuccessFlower =>
      const AssetGenImage('assets/images/otp_success_flower.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        onboardImage1,
        onboardingImage2,
        onboardingImage3,
        onboardingImage4,
        otpSuccessFlower
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
