import 'package:flutter/material.dart';

import '../utils/global.dart';

class LoadingHandler {
  static final LoadingHandler _instance = LoadingHandler._internal();

  factory LoadingHandler() => _instance;

  LoadingHandler._internal();

  bool _isShowing = false;

  void showLoading() {
    if (!_isShowing) {
      _isShowing = true;
      showDialog(
        context: navigatorKey.currentContext!,
        barrierDismissible: false,
        builder: (_) => const Center(child: CircularProgressIndicator()),
      );
    }
  }

  void hideLoading() {
    if (_isShowing) {
      _isShowing = false;
      navigatorKey.currentState!.pop();
    }
  }

  bool get isLoading => _isShowing;
}
