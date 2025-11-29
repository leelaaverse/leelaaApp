import '../network/api_service.dart';
import '../network/endpoint.dart';
import '../utils/helper.dart';

class GenerateRepository with Helper {
  final ApiService apiService = ApiService();

  Future<Map<String, dynamic>> invoiceListApi() async {
    try {
      // var response = await apiService.getRequest<InvoiceListingApiModel>(
      //   AppUrl.invoiceListing,
      //   (json) => InvoiceListingApiModel.fromJson(json),
      // );
      // print("response");
      // print(response.toJson());
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
