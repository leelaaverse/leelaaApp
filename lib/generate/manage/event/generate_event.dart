abstract class GenerateEvent {}

class GetInitialData extends GenerateEvent {
  GetInitialData();
}

class BackCall extends GenerateEvent {}

class GenerateClick extends GenerateEvent {
  GenerateClick();
}

class onPromptChange extends GenerateEvent {
  String? prompt;

  onPromptChange(this.prompt);
}

class ChangeRatioSelected extends GenerateEvent {
  String? ratio;

  ChangeRatioSelected(this.ratio);
}

class ChangeTypeSelected extends GenerateEvent {
  String? type;

  ChangeTypeSelected(this.type);
}

class ChangeModelSelected extends GenerateEvent {
  String? model;

  ChangeModelSelected(this.model);
}
