import 'package:reactive_forms/reactive_forms.dart';

class SignUpForm {
  static final signup = FormGroup(
    {
      'first_name': FormControl<String>(validators: [Validators.required]),
      'last_name': FormControl<String>(validators: [Validators.required]),
      'email': FormControl<String>(validators: [Validators.required, Validators.email]),
      'phone_number': FormControl<String>(validators: [
        Validators.required,
        Validators.minLength(8),
      ]),
      'password': FormControl<String>(validators: [
        Validators.required,
        Validators.minLength(8),
        Validators.pattern(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$'),
      ]),
      'confirm_password': FormControl<String>(
        validators: [Validators.required, Validators.minLength(8)],
      ),
    },
    validators: [
      Validators.mustMatch('password', 'confirm_password'),
      Validators.required
    ],
  );
}
