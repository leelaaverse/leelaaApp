import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../auth/screen/login_screen.dart';
import '../constants/strings.dart';
import '../utils/helper.dart';
import '../utils/shared_preferences_handler.dart';
import 'endpoint.dart';
import 'exception.dart';
import 'loading_handler.dart';

class ApiService with Helper {
  var loading = LoadingHandler();
  final saveBox = SharedPreferencesHandler();

  /// Generic API Request Handler
  Future<T> _sendRequest<T>({
    required String endpoint,
    required String method,
    required T Function(Map<String, dynamic>) fromJson,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    bool loadingNeeded = true,
  }) async {
    try {
      if (loadingNeeded) {
        loading.showLoading();
      }

      Uri url = Uri.parse("${AppUrl.baseUrl}$endpoint");
      headers ??= {"Content-Type": "application/json"};
      print(url);
      http.Response response;
      switch (method) {
        case 'POST':
          response = await http
              .post(url, headers: headers, body: jsonEncode(body))
              .timeout(Duration(seconds: 10));
          break;
        case 'PUT':
          response = await http
              .put(url, headers: headers, body: jsonEncode(body))
              .timeout(Duration(seconds: 10));
          break;
        case 'DELETE':
          response = await http
              .delete(url, headers: headers)
              .timeout(Duration(seconds: 10));
          break;
        case 'GET':
        default:
          response = await http
              .get(url, headers: headers)
              .timeout(Duration(seconds: 10));
          break;
      }
      loading.hideLoading();
      return _handleResponse(response, fromJson);
    } on SocketException {
      loading.hideLoading();
      throw NetworkException();
    } on HttpException {
      loading.hideLoading();
      throw ServerException();
    } on FormatException {
      loading.hideLoading();
      throw BadRequestException();
    } on ToManyRequestException {
      loading.hideLoading();
      throw ToManyRequestException();
    } on UnauthorizedException {
      // saveBox.clearPreference();
      // saveBox.storeBoolData(userLoginValue, false);
      // callNextAndClearStack(LoginScreen());
      throw UnauthorizedException();
    } on TimeoutException {
      loading.hideLoading();
      throw TimeoutException();
    } catch (e) {
      loading.hideLoading();
      throw ApiException("Unexpected error: $e");
    } finally {
      loading.hideLoading();
    }
  }

