import 'dart:convert';
import 'dart:io';
import '../constants/strings.dart';
import '../network/api_service.dart';
import '../network/endpoint.dart';
import '../utils/helper.dart';
import '../utils/shared_preferences_handler.dart';
import 'api_model/user_login_model.dart';

class AuthRepository with Helper {
  final ApiService apiService = ApiService();

  Future<Map<String, dynamic>> userLogin(String email, String password) async {
    // String? fcmToken = await FirebaseMessaging.instance.getToken();

    try {
      Map<String, dynamic> body = {
        "password": password, "email": email};

      print(body);

      var response = await apiService.postRequest<UserLoginModel>(
        AppUrl.userLogin,
        body,
            (json) => UserLoginModel.fromJson(json),
        requiresAuth: false,
      );
      print("response");
      print(response.toJson());
      if (response.success ?? false) {
        SharedPreferencesHandler().storeBoolData(userLoginValue, true);
        SharedPreferencesHandler().storeStringData(
          appToken,
          response.data?.accessToken ?? "",
        );
        SharedPreferencesHandler().storeStringData(
          userName,
          response.data?.user?.firstName ?? "",
        );
        SharedPreferencesHandler().storeStringData(userImage, getAvatar());
        // SharedPreferencesHandler().storeStringData(
        //   userNumber,
        //   (response.user!.phoneCode ?? "") + (response.user!.phone ?? ""),
        // );
        SharedPreferencesHandler().storeStringData(
          userEmail,
          response.data?.user?.email ?? "",
        );

        SharedPreferencesHandler().storeStringData(
          userId,
          response.data?.user?.id ?? "",
        );
        // saveBox.write(isNotificationEnabled, response['isNotificationEnabled']);
        return {"msg": "", "response": response.toJson()};
      } else {
        return {"msg": response.message ?? ""};
      }
    } catch (e) {
      // callSnackBar("Error", e.toString());
      return {"msg": e.toString()};
    }
  }

  Future<String> userRegister(Map<String, dynamic> body) async {
    // String? fcmToken = await FirebaseMessaging.instance.getToken();

    try {
      print(jsonEncode(body));

      var response = await apiService.postRequest<Map<String, dynamic>>(
        AppUrl.userRegister,
        body,
            (json) => json,
        requiresAuth: false,
      );
      print("response");
      print(response);
      // if (response.token != null) {
      //   SharedPreferencesHandler().storeBoolData(userLoginValue, true);
      //   SharedPreferencesHandler().storeStringData(
      //     appToken,
      //     response.token ?? "",
      //   );
      //   SharedPreferencesHandler().storeStringData(
      //     userName,
      //     response.user!.name ?? "",
      //   );
      //   SharedPreferencesHandler().storeStringData(
      //     userNumber,
      //     (response.user!.phoneCode ?? "") + (response.user!.phone ?? ""),
      //   );
      //   SharedPreferencesHandler().storeStringData(
      //     userEmail,
      //     (response.user!.email ?? ""),
      //   );
      //   SharedPreferencesHandler().storeStringData(
      //     userImage,
      //     (response.user!.imageId ?? ""),
      //   );
      //
      //   SharedPreferencesHandler().storeStringData(
      //     userId,
      //     response.user!.sId ?? "",
      //   );
      //   // saveBox.write(isNotificationEnabled, response['isNotificationEnabled']);
      //   return "";
      // } else {

      if (response['success']) {
        return "";
      }

      return response['message'] ?? "";
      // }
    } catch (e) {
      // callSnackBar("Error", e.toString());
      print(e);
      return e.toString();
    }
  }

  Future<Map<String, dynamic>> forgotPasswordAPi(String number) async {
    try {
      Map<String, dynamic> body = {"email": number};
      print(body);

      var response = await apiService.postRequest<Map<String, dynamic>>(
        AppUrl.forgotPassword,
        body,
            (json) => json,
        requiresAuth: false,
      );
      print("response");
      print(response);
      if (response['success']) {
        return {"success": true, "msg": response['message']};
      }
      return {"success": false, "msg": response['message'] ?? ""};
    } catch (e) {
      // callSnackBar("Error", e.toString());
      return {"success": false, "msg": e.toString()};
    }
  }

  Future<String> sendOtpApi(String number) async {
    try {
      Map<String, dynamic> body = {"phone": number};
      print(body);

      var response = await apiService.postRequest<Map<String, dynamic>>(
        AppUrl.sendOtp,
        body,
        (json) => json,
        requiresAuth: false,
      );
      print("response");
      print(response);
      if (response['success']) {
        return "";
      }
      return response['message'] ?? "";
    } catch (e) {
      // callSnackBar("Error", e.toString());
      return e.toString();
    }
  }

  Future<String> resetPasswordApi(String number, String password) async {
    try {
      Map<String, dynamic> body = {"phone": number, "password": password};
      print(body);

      var response = await apiService.postRequest<Map<String, dynamic>>(
        AppUrl.resetPasswordCall,
        body,
            (json) => json,
        requiresAuth: false,
      );
      print("response");
      print(response);
      if (response['success']) {
        return "";
      }
      return response['message'] ?? "";
    } catch (e) {
      // callSnackBar("Error", e.toString());
      return e.toString();
    }
  }

  Future<String> verifyOtp(String number, String otp, bool fromLogin) async {
    // String? fcmToken = await FirebaseMessaging.instance.getToken();

    try {
      Map<String, dynamic> body = {
        "phone": number,
        "otp": otp,
        "fcmToken": "",
        "deviceType": Platform.isAndroid ? "android" : "ios",
      };
      print(body);

      var response = await apiService.postRequest<UserLoginModel>(
        AppUrl.verifyOtp,
        body,
            (json) => UserLoginModel.fromJson(json),
        requiresAuth: false,
      );
      print("response");
      print(response.toJson());
      if (fromLogin) {
        if (response.success ?? false) {
          SharedPreferencesHandler().storeBoolData(userLoginValue, true);
          SharedPreferencesHandler().storeStringData(
            appToken,
            response.data?.accessToken ?? "",
          );
          SharedPreferencesHandler().storeStringData(
            userName,
            response.data?.user?.firstName ?? "",
          );
          SharedPreferencesHandler().storeStringData(userImage, getAvatar());
          // SharedPreferencesHandler().storeStringData(
          //   userNumber,
          //   (response.user!.phoneCode ?? "") + (response.user!.phone ?? ""),
          // );
          SharedPreferencesHandler().storeStringData(
            userEmail,
            response.data?.user?.email ?? "",
          );

          SharedPreferencesHandler().storeStringData(
            userId,
            response.data?.user?.id ?? "",
          );
          // saveBox.write(isNotificationEnabled, response['isNotificationEnabled']);
          return "";
        }
      } else {
        if (response.success ?? false) {
          return "";
        }
      }
      return response.message ?? "";
    } catch (e) {
      // callSnackBar("Error", e.toString());
      return e.toString();
    }
  }
}
