import '../../api_model/dashboard_data_api_model.dart';

class DashboardState {
  final String name;
  final String number;
  final String bio;
  final String email;
  final List<RecentCustomers> customerList;
  final String image;
  final String option;
  final int customerCount;
  final int pCount;
  final int bottomIndex;
  final int invoiceCount;
  final bool isSuccess;
  final String errorMessage;
  final String clickCall;
  final String clickCustomerId;

  DashboardState({
    this.name = "",
    this.number = "",
    this.email = "",
    this.option = "",
    this.bio = "My Bio sakdksd df dsf  dsf dsf dfs fsd dfs fgkghdsf",
    this.image = "",
    this.customerList = const [],
    this.customerCount = 0,
    this.pCount = 0,
    this.bottomIndex = 0,
    this.invoiceCount = 0,
    this.isSuccess = false,
    this.errorMessage = "",
    this.clickCall = "",
    this.clickCustomerId = "",
  });

  DashboardState copyWith({
    String? name,
    String? number,
    String? email,
    String? bio,
    String? image,
    String? option,
    List<RecentCustomers>? customerList,
    int? customerCount,
    int? pCount,
    int? bottomIndex,
    int? invoiceCount,
    bool? isSuccess,
    String? errorMessage,
    String? clickCall,
    String? clickCustomerId,
  }) {
    return DashboardState(
      name: name ?? this.name,
      number: number ?? this.number,
      email: email ?? this.email,
      option: option ?? this.option,
      bio: bio ?? this.bio,
      image: image ?? this.image,
      customerList: customerList ?? this.customerList,
      customerCount: customerCount ?? this.customerCount,
      pCount: pCount ?? this.pCount,
      bottomIndex: bottomIndex ?? this.bottomIndex,
      invoiceCount: invoiceCount ?? this.invoiceCount,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? "",
      clickCall: clickCall ?? this.clickCall,
      clickCustomerId: clickCustomerId ?? this.clickCustomerId,
    );
  }

  factory DashboardState.initial() {
    return DashboardState();
  }
}
