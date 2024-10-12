import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'prefs_singleton.g.dart';

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPrefsSingleton(Ref ref) {
  return SharedPreferences.getInstance();
}
