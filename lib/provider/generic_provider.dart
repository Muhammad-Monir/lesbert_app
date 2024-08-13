import 'package:flutter/foundation.dart';

class GenericDi extends ChangeNotifier {
  String? _appVersion;
  String? _buildNo;

  String? get appVersion => _appVersion;
  String? get buildNo => _buildNo;

  set setAppVersion(String version) => _appVersion = version;
  set setBuildNo(String buildNo) => _buildNo = buildNo;
}
