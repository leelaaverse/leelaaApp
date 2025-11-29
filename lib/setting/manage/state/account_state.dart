class AccountState {
  final String email;
  final String userName;
  final String dob;
  final String gender;
  final String address;
  final bool isLoading;
  final bool isEditable;
  final String errorMessage;

  AccountState({
    this.email = "",
    this.userName = "",
    this.dob = "",
    this.gender = "",
    this.address = "",
    this.isLoading = false,
    this.isEditable = false,
    this.errorMessage = "",
  });

  AccountState copyWith({
    String? email,
    String? userName,
    String? dob,
    String? gender,
    String? address,
    bool? isLoading,
    bool? isEditable,
    String? errorMessage,
  }) {
    return AccountState(
      email: email ?? this.email,
      userName: userName ?? this.userName,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      isLoading: isLoading ?? this.isLoading,
      isEditable: isEditable ?? this.isEditable,
      errorMessage: errorMessage ?? "",
    );
  }

  factory AccountState.initial() {
    return AccountState();
  }
}
