import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  ScaffoldMessengerState get _scaffoldMessenger => ScaffoldMessenger.of(this);
  FocusScopeNode get _focusScope => FocusScope.of(this);

  void showErrorSnackBar(String message) {
    _scaffoldMessenger
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  void showSuccessSnackBar(String message) {
    _scaffoldMessenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.green,
        ),
      );
  }

  void hideCurrentSnackBar() => _scaffoldMessenger.hideCurrentSnackBar();

  void requestFocus(FocusNode focusNode) => _focusScope.requestFocus(focusNode);

  void unfocus() => _focusScope.unfocus();
}
