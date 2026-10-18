import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoService {
  final PackageInfo _packageInfo;

  PackageInfoService(this._packageInfo);

  static Future<PackageInfoService> init() async {
    final info = await PackageInfo.fromPlatform();
    return PackageInfoService(info);
  }

  String get appName => _packageInfo.appName;
  String get packageName => _packageInfo.packageName;
  String get version => _packageInfo.version;
  String get buildNumber => _packageInfo.buildNumber;
  String get fullVersion => '$version+$buildNumber';
}
