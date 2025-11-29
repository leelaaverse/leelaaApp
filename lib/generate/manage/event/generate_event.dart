abstract class GenerateEvent {}

class GetInitialData extends GenerateEvent {
  GetInitialData();
}

class BackCall extends GenerateEvent {}

class MemberClick extends GenerateEvent {
  var id;

  MemberClick(this.id);
}

class ChangeOptionSelected extends GenerateEvent {
  var option = "";

  ChangeOptionSelected(this.option);
}
