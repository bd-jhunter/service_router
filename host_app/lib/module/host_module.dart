import 'package:common/module/module.dart';
import 'package:common/service/flutter_service.dart';
import 'package:common/service/service_center.dart';
import 'package:dartin/dartin.dart';
import 'package:flutter/widgets.dart';
import 'package:host_app/cross_service/host_service.dart';
import 'package:host_app/main.dart';
import 'package:host_app/ui/container_widget.dart';

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
  Map<String, WidgetBuilder> get routes => hostRoutes;

}

const String ROUTE_HOST_ROOT = '/host/rootPage';

final hostRoutes = <String, WidgetBuilder> {
  ROUTE_HOST_ROOT: (context) {
    final ServiceCenter serviceCenter = ServiceCenter.shared;
    final HomePageService homePageService = serviceCenter.homePageService;
    final SettingService settingService = serviceCenter.settingService;
    List<ITopPage> pages = [homePageService.topPage, settingService.topPage];
    return ContainerWidget(key: tabBarKey, pages: pages);
  },
};