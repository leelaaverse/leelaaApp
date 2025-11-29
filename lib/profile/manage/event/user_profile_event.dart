abstract class UserProfileEvent {}

class GetInitialData extends UserProfileEvent {
  var userFor = "";

  GetInitialData(this.userFor);
}

class BackCall extends UserProfileEvent {}

class MemberClick extends UserProfileEvent {
  var id;

  MemberClick(this.id);
}

class ChangeOptionSelected extends UserProfileEvent {
  var option = "";

  ChangeOptionSelected(this.option);
}
