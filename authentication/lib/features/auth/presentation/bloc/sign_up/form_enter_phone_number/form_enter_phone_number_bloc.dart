import 'package:authentication/core/extensions/string_ext.dart';
import 'package:authentication/features/auth/presentation/bloc/sign_up/form_enter_phone_number/form_enter_phone_number_event.dart';
import 'package:authentication/features/auth/presentation/bloc/sign_up/form_enter_phone_number/form_enter_phone_number_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormEnterPhoneNumberBloc extends Bloc<FormEnterPhoneNumberEvent, FormEnterPhoneNumberState> {
  FormEnterPhoneNumberBloc() : super(const FormEnterPhoneNumberState()) {
    on<PhoneNumberChanged>(_onPhoneNumberChanged);
    on<FormEnterPhoneSubmitted>(_onSubmitted);
  }

  void _onPhoneNumberChanged(
    PhoneNumberChanged event,
    Emitter<FormEnterPhoneNumberState> emit,
  ) {
    emit(
      state.copyWith(
        phoneNumber: event.phoneNumber,
        isPhoneNumberValid: event.phoneNumber.phoneNumberError() == null,
      ),
    );
  }

  Future<void> _onSubmitted(
    FormEnterPhoneSubmitted event,
    Emitter<FormEnterPhoneNumberState> emit,
  ) async {
    await Future.delayed(const Duration(milliseconds: 500));
    emit(
      state.copyWith(
        formSubmittedSuccessfully: true,
      ),
    );
    emit(
      state.copyWith(
        formSubmittedSuccessfully: false,
      ),
    );
  }
}
