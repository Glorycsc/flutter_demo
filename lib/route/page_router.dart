import 'package:flutterintexspa/route/page_routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

class PageRouter {
   // 全局key
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static final router = Router();



  static setupRoutes() {
    pageRoutes.forEach((path, handler) {
      router.define(
          path, handler: handler.getHandler(),
          transitionType: TransitionType.inFromRight);
    });
  }
}