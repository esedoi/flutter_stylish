import 'package:flutter/services.dart';

// const platform = const MethodChannel('myChannel');
final platform = MethodChannel('com.example.channel');



Future<String> getNativeString() async {
  try {
    String result = await platform.invokeMethod('getNativeString');
print(result);
    return result;
  } on PlatformException catch (e) {
    return "Failed to get native string: ${e.message}";
  }
}