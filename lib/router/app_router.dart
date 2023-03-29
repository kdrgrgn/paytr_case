import 'package:flutter/material.dart';
import 'package:paytr_case/main.dart';


class AppRouter {


 static Future<dynamic> normalNavigate<T extends Object>(
    Widget widget, {
    BuildContext? context,
    Object? args,
    bool fullScreenDialog = false,
    bool maintainState = true,
  }) {
    return Navigator.of(context ?? appKey.currentContext!)
        .push(MaterialPageRoute(
      fullscreenDialog: fullScreenDialog,
      maintainState: maintainState,
      builder: (context) => widget,
      settings: RouteSettings(name: widget.toString(), arguments: args),
    ));
  }

  static Future<dynamic> navigateAndReplace<T extends Object>(
    Widget widget, {
    BuildContext? context,
    Object? args,
    bool fullScreenDialog = false,
    bool maintainState = true,
  }) {
    return Navigator.of(context ?? appKey.currentContext!)
        .pushReplacement(MaterialPageRoute(
      fullscreenDialog: fullScreenDialog,
      maintainState: maintainState,
      builder: (context) => widget,
      settings: RouteSettings(name: widget.toString(), arguments: args),
    ));
  }

 static Future<dynamic> navigateAndRemoveUntil<T extends Object>(
    Widget widget, {
    BuildContext? context,
    Object? args,
    bool fullScreenDialog = false,
    bool maintainState = true,
    bool Function(Route<dynamic>)? predicate,
  }) {
    return Navigator.of(context??appKey.currentContext!).pushAndRemoveUntil(
      MaterialPageRoute(
        fullscreenDialog: fullScreenDialog,
        maintainState: maintainState,
        builder: (context) => widget,
        settings: RouteSettings(name: widget.toString(), arguments: args),
      ),
      predicate ?? (Route<dynamic> route) => false,
    );
  }



}