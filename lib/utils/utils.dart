import 'package:flutter/material.dart';

class Utils {
  Utils._();

  static onWidgetBuildDone(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await callback.call();
    });
  }
}