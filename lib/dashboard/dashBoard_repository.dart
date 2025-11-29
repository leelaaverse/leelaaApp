import '../network/api_service.dart';
import '../network/endpoint.dart';
import '../utils/helper.dart';
import 'api_model/dashboard_data_api_model.dart';

class DashboardRepository with Helper {
  final ApiService apiService = ApiService();

  Future<Map<String, dynamic>> dashBoardDataApi() async {
    try {
      var response = await apiService.getRequest<DashBoardDataApiModel>(
        AppUrl.dashBard,
            (json) => DashBoardDataApiModel.fromJson(json),
      );
      print("response");
      print(response.toJson());
      if (response.success ?? false) {
        return {"msg": "", "response": response.toJson()};
      } else {
        return {"msg": response.message ?? ""};
      }
    } catch (e) {
      // callSnackBar("Error", e.toString());
      return {"msg": e.toString()};
    }
  }
}
