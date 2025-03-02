import 'package:health_pitstop/src/utils/validators/string_validators.dart';

/// Mixin class to be used for client-side sign in validation.
mixin SignInValidators {
  final StringValidator emailValidator = EmailRegexValidator();
  final StringValidator passwordValidator = NonEmptyValidator();

  bool canSubmitEmail(String email) {
    return emailValidator.isValid(email);
  }

  bool canSubmitPassword(String password) {
    return passwordValidator.isValid(password);
  }

  String? emailErrorText(String email) {
    final showErrorText = !canSubmitEmail(email);
    return showErrorText ? 'Adresse email invalide' : null;
  }

  String? passwordErrorText(String password) {
    final showErrorText = !canSubmitPassword(password);
    return showErrorText ? 'Mot de passe requis' : null;
  }
}

/// Mixin class to be used for client-side sign up validation.
mixin SignUpValidators {
  final StringValidator emailValidator = EmailRegexValidator();
  final List<StringValidator> passwordValidators = [
    MinLengthValidator(8),
    CapitalAndLowercaseValidator(),
    SpecialCharacterValidator(),
    DigitValidator(),
  ];

  bool canSubmitEmail(String email) {
    return emailValidator.isValid(email);
  }

  bool canSubmitPassword(String password) {
    return passwordValidators.areValid(password);
  }

  bool passwordsMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  int passwordStrength(String password) {
    return passwordValidators
        .where((validator) => validator.isValid(password))
        .length;
  }

  String? emailErrorText(String email) {
    final showErrorText = !canSubmitEmail(email);
    return showErrorText ? 'Adresse email invalide' : null;
  }

  String? passwordErrorText(String password) {
    if (password.isEmpty) {
      return 'Mot de passe requis';
    }

    if (!MinLengthValidator(8).isValid(password)) {
      return 'Le mot de passe doit contenir au moins 8 caractères';
    }

    if (!CapitalAndLowercaseValidator().isValid(password)) {
      return 'Le mot de passe doit contenir des majuscules et des minuscules';
    }

    if (!SpecialCharacterValidator().isValid(password)) {
      return 'Le mot de passe doit contenir au moins un caractère spécial';
    }

    if (!DigitValidator().isValid(password)) {
      return 'Le mot de passe doit contenir au moins un chiffre';
    }

    return null;
  }

  String? confirmPasswordErrorText(String password, String confirmPassword) {
    final showErrorText = !passwordsMatch(password, confirmPassword);
    return showErrorText ? 'Les mots de passe ne correspondent pas' : null;
  }
}
