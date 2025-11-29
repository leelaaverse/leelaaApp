class NotificationSettingsState {

  final bool muteYouDontFollow;
  final bool muteWhoDontFollowYou;
  final bool muteNewAccount;
  final bool muteUnconfirmedEmail;

  final bool isLoading;
  final String errorMessage;

  NotificationSettingsState({
    this.muteYouDontFollow = false,
    this.muteWhoDontFollowYou = false,
    this.muteNewAccount = false,
    this.muteUnconfirmedEmail = false,

    this.isLoading = false,
    this.errorMessage = "",
  });

  NotificationSettingsState copyWith({
    bool? muteYouDontFollow,
    bool? muteWhoDontFollowYou,
    bool? muteUnconfirmedEmail,
    bool? muteNewAccount,

    bool? isLoading,
    String? errorMessage,
  }) {
    return NotificationSettingsState(
      muteYouDontFollow: muteYouDontFollow ?? this.muteYouDontFollow,
      muteWhoDontFollowYou: muteWhoDontFollowYou ?? this.muteWhoDontFollowYou,
      muteNewAccount: muteNewAccount ?? this.muteNewAccount,
      muteUnconfirmedEmail: muteUnconfirmedEmail ?? this.muteUnconfirmedEmail,

      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? "",
    );
  }

  factory NotificationSettingsState.initial() {
    return NotificationSettingsState();
  }
}
