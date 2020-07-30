import 'package:flutterintexspa/route/bundle.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

typedef Widget HandlerFunc(
    BuildContext context, Map<String, List<String>> parameters);

typedef Widget PageBuilderFunc(Bundle bundle);

class PageBuilder {
  final PageBuilderFunc builder;
  HandlerFunc handlerFunc;

  PageBuilder({this.builder}) {
    this.handlerFunc = (context, _) {
      return this.builder(ModalRoute.of(context).settings.arguments as Bundle);
    };
  }

  Handler getHandler() {
    return Handler(handlerFunc: this.handlerFunc);
  }
}
