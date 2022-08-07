class FormEnterPhoneNumberState {
  final String phoneNumber;
  final bool? isPhoneNumberValid;
  final bool formSubmittedSuccessfully;

  const FormEnterPhoneNumberState({
    this.phoneNumber = "",
    this.isPhoneNumberValid,
    this.formSubmittedSuccessfully = false,
  });

  FormEnterPhoneNumberState copyWith({
    String? phoneNumber,
    bool? isPhoneNumberValid,
    bool? formSubmittedSuccessfully,
  }) =>
      FormEnterPhoneNumberState(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        isPhoneNumberValid: isPhoneNumberValid ?? this.isPhoneNumberValid,
        formSubmittedSuccessfully: formSubmittedSuccessfully ?? this.formSubmittedSuccessfully,
      );
}
