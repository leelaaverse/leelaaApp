class SettingState {
  final String type;
  final String userFor;
  final List<String> notificationList;
  final bool isLoading;
  final String errorMessage;
  final String option;
  final String clickCall;

  SettingState({
    this.type = "All",
    this.userFor = "",
    this.isLoading = false,
    this.notificationList = const [],
    this.errorMessage = "",
    this.option = "Active",
    this.clickCall = "",
  });

  SettingState copyWith({
    String? type,
    String? userFor,
    bool? isLoading,
    List<String>? notificationList,
    String? errorMessage,
    String? option,
    String? clickCall,
  }) {
    return SettingState(
      userFor: userFor ?? this.userFor,
      type: type ?? this.type,
      isLoading: isLoading ?? this.isLoading,
      notificationList: notificationList ?? this.notificationList,
      option: option ?? this.option,
      errorMessage: errorMessage ?? "",
      clickCall: clickCall ?? this.clickCall,
    );
  }

  factory SettingState.initial() {
    return SettingState();
  }
}
