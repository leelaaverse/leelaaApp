class PrivacySafetyState {


  final bool protectProfilePhoto;
  final bool personalDataHide;
  final bool hideLocation;

  final bool isLoading;
  final String errorMessage;

  PrivacySafetyState({
    this.protectProfilePhoto = false,
    this.personalDataHide = false,
    this.hideLocation = false,

    this.isLoading = false,
    this.errorMessage = "",
  });

  PrivacySafetyState copyWith({
    bool? protectProfilePhoto,
    bool? personalDataHide,
    bool? hideLocation,


    bool? isLoading,
    String? errorMessage,
  }) {
    return PrivacySafetyState(
      protectProfilePhoto: protectProfilePhoto ?? this.protectProfilePhoto,
      personalDataHide: personalDataHide ?? this.personalDataHide,
      hideLocation: hideLocation ?? this.hideLocation,

      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? "",
    );
  }

  factory PrivacySafetyState.initial() {
    return PrivacySafetyState();
  }
}
