import 'package:common/module/module.dart';
import 'package:common/service/flutter_service.dart';
import 'package:dartin/dartin.dart';
import 'package:flutter/widgets.dart';
import 'package:setting/cross_service/setting_service.dart';

class SettingModule extends FlutterModule {
  final _modules = Module([
    single<SettingService>(({params}) => SettingServiceImpl()),
  ]);

  @override
  bool Function(dynamic error) get errorHandler => null;

  @override
  List<Module> get injections => [_modules];

  @override
  List<NavigatorObserver> get navigatorObservers => [];

  @override
  Map<String, WidgetBuilder> get routes => settingRoutes;

}

final settingRoutes = <String, WidgetBuilder> {
};