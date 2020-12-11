import 'package:common/service/flutter_service.dart';
import 'package:homepage/ui/homepage_widget.dart';

class HomepageServiceImpl extends HomePageService {
  int _visitorCount = 0;

  @override
  String get name => 'Homepage';

  @override
  void sayHello() {
    print('Hello, I am $name');
  }

  @override
  ITopPage get topPage => HomePageWidget();

  @override
  int get visitorCount => _visitorCount;

}