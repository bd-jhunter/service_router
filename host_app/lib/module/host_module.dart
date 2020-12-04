import 'package:common/module/module.dart';
import 'package:common/service/flutter_service.dart';
import 'package:dartin/dartin.dart';
import 'package:flutter/widgets.dart';
import 'package:host_app/cross_service/host_service.dart';

class HostModule extends FlutterModule {
  final _modules = Module([
    single<HostService>(({params}) => HostServiceImpl()),
  ]);

  @override
  bool Function(dynamic error) get errorHandler => null;

  @override
  List<Module> get injections => [_modules];

  @override
  List<NavigatorObserver> get navigatorObservers => [];

  @override
  Map<String, WidgetBuilder> get routes => Map<String, WidgetBuilder>();

}