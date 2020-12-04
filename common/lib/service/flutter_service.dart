typedef ServiceCallback = void Function(Map<String, dynamic> result);

abstract class FlutterService {
  String get name;
  void sayHello();
}

abstract class HostService extends FlutterService {
  void showHomePage();
  void showSettingPage();
}

abstract class HomePageService extends FlutterService {
  int get visitorCount;
}

abstract class SettingService extends FlutterService {
  bool get isLogin;
}