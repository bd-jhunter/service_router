import 'package:common/module/module.dart';
import 'package:common/ui/splash_widget.dart';
import 'package:dartin/dartin.dart' as di;
import 'package:flutter/material.dart';

const ROUTE_SPLASH = '/';

class CommonModule extends FlutterModule{
  @override
  List<di.Module> get injections => [];

  @override
  Map<String, WidgetBuilder> get routes => {
    ROUTE_SPLASH: (_) => SplashWidget(),
  };

  @override
  List<NavigatorObserver> get navigatorObservers => <NavigatorObserver>[];

  @override
  bool Function(dynamic error) get errorHandler => null;

  @override
  void prepare() async{
    
  }
}