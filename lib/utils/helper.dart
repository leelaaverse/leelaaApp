import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/app_colors.dart';
import '../widget/custom_appbar.dart';
import 'global.dart';

mixin Helper {
  // Screen dimensions
  double get screenWidth =>
      MediaQuery
          .of(navigatorKey.currentContext!)
          .size
          .width;

  double get screenHeight =>
      MediaQuery
          .of(navigatorKey.currentContext!)
          .size
          .height;

  String capitalizeFirstLetter(String value) {
    if (value.isEmpty) {
      return "";
    }
    return "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
  }

  String getFirstLetter(String? value) {
    if (value == null) {
      return "";
    } else {
      return value.replaceRange(1, value.length, "").toUpperCase();
    }
  }

  callBackScreen() {
    navigatorKey.currentState!.pop();
  }

  callNextScreen(Widget next) async {
    // await navigatorKey.currentState!.push(
    //   MaterialPageRoute(builder: (context) => next),
    // );

    // await Navigator.push(
    //   navigatorKey.currentContext!,
    //   PageRouteBuilder(
    //     pageBuilder: (context, animation, secondaryAnimation) => next,
    //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //       var begin = Offset(1.0, 0.0); // Start from right
    //       var end = Offset.zero; // End at original position
    //       var curve = Curves.ease; // Animation curve
    //
    //       var tween = Tween(
    //         begin: begin,
    //         end: end,
    //       ).chain(CurveTween(curve: curve));
    //
    //       return SlideTransition(
    //         position: animation.drive(tween),
    //         child: child,
    //       );
    //     },
    //     transitionDuration: Duration(
    //       milliseconds: 400,
    //     ), // Optional: custom duration
    //   ),
    // );

    await Navigator.push(navigatorKey.currentContext!, _CustomPageRoute(next));
  }


  callNextAndReplaceScreen(Widget next) {
    navigatorKey.currentState!.pushReplacement(
      MaterialPageRoute(builder: (context) => next),
    );
  }

  callNextAndClearStack(Widget next) {
    navigatorKey.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => next),
          (route) => false,
    );
  }

  DateTime? changeToDateTime(String? date) {
    if ((date ?? "").isEmpty) {
      return null;
    }
    DateTime dateTime = DateTime.parse(date!);
    DateTime localDateTime = dateTime.toLocal();

    String formattedDate = DateFormat("MMM dd,yyyy").format(localDateTime);

    print(formattedDate);
    return localDateTime;
  }

  String changeDateFormat(String? date) {
    if (date != null) {
      if (date.isEmpty) {
        return "";
      }
      DateTime dateTime = DateTime.parse(date);
      DateTime localDateTime = dateTime.toLocal();

      String formattedDate = DateFormat("MMM dd,yyyy").format(localDateTime);

      print(formattedDate);
      return formattedDate;
    } else {
      return "";
    }
  }

  Widget no_data_found_widget(String image,
      String title,
      String msg, {
        double imageHeight = 80,
        double imageWidth = 80,
        double titleSize = 18,
        double desSize = 14,
      }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, width: imageWidth, height: imageHeight),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(fontSize: titleSize, fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            msg,
            style: TextStyle(
              fontSize: desSize,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  showSuccessPopUp(String msg, {
    String title = "Success",
    bool backScreen = false,
    VoidCallback? okPress,
  }) {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            title,
            style: TextStyle(color: AppColors.black, fontSize: 16),
          ),
          content: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(msg, style: TextStyle(fontSize: 16)),
          ),
          actions: [
            TextButton(
              onPressed:
              okPress ??
                      () {
                    if (backScreen) {
                      navigatorKey.currentState!.pop();
                    }
                    navigatorKey.currentState!.pop();
                  },
              child: Text("okay", style: TextStyle(color: AppColors.black)),
            ),
          ],
        );
      },
    );
  }

  showErrorPopUp(String msg, {String title = "Error"}) {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            title,
            style: TextStyle(color: AppColors.appColor, fontSize: 16),
          ),
          content: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              removeExceptionText(msg),
              style: TextStyle(fontSize: 16),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                navigatorKey.currentState!.pop();
              },
              child: Text("okay", style: TextStyle(color: AppColors.black)),
            ),
          ],
        );
      },
    );
  }

  showAlertPopUp({required String msg, required String title}) {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            title,
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              removeExceptionText(msg),
              style: TextStyle(fontSize: 16),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                navigatorKey.currentState!.pop();
              },
              child: Text("okay", style: TextStyle(color: AppColors.black)),
            ),
          ],
        );
      },
    );
  }

  showYesNoPopUp({
    required String msg,
    required String title,
    VoidCallback? onYesPress,
  }) {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            title,
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              removeExceptionText(msg),
              style: TextStyle(fontSize: 16),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                navigatorKey.currentState!.pop();
              },
              child: Text("No", style: TextStyle(color: AppColors.primary2)),
            ),
            TextButton(
              onPressed:
              onYesPress ??
                      () {
                    navigatorKey.currentState!.pop();
                  },
              child: Text(
                "Yes",
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  loadingDialog() {
    showDialog(
      barrierDismissible: false,
      context: navigatorKey.currentContext!,
      builder: (context) {
        return const Center(
          child: CupertinoActivityIndicator(color: AppColors.white, radius: 15),
        );
      },
    );
  }

  String removeExceptionText(String error) {
    return error.toString().contains("Exception")
        ? error.toString().replaceAll("Exception:", "").trim()
        : error;
  }

  bool isEmailValid(String value) {
    return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(value);
  }

  String pdfFileNameToShow(String name) {
    //"menus-1755...6224.pdf"

    if (name.length > 30) {
      return name.replaceRange(15, name.length - 12, "....");
    }

    return name;
  }

  callSnackBar(msg, {String title = "Validation Error"}) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(msg ?? ""),
        // action: SnackBarAction(
        //   label: title,
        //   onPressed: () {
        //     // Some code to undo the change.
        //   },
        // ),
      ),
    );
    // Get.snackbar(
    //   title,
    //   msg,
    //   snackPosition: SnackPosition.BOTTOM,
    //   backgroundColor: AppColors.appColor,
    //   // Vibrant background color
    //   colorText: AppColors.screenWhite,
    //   // Text color for contrast
    //   icon: Icon(Icons.error_outline, color: AppColors.screenWhite),
    //   // Icon to grab attention
    //   borderRadius: 20,
    //   // Rounded corners for a smoother look
    //   margin: EdgeInsets.all(10),
    //   // Margin around the snackbar
    //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    //   // Padding inside the snackbar
    //   duration: Duration(seconds: 3),
    //   // Longer duration to keep it visible
    //   isDismissible: true,
    //   // Allow dismissal
    //   forwardAnimationCurve: Curves.easeOut,
    //   // Animation curve for smooth appearance
    //   reverseAnimationCurve:
    //       Curves.easeIn, // Animation curve for smooth dismissal
    // );
  }

  Widget whiteCustomContainer(VoidCallback onPressed,
      double width,
      double height,
      Widget child,) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        // Add padding instead of forcing width
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 4, color: AppColors.black),
            top: BorderSide(width: 1, color: AppColors.black),
            right: BorderSide(width: 1, color: AppColors.black),
            left: BorderSide(width: 1, color: AppColors.black),
          ),
          borderRadius: BorderRadius.circular(30),
          color: AppColors.white,
        ),
        child: child,
      ),
    );
  }

  Future<void> launchDialPad(String phoneNumber) async {
    final Uri dialUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(dialUri)) {
      await launchUrl(dialUri);
    } else {
      throw 'Could not launch $dialUri';
    }
  }

  void openUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> sendEmail(String mail) async {
    final Uri emailLaunchUri = Uri(scheme: 'mailto', path: mail);

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri, mode: LaunchMode.externalApplication);
    } else {
      print('Could not launch $emailLaunchUri');
    }
  }

  String getAvatar() {
    final List<String> list = [
      "assets/images/av1.png",
      "assets/images/av2.png",
      "assets/images/av3.png",
      "assets/images/av4.png",
      "assets/images/av5.png",
      "assets/images/av6.png",
      "assets/images/av7.png",
    ];
    var image = list.elementAt(Random().nextInt(list.length));
    print("image");
    print(image);
    return image;
  }

  Widget networkImageWidget(String src, {
    double width = 80,
    double height = 80,
    BoxFit fit = BoxFit.cover,
  }) {
    return CachedNetworkImage(
      imageUrl: src,
      height: height,
      width: width,
      fit: fit,
      errorWidget: (context, url, error) {
        return Image.asset(
          "assets/images/splash_back.png",
          height: height,
          width: width,
          fit: fit,
        );
      },
      progressIndicatorBuilder: (context, url, progress) {
        return Container(
          color: Colors.grey,
          height: height,
          width: width,
          child: Center(
            child: CircularProgressIndicator(color: AppColors.appColor),
          ),
        );
      },
    );
  }

  bool isAndroidGestureNavigationEnabled(BuildContext context) {
    if (Platform.isAndroid) {
      final value = MediaQuery
          .of(context)
          .systemGestureInsets
          .bottom;
      return value < 48.0 && value != 0.0;
    } else {
      return true;
    }
  }

  Future<String?> selectDate(String? date) async {
    final DateTime? picked = await showCupertinoDatePicker(
      navigatorKey.currentContext!,
      selectedDate: changeToDateTime(date),
    );
    if (picked != null) {
      return dateTimeToString(picked);
    } else {
      return "";
    }
  }

  Future<DateTime?> showCupertinoDatePicker(BuildContext context, {
    DateTime? selectedDate,
  }) async {
    return await showModalBottomSheet<DateTime>(
      isDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          color: Colors.white,
          child: Column(
            children: [
              // Action buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: AppColors.red),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  CupertinoButton(
                    child: const Text(
                      "Done",
                      style: TextStyle(color: AppColors.appColor),
                    ),
                    onPressed: () => Navigator.of(context).pop(selectedDate),
                  ),
                ],
              ),
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: selectedDate ?? DateTime.now(),
                  onDateTimeChanged: (DateTime newDate) {
                    selectedDate = newDate;
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String dateTimeToString(DateTime dateTime, {String output = "yyyy-MM-dd"}) {
    DateTime localDateTime = dateTime.toLocal();
    String formattedDate = DateFormat(output).format(localDateTime);

    return formattedDate;
  }

  Future<String> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      return (pickedFile.path);
    } else {
      return "";
    }
  }

  InvoiceStatusModel invoiceStatusColorValue({
    String key = "",
    String value = "",
  }) {
    if (key == "paid" || value == "Paid") {
      return InvoiceStatusModel("paid", "Paid", AppColors.green);
    } else if (key == "pending" || value == "Pending") {
      return InvoiceStatusModel("pending", "Pending", AppColors.golden);
    } else if (key == "partial" || value == "Partial") {
      return InvoiceStatusModel("partial", "Partial", AppColors.golden);
    } else if (key == "cancelled" || value == "Cancelled") {
      return InvoiceStatusModel("cancelled", "Cancelled", AppColors.red);
    } else {
      return InvoiceStatusModel("", "All", AppColors.appColor);
    }
  }

  Widget labelForDropdownWidget(String hint, Widget dropdown) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColors.primary3, width: 1.2),
            ),
            child: dropdown,
          ),
        ),
        Positioned(
          top: 0,
          left: 14,
          child: Container(
            color: AppColors.backColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                hint,
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  imageViewDialog(context, String url) {
    showDialog(
      context: context,
      builder: (context) {
        return Scaffold(
          body: Container(
            color: Colors.black,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomAppBar(
                  title: url.contains(".pdf") ? "Pdf View" : "Image view",
                ),
                Expanded(
                  child: InteractiveViewer(child: Image.network(url)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class InvoiceStatusModel {
  String key;

  String value;

  Color color;

  InvoiceStatusModel(this.key, this.value, this.color);
}

class _CustomPageRoute extends PageRouteBuilder {
  final Widget page;

  _CustomPageRoute(this.page)
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(1.0, 0.0); // Slide from right
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end)
          .chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 400),
  );

  // 👇 This enables iOS swipe-back (interactive pop gesture)
  @override
  bool get popGestureEnabled => true;

  @override
  bool get maintainState => true;

  @override
  bool get opaque => true;
}