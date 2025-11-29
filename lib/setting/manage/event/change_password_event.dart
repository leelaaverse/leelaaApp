abstract class ChangePasswordEvent {}

class GetInitialData extends ChangePasswordEvent {}

class BackCall extends ChangePasswordEvent {}

class CallDataSave extends ChangePasswordEvent {}

class onChangeCall extends ChangePasswordEvent {
  var oldPassword = "";
  var newPassword = "";
  var confirmPassword = "";

  onChangeCall({
    this.confirmPassword = "",
    this.oldPassword = "",
    this.newPassword = "",
  });
}

class MemberClick extends ChangePasswordEvent {
  var id;

  MemberClick(this.id);
}
