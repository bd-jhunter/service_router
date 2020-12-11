import 'package:common/service/flutter_service.dart';
import 'package:dartin/dartin.dart';

class ServiceCenter {
  factory ServiceCenter() => _getInstance();

  static ServiceCenter get shared => _getInstance();

  static ServiceCenter _instance;

  HostService _hostService;
  HomePageService _homePageService;
  SettingService _settingService;
  bool _hasLoaded = false;

  ServiceCenter._internal();
  static ServiceCenter _getInstance() {
    if (_instance == null) {
      _instance = ServiceCenter._internal();
    }

    return _instance;
  }

  HostService get hostService {
    if (!_hasLoaded) {
      _prepare();
    }

    return _hostService;
  }

  HomePageService get homePageService {
    if (!_hasLoaded) {
      _prepare();
    }

    return _homePageService;
  }
  
  SettingService get settingService {
    if (!_hasLoaded) {
      _prepare();
    }

    return _settingService;
  }

  void _prepare() {
    try {
      _hostService = inject<HostService>();
      _homePageService = inject<HomePageService>();
      _settingService = inject<SettingService>();
    } catch (e) {
      print('Catch exception will prepare services: $e');
    } finally {
      _hasLoaded = true;
    }
  }
}