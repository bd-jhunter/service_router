import 'package:common/service/flutter_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatefulWidget {
  final ContainerWidgetState _state;

  ContainerWidget({Key key, @required List<ITopPage> pages})
      : _state = ContainerWidgetState(pages),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _state;
}

class ContainerWidgetState extends State<ContainerWidget> {
  final List<ITopPage> _pages;
  final PageController _pageController = TabBarController().pageController;
  int _currentIndex = 0;

  ContainerWidgetState(this._pages) {
    TabBarController().changeTabBarSelection = _onPageChanged;
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('我是一个Flutter，而且我的Host Module'),
      ),
      bottomNavigationBar: Offstage(child: BottomNavigationBar(
        fixedColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onPageChanged,
        items: _pages.map((e) => BottomNavigationBarItem(icon: e.icon, label: e.title)).toList(),
      ),
        offstage: false,
      ),
      body: _pageView(context),
    );
  }

  void openTab(int index) {
    _pageController.jumpToPage(index);
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _pageView(BuildContext context) {
    return PageView(
      children: _pages.map((e) => e.body(context)).toList(),
      controller: _pageController,
    );
  }

  void _onPageChanged(int index) {
    openTab(index);
  }

}

class TabBarController {
  factory TabBarController() => _sharedInstance();
  final PageController pageController = PageController();

  static TabBarController _shared = TabBarController._();
  TabBarController._();

  static TabBarController _sharedInstance() => _shared;

  Function(int index) changeTabBarSelection;

  void switchTabBar(int index) {
    changeTabBarSelection(index);
    //pageController.animateToPage(index, duration: Duration(milliseconds: 150), curve: Curves.easeInOut);
    // return;
    // pageController.jumpToPage(index);
  }
}