import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'global.dart';

class Utils {
  static toastMessages({String? message}) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(message ?? ""),
        action: SnackBarAction(
          label: "Notification",
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      ),
    );

    // Get.snackbar(
    //   "Notification",
    //   message!,
    //   snackPosition: SnackPosition.BOTTOM,
    //   // Show at bottom
    //   backgroundColor:
    //       Get.theme.snackBarTheme.backgroundColor ?? const Color(0xFF323232),
    //   // Default dark background
    //   colorText:
    //       Get.theme.snackBarTheme.actionTextColor ?? const Color(0xFFFFFFFF),
    //   // White text
    //   margin: const EdgeInsets.all(10),
    //   // Adds margin around snackbar
    //   duration: const Duration(seconds: 3), // Display time
    // );
  }

  static snackBarMessages({String? title, String? message}) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(message ?? ""),
        action: SnackBarAction(
          label: title ?? "",
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      ),
    );
    // Get.snackbar(title!, message!, snackPosition: SnackPosition.BOTTOM);
  }

  static dynamic printOnError({dynamic data}) {
    if (kDebugMode) {
      return print("OnError Block :: ${data.toString()}");
    }
  }

  static dynamic printStatement({dynamic data}) {
    if (kDebugMode) {
      return print("Here Your Print Statement ::: $data");
    }
  }

  static dynamic printRequestLogs({String? url, dynamic data}) {
    if (kDebugMode) {
      return print("API REQUEST BODY :: ${data.toString()} \nURL ::$url");
    }
  }

  static dynamic printResponseLogs({dynamic data}) {
    if (kDebugMode) {
      return print("API RESPONSE BODY :: ${data.toString()}");
    }
  }

  static dynamic printExceptionLogs({dynamic data}) {
    if (kDebugMode) {
      return print("Exception :: ${data.toString()}");
    }
  }
}
