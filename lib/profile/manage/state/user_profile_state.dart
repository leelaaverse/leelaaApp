class UserProfileState {
  final String type;
  final String userFor;
  final List<String> notificationList;
  final bool isLoading;
  final String errorMessage;
  final String option;

  UserProfileState({
    this.type = "All",
    this.userFor = "",
    this.isLoading = false,
    this.notificationList = const [],
    this.errorMessage = "",
    this.option = "Active",
  });

  UserProfileState copyWith({
    String? type,
    String? userFor,
    bool? isLoading,
    List<String>? notificationList,
    String? errorMessage,
    String? option,
  }) {
    return UserProfileState(
      userFor: userFor ?? this.userFor,
      type: type ?? this.type,
      isLoading: isLoading ?? this.isLoading,
      notificationList: notificationList ?? this.notificationList,
      option: option ?? this.option,
      errorMessage: errorMessage ?? "",
    );
  }

  factory UserProfileState.initial() {
    return UserProfileState();
  }
}
