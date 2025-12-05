import '../network/api_service.dart';
import '../network/endpoint.dart';
import '../utils/helper.dart';

class GenerateRepository with Helper {
  final ApiService apiService = ApiService();

  Future<Map<String, dynamic>> generateImageApi(
      Map<String, dynamic> body) async {
    try {
      var response = await apiService.postRequest<Map<String, dynamic>>(
        AppUrl.generateImage,
        body,
            (json) => json,
      );
      print("response");
      print(response);
      // if (response.success ?? false) {
      //   return {"msg": "", "response": response.toJson()};
      // } else {
      //   return {"msg": response.message ?? ""};
      // }
      return {"msg": ""};
    } catch (e) {
      print(e.toString());
      return {"msg": e.toString()};
    }
  }
}
