class GenerateState {
  final String type;
  final String ratio;
  final String model;
  final String prompt;
  final String userFor;
  final bool isLoading;
  final String errorMessage;

  GenerateState({
    this.ratio = "1:1",
    this.type = "Image",
    this.model = "Flux Schnell (Fast - 15-20s)",
    this.prompt = "",
    this.userFor = "",
    this.isLoading = false,
    this.errorMessage = "",
  });

  GenerateState copyWith({
    String? type,
    String? ratio,
    String? model,
    String? prompt,
    String? userFor,
    bool? isLoading,
    String? errorMessage,
  }) {
    return GenerateState(
      userFor: userFor ?? this.userFor,
      model: model ?? this.model,
      ratio: ratio ?? this.ratio,
      prompt: prompt ?? this.prompt,
      type: type ?? this.type,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? "",
    );
  }

  factory GenerateState.initial() {
    return GenerateState();
  }
}
