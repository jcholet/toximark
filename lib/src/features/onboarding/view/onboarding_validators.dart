import 'package:health_pitstop/l10n/string_hardcoded.dart';
import 'package:health_pitstop/src/utils/validators/string_validators.dart';

/// Mixin class to be used for client-side onboarding validation.
mixin OnboardingValidators {
  final StringValidator firstNameValidator = NameRegexValidator();
  final StringValidator lastNameValidator = NameRegexValidator();
  final List<StringValidator> usernameValidators = [
    MinLengthValidator(3),
    UsernameRegexValidator(),
  ];

  bool canSubmitFirstName(String firstName) {
    return firstNameValidator.isValid(firstName.trim());
  }

  bool canSubmitLastName(String lastName) {
    return lastNameValidator.isValid(lastName.trim());
  }

  bool canSubmitUsername(String username) {
    return usernameValidators.areValid(username.trim());
  }

  String? firstNameErrorText(String firstName) {
    final showErrorText = !canSubmitFirstName(firstName);
    final errorText = firstName.trim().isEmpty
        ? 'Merci de renseigner votre prénom'.hardcoded
        : 'Votre prénom ne peut pas contenir de caractères interdits'.hardcoded;
    return showErrorText ? errorText : null;
  }

  String? lastNameErrorText(String lastName) {
    final showErrorText = !canSubmitLastName(lastName);
    final errorText = lastName.trim().isEmpty
        ? 'Merci de renseigner votre nom de famille'.hardcoded
        : 'Votre nom de famille ne peut pas contenir de caractères interdits'
            .hardcoded;
    return showErrorText ? errorText : null;
  }

  String? usernameErrorText(String username) {
    final showErrorText = !canSubmitUsername(username);
    final errorText = username.trim().isEmpty
        ? "Merci de choisir un nom d'utilisateur".hardcoded
        : username.length < 3
            ? "Votre nom d'utilisateur doit contenir au moins 3 caractères"
                .hardcoded
            : "Votre nom d'utilisateur doit commencer par une lettre et ne "
                    'peut pas contenir de caractères interdits'
                .hardcoded;
    return showErrorText ? errorText : null;
  }
}
