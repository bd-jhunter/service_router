import 'package:common/module/app_launcher.dart';
import 'package:flutter/widgets.dart';
import 'package:homepage/module/homepage_module.dart';
import 'package:host_app/module/host_module.dart';
import 'package:host_app/ui/container_widget.dart';
import 'package:setting/module/setting_module.dart';

GlobalKey<ContainerWidgetState> tabBarKey = GlobalKey<ContainerWidgetState>();

void main() {
  registerModule(HostModule());
  registerModule(HomepageModule());
  registerModule(SettingModule());
  launchApp();
}
