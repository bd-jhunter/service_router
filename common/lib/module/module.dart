import 'package:dartin/dartin.dart';
import 'package:flutter/material.dart';

abstract class FlutterModule {
  //Return all routes of your module, please include your module name into the route key to avoid duplication with other modules
  Map<String, WidgetBuilder> get routes;

  //Return all injection modules of your module
  //If your module doesn't us dartin, return [] or null
  List<Module> get injections;

  //Return all navigator observers of your module
  //If your module doesn't need to listen to the route change, return [] or null
  List<NavigatorObserver> get navigatorObservers;

  ///Return a function to handle the exceptions caught by *[CrashReporter], this function return true means you consume the error and this error will not be reported to bugly.
  ///If your module doesn't need to handle error, return null
  bool Function(dynamic error) get errorHandler;

  //You can initialize your module by override this method, don't initialize your module in construct method.
  prepare() async{

  }
}