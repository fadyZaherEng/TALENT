class ContactFunctions {
  final Function() onTapContactType;
  final Function() onTapSubmit;
  final void Function(String value) onChangeContactNo;

  ContactFunctions({
    required this.onChangeContactNo,
    required this.onTapSubmit,
    required this.onTapContactType,
  });
}
