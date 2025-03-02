import 'package:flutter/services.dart';

/// This file contains some helper functions used for string validation.

sealed class StringValidator {
  bool isValid(String value);
}

extension StringValidators on List<StringValidator> {
  bool areValid(String value) {
    return every((validator) => validator.isValid(value));
  }
}

class RegexValidator implements StringValidator {
  RegexValidator({
    required this.regexSource,
  });

  final String regexSource;

  @override
  bool isValid(String value) {
    try {
      // https://regex101.com/
      final regex = RegExp(regexSource);
      final Iterable<Match> matches = regex.allMatches(value);
      for (final match in matches) {
        if (match.start == 0 && match.end == value.length) {
          return true;
        }
      }
      return false;
    } catch (error) {
      // Invalid regex
      assert(false, error.toString());
      return true;
    }
  }
}

class PartialRegexValidator implements StringValidator {
  PartialRegexValidator({
    required this.regexSource,
  });

  final String regexSource;

  @override
  bool isValid(String value) {
    try {
      // https://regex101.com/
      final regex = RegExp(regexSource);
      return regex.hasMatch(value);
    } catch (error) {
      // Invalid regex
      assert(false, error.toString());
      return true;
    }
  }
}

class ValidatorInputFormatter implements TextInputFormatter {
  ValidatorInputFormatter({
    required this.editingValidator,
  });

  final StringValidator editingValidator;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (oldValue.text.length > newValue.text.length) {
      return newValue;
    }
    final oldValueValid = editingValidator.isValid(oldValue.text);
    final newValueValid = editingValidator.isValid(newValue.text);
    if (oldValueValid && !newValueValid) {
      return oldValue;
    }
    return newValue;
  }
}

class EmailRegexValidator extends RegexValidator {
  EmailRegexValidator() : super(regexSource: r'^\S+@\S+\.\S+$');
}

class CapitalAndLowercaseValidator extends PartialRegexValidator {
  CapitalAndLowercaseValidator()
      : super(regexSource: '^(?=.*[a-z])(?=.*[A-Z])');
}

class SpecialCharacterValidator extends PartialRegexValidator {
  SpecialCharacterValidator() : super(regexSource: r'(?=.*[!@#$%^&*?~_-])');
}

class DigitValidator extends PartialRegexValidator {
  DigitValidator() : super(regexSource: '(?=.*[0-9])');
}

class NameRegexValidator extends RegexValidator {
  NameRegexValidator()
      : super(regexSource: r'^[a-zA-ZÀ-ÿ]+([ -][a-zA-ZÀ-ÿ]+)*$');
}

class UsernameRegexValidator extends RegexValidator {
  UsernameRegexValidator() : super(regexSource: r'^[a-zA-Z][a-zA-Z0-9_.]*$');
}

class NonEmptyValidator extends StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}

class MinLengthValidator extends StringValidator {
  MinLengthValidator(this.minLength);

  final int minLength;

  @override
  bool isValid(String value) {
    return value.length >= minLength;
  }
}

class MaxLengthValidator extends StringValidator {
  MaxLengthValidator(this.maxLength);

  final int maxLength;

  @override
  bool isValid(String value) {
    return value.length <= maxLength;
  }
}
