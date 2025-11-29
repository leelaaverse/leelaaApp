abstract class NotificationSettingsEvent {}

class GetInitialData extends NotificationSettingsEvent {}

class BackCall extends NotificationSettingsEvent {}

class CallDataSave extends NotificationSettingsEvent {}

class onChangeCall extends NotificationSettingsEvent {
  bool? muteYouDontFollow;

  bool? muteWhoDontFollowYou;

  bool? muteNewAccount;

  bool? muteUnconfirmedEmail;

  onChangeCall({
    this.muteUnconfirmedEmail,
    this.muteWhoDontFollowYou,
    this.muteNewAccount,
    this.muteYouDontFollow });
}

