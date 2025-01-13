import 'package:reactive_forms/reactive_forms.dart';

class LoginForm {
  static final login = FormGroup({
    'email': FormControl<String>(validators: [Validators.required]),
    'password': FormControl<String>(validators: [Validators.required]),
  });
}
