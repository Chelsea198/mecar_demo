import 'package:equatable/equatable.dart';

abstract class FormEnterPhoneNumberEvent extends Equatable {
  const FormEnterPhoneNumberEvent();

  @override
  List<Object?> get props => [];
}

class PhoneNumberChanged extends FormEnterPhoneNumberEvent {
  final String phoneNumber;

  const PhoneNumberChanged(this.phoneNumber);
}

class FormEnterPhoneSubmitted extends FormEnterPhoneNumberEvent {
  const FormEnterPhoneSubmitted();
}