  /// Handle API Response with Dynamic Model
  T _handleResponse<T>(http.Response response,
      T Function(Map<String, dynamic>) fromJson,) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return fromJson(jsonDecode(response.body));
      case 400:
        return fromJson(jsonDecode(response.body));
      case 401:
      case 403:
        throw UnauthorizedException();
      case 429:
        throw ToManyRequestException();
      case 404:
        throw NotFoundException();
      case 500:
        return fromJson(jsonDecode(response.body));
      default:
        throw ServerException("Error: ${response.statusCode}");
    }
  }

  /// GET Request
  Future<T> getRequest<T>(String endpoint,
      T Function(Map<String, dynamic>) fromJson, {
        bool requiresAuth = true,
        bool loadingNeeded = false,
      }) async {
    Map<String, String> headers = {};

    if (requiresAuth) {
      String token = await saveBox.getStringData(appToken);
      headers['Authorization'] = 'Bearer $token';
    }
    print(headers);
    return await _sendRequest(
      endpoint: endpoint,
      method: 'GET',
      headers: headers,
      fromJson: fromJson,
      loadingNeeded: loadingNeeded,
    );
  }

  /// POST Request
  Future<T> postRequest<T>(String endpoint,
      Map<String, dynamic> body,
      T Function(Map<String, dynamic>) fromJson, {
        bool requiresAuth = true,
      }) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};

    if (requiresAuth) {
      String token = await saveBox.getStringData(appToken);
      headers['Authorization'] = 'Bearer $token';
    }
    return await _sendRequest(
      endpoint: endpoint,
      method: 'POST',
      body: body,
      headers: headers,
      fromJson: fromJson,
    );
  }

  /// PUT Request
  Future<T> putRequest<T>(String endpoint,
      Map<String, dynamic> body,
      T Function(Map<String, dynamic>) fromJson, {
        bool requiresAuth = true,
      }) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};

    if (requiresAuth) {
      String token = await saveBox.getStringData(appToken);
      headers['Authorization'] = 'Bearer $token';
    }
    return await _sendRequest(
      endpoint: endpoint,
      method: 'PUT',
      body: body,
      headers: headers,
      fromJson: fromJson,
    );
  }

  /// DELETE Request
  Future<T> deleteRequest<T>(String endpoint,
      T Function(Map<String, dynamic>) fromJson, {
        bool requiresAuth = true,
      }) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};

    if (requiresAuth) {
      String token = await saveBox.getStringData(appToken);
      headers['Authorization'] = 'Bearer $token';
    }
    return await _sendRequest(
      endpoint: endpoint,
      headers: headers,
      method: 'DELETE',
      fromJson: fromJson,
    );
  }

  /// Multipart Request (File Upload)

  Future<T> uploadFile<T>(String endpoint,
      File file,
      T Function(Map<String, dynamic>) fromJson,) async {
    try {
      if (!file.existsSync()) {
        throw Exception("File not found");
      }
      String token = await saveBox.getStringData(appToken);

      loading.showLoading();

      var request = http.MultipartRequest(
        "POST",
        Uri.parse("${AppUrl.baseUrl}$endpoint"),
      );

      print("${AppUrl.baseUrl}$endpoint");
      // Add Headers
      request.headers.addAll({
        "Authorization": "Bearer $token",
        "Content-Type": "multipart/form-data",
      });

      request.files.add(
        http.MultipartFile(
          'file',
          file.readAsBytes().asStream(),
          file.lengthSync(),
          filename: file.path
              .split('/')
              .last,
        ),
      );

      // Send request

      var response = await request.send();
      var responseData = await response.stream.bytesToString();

      print("Response Status: ${response.statusCode}");
      print("Response Body: $responseData");

      if (response.statusCode == 200 || response.statusCode == 201) {
        loading.hideLoading();

        return fromJson(jsonDecode(responseData));
      } else {
        loading.hideLoading();
        throw Exception("Upload failed: ${response.statusCode}");
      }
    } catch (e) {
      loading.hideLoading();
      print("Upload Error: $e");
      throw Exception("Unexpected error: $e");
    } finally {
      loading.hideLoading();
    }
  }

  Future<T> uploadFileTemp<T>(String endpoint,
      File file,
      String token,
      String number,
      String vehicleType,
      String companyName,
      String notes,
      String location,
      Map<String, dynamic> point,
      T Function(Map<String, dynamic>) fromJson,) async {
    try {
      // if (!isLoading.value) {
      //   isLoading.value = true;
      //   loadingDialog();
      // }
      if (!file.existsSync()) {
        throw Exception("File not found");
      }

      var request = http.MultipartRequest(
        "POST",
        Uri.parse("${AppUrl.baseUrl}$endpoint"),
      );

      // Add Headers
      request.headers.addAll({
        "Authorization": "Bearer $token",
        "Content-Type": "multipart/form-data",
      });

      request.files.add(
        http.MultipartFile(
          'photo',
          file.readAsBytes().asStream(),
          file.lengthSync(),
          filename: file.path
              .split('/')
              .last,
          contentType: MediaType('image', 'png'),
        ),
      );

      // Send request
      request.fields['number'] = number;
      request.fields['vehicleType'] = vehicleType;
      request.fields['CompanyName'] = companyName.toString();
      request.fields['notes'] = notes.toString();
      request.fields['location'] = location.toString();
      request.fields['point'] = jsonEncode(point);

      print("request.fields");
      print(request.fields);
      // Send request

      var response = await request.send();
      var responseData = await response.stream.bytesToString();

      print("Response Status: ${response.statusCode}");
      print("Response Body: $responseData");

      if (response.statusCode == 200 || response.statusCode == 201) {
        loading.hideLoading();
        return fromJson(jsonDecode(responseData));
      } else {
        loading.hideLoading();
        throw Exception("Upload failed: ${response.statusCode}");
      }
    } catch (e) {
      loading.hideLoading();
      print("Upload Error: $e");
      throw Exception("Unexpected error: $e");
    } finally {
      loading.hideLoading();
    }
  }
}
