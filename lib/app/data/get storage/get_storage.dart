import 'package:get_storage/get_storage.dart';

class Storage {
  const Storage._();

  static final GetStorage storage = GetStorage();

  static Future<void> saveValue(String key, dynamic value) =>
      storage.write(key, value);

  static T? getValue<T>(String key) => storage.read<T>(key);

  static bool hasData(String key) => storage.hasData(key);

  static Future<void> removeValue(String key) => storage.remove(key);

  static Future<void> clearStorage() => storage.erase();

  static bool get isAppOpened =>
      Storage.hasData('First') && Storage.getValue('First');
  static Future<void> setAppOpened() => Storage.saveValue('First', true);
}
