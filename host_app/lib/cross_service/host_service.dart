import 'package:common/service/flutter_service.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:host_app/ui/container_widget.dart';

class HostServiceImpl extends HostService {
  @override
  String get name => 'Host，应该用不上';

  @override
  void sayHello() {
  }

  @override
  void showHomePage() {
    TabBarController().switchTabBar(0);
  }

  @override
  void showSettingPage() {
    TabBarController().switchTabBar(1);
  }

  @override
  Widget buildTopWidget(BuildContext context) {
    throw UnimplementedError();
  }

}