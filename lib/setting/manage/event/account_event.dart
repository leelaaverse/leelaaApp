abstract class AccountEvent {}

class GetInitialData extends AccountEvent {}

class BackCall extends AccountEvent {}

class MakeEditableCall extends AccountEvent {}

class CallDataSave extends AccountEvent {}

class onChangeCall extends AccountEvent {
  var email = "";
  var username = "";
  var dob = "";
  var gender = "";
  var address = "";

  onChangeCall({
    this.gender = "",
    this.username = "",
    this.dob = "",
    this.email = "",
    this.address = ""
  });
}

class MemberClick extends AccountEvent {
  var id;

  MemberClick(this.id);
}
