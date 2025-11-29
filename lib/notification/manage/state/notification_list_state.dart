class NotificationListState {
  final String type;
  final List<String> notificationList;
  final bool isLoading;
  final String errorMessage;

  NotificationListState({
    this.type = "All",
    this.isLoading = false,
    this.notificationList = const [],
    this.errorMessage = "",
  });

  NotificationListState copyWith({
    String? type,
    bool? isLoading,
    List<String>? notificationList,
    String? errorMessage,
  }) {
    return NotificationListState(
      type: type ?? this.type,
      isLoading: isLoading ?? this.isLoading,
      notificationList: notificationList ?? this.notificationList,
      errorMessage: errorMessage ?? "",
    );
  }

  factory NotificationListState.initial() {
    return NotificationListState();
  }
}
