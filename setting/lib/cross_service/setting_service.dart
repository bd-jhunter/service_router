import 'package:common/service/flutter_service.dart';
import 'package:setting/ui/setting_widget.dart';

class SettingServiceImpl extends SettingService {
  @override
  bool get isLogin => true;

  @override
  String get name => 'Setting';

  @override
  void sayHello() {
    print('Hello, I am $name');
  }

  @override
  ITopPage get topPage => SettingPage();

}
