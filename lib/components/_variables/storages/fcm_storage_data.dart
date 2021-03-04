import 'package:base_project/components/_variables/storages/storage_data.dart';

class FCMStorageData extends StorageData {
  /// Notifications
  static Future<bool> getNotificationFlag() {
    return StorageData.getValue("NotificationFlag");
  }

  static Future<void> enableNotificationFlag() {
    return StorageData.setValue("NotificationFlag", true);
  }

  static Future<void> disableNotificationFlag() {
    return StorageData.setValue("NotificationFlag", false);
  }

  /// Token firebase
  static Future<String> getToken() async {
    var token = await StorageData.getValue("Token");
    return token != null ? token.toString() : null;
  }

  static Future<void> setToken(String token) {
    return StorageData.setValue("Token", token);
  }

  static Future<void> removeToken() {
    return StorageData.deleteValue("Token");
  }

  /// DeviceId UUID
  static Future<String> getDeviceId() async {
    var deviceId = await StorageData.getValue("DeviceId");
    return deviceId != null ? deviceId.toString() : null;
  }

  static Future<void> setDeviceId(String deviceId) {
    return StorageData.setValue("DeviceId", deviceId);
  }

  static Future<void> removeDeviceId() {
    return StorageData.deleteValue("DeviceId");
  }
}
