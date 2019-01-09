import 'dart:io' show Platform;

class DeviceInfo {

  static bool isAppleDevice() {
    return isIosDevice() || isMacOSDevice();
  }

  static bool isIosDevice() {
    return Platform.isIOS;
  }

  static bool isMacOSDevice() {
    return Platform.isMacOS;
  }

  static bool isAndroidDevice() {
    return Platform.isAndroid;
  }
}
