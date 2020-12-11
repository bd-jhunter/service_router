import 'package:common/service/flutter_service.dart';
import 'package:common/service/service_center.dart';
import 'package:flutter/material.dart';
import 'package:homepage/ui/jh_button.dart';

class HomePageWidget extends StatefulWidget with ITopPage {

  @override
  Widget body(BuildContext context) => this;

  @override
  String get title => '首页';

  @override
  Widget get icon => Icon(Icons.home);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageWidget> with AutomaticKeepAliveClientMixin {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      // width: double.infinity,
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '我是首页，我是一级页面',
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
              child: Text(
            '$_count',
            style: Theme.of(context).textTheme.headline4,
          )),
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ),
          JHButtons.applyButton(
            title: '调用setting service的say hello',
            height: 45,
            fontSize: 16,
            onPressed: () => _pressSomeButton(context),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: JHButtons.applyButton(
              onPressed: _switchTab,
              title: '切换到setting',
              height: 45,
            ),
          ),
        ],
      ),
    );
  }

  // Private methods
  void _pressSomeButton(BuildContext context) {
    print('I am Homepage, some button had been pressed.');
    final SettingService service = ServiceCenter.shared.settingService;
    service.sayHello();
  }

  void _switchTab() {
    final HostService hostService = ServiceCenter.shared.hostService;
    hostService?.showSettingPage();
  }

  void _incrementCounter() {
    setState(() {
      _count++;
    });
  }

  @override
  bool get wantKeepAlive => true;
}