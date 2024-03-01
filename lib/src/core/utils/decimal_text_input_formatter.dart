import 'package:flutter/services.dart';

class DecimalTextInputFormatter extends TextInputFormatter {
  int numberOfDigits;

  DecimalTextInputFormatter({this.numberOfDigits = 0});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newString = RegExp(r'^\d{0,9}(\.\d{0,' '$numberOfDigits' +
        r'})?'.replaceFirst('#numberOfDigits', '$numberOfDigits'))
        .stringMatch(newValue.text.replaceAll(',', '')) ??
        '';

    return TextEditingValue(
      text: newString,
      selection: TextSelection.collapsed(offset: newString.length),
    );
  }
}
