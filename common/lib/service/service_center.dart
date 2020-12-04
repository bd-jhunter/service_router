import 'package:common/service/flutter_service.dart';
import 'package:dartin/dartin.dart';

class ServiceCenter {
  factory ServiceCenter() => _getInstance();

  static ServiceCenter get shared => _getInstance();

  static ServiceCenter _instance;

  HostService _hostService;
  HomePageService _homePageService;
  SettingService _settingService;

  ServiceCenter._internal() {
    _prepare();
  }
  static ServiceCenter _getInstance() {
    if (_instance == null) {
      _instance = ServiceCenter._internal();
    }

    return _instance;
  }

  void _prepare() {
    try {
      _hostService = inject<HostService>();
      _homePageService = inject<HomePageService>();
      _settingService = inject<SettingService>();
    } catch (e) {
      print('Catch exception will prepare services: $e');
    }
  }
}