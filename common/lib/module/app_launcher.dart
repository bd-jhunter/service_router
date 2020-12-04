import 'package:common/config/navigator_config.dart';
import 'package:common/module/common_module.dart';
import 'package:dartin/dartin.dart';
import 'package:flutter/material.dart';

import 'module.dart';

List<FlutterModule> _modules = [];
void registerModule(FlutterModule module) => _modules.add(module);

void launchApp() async{
  registerModule(CommonModule());
  WidgetsFlutterBinding.ensureInitialized();
  startDartIn(_allInjectionModules);
  await _prepareModules();
  runApp(MyApp());
}

List<Module> get _allInjectionModules {
  final injectionModules = <Module>[];
  _modules.forEach((element) => injectionModules.addAll(element.injections ?? []));
  return injectionModules;
}

class MyApp extends StatelessWidget {
  static const String _title = 'Cross Module Serice';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigatorConfig.navigatorKey,
      title: _title,
      initialRoute: ROUTE_SPLASH,
      routes: _allRoutes,
      navigatorObservers: _allNavigatorObservers,
    );
  }
}

Map<String, WidgetBuilder> get _allRoutes {
  final routes = <String, WidgetBuilder>{};
  _modules.forEach((element) => routes.addAll(element.routes ?? {}));
  return routes;
}

List<NavigatorObserver> get _allNavigatorObservers {
  final navigatorObservers = <NavigatorObserver>[];
  _modules.forEach((element) => navigatorObservers.addAll(element.navigatorObservers ?? []));
  return navigatorObservers;
}

_prepareModules() async{
  for(var module in _modules){
    await module.prepare();
  }
}



