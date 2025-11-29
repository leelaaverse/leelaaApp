abstract class SettingEvent {}

class GetInitialData extends SettingEvent {}

class BackCall extends SettingEvent {}

class DeleteAccountClick extends SettingEvent {}

class AccountItemClick extends SettingEvent {}

class ChangePasswordItemClick extends SettingEvent {}

class NotificationItemClick extends SettingEvent {}

class PrivacyItemClick extends SettingEvent {}

class MemberClick extends SettingEvent {
  var id;

  MemberClick(this.id);
}

class ChangeOptionSelected extends SettingEvent {
  var option = "";

  ChangeOptionSelected(this.option);
}
