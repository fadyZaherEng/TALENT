class AddressFunctions {
  final void Function(String value) onChangeName;
  final void Function(String value) onChangeStreet;
  final void Function(String value) onChangeBuilding;
  final void Function(String value) onChangeFloor;
  final void Function(String value) onChangeFlat;
  final Function() onTapArea;
  final Function() onTapSubmit;
  final Function() onClearArea;

  AddressFunctions({
    required this.onChangeName,
    required this.onChangeBuilding,
    required this.onChangeFlat,
    required this.onChangeFloor,
    required this.onChangeStreet,
    required this.onTapArea,
    required this.onTapSubmit,
    required this.onClearArea,
  });
}
