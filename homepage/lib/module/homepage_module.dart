import 'package:common/module/module.dart';
import 'package:common/service/flutter_service.dart';
import 'package:dartin/dartin.dart';
import 'package:flutter/widgets.dart';
import 'package:homepage/cross_service/homepage_service.dart';

class HomepageModule extends FlutterModule {
  final _modules = Module([
    single<HomePageService>(({params}) => HomepageServiceImpl()),
  ]);

  @override
  bool Function(dynamic error) get errorHandler => null;

  @override
  List<Module> get injections => [_modules];

  @override
  List<NavigatorObserver> get navigatorObservers => [];

  @override
  Map<String, WidgetBuilder> get routes => homepageRoutes;

}

final homepageRoutes = <String, WidgetBuilder> {
};