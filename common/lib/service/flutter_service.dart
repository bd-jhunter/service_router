import 'package:flutter/material.dart';

typedef ServiceCallback = void Function(Map<String, dynamic> result);

mixin ITopPage {
  String get title;
  Widget get icon;
  Widget body(BuildContext context);
}

abstract class FlutterService {
  String get name;
  void sayHello();
}

abstract class HostService extends FlutterService {
  void showHomePage();
  void showSettingPage();
}

abstract class HomePageService extends FlutterService {
  ITopPage get topPage;
  int get visitorCount;
}

abstract class SettingService extends FlutterService {
  ITopPage get topPage;
  bool get isLogin;
}
