import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/utils/constants.dart';

class CustomTextFieldWithSuffixIconWidget extends StatefulWidget {
  final TextEditingController controller;
  final String labelTitle;
  final String? errorMessage;
  final TextInputType textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final Function() onTap;
  final Function()? onTapClearIcon;
  final void Function(String value) onChanged;
  final Widget suffixIcon;
  final bool isReadOnly;

  const CustomTextFieldWithSuffixIconWidget({
    Key? key,
    required this.controller,
    required this.labelTitle,
    this.errorMessage,
    this.textInputType = TextInputType.text,
    this.inputFormatters,
    required this.onTap,
    required this.suffixIcon,
    this.isReadOnly = false,
    required this.onChanged,
    this.onTapClearIcon,
  }) : super(key: key);

  @override
  State<CustomTextFieldWithSuffixIconWidget> createState() =>
      _CustomTextFieldWithSuffixIconWidgetState();
}

class _CustomTextFieldWithSuffixIconWidgetState
    extends State<CustomTextFieldWithSuffixIconWidget> {
  final FocusNode _focus = FocusNode();
  bool _textFieldHasFocus = false;

  @override
  void initState() {
    _focus.addListener(() {
      setState(() {
        _textFieldHasFocus = _focus.hasFocus;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focus,
      onTap: widget.onTap,
      readOnly: widget.isReadOnly,
      keyboardType: widget.textInputType,
      controller: widget.controller,
      inputFormatters: widget.inputFormatters,
      onChanged: (value) => widget.onChanged(value),
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
          fontWeight: Constants.fontWeightRegular,
          color: ColorSchemes.black,
          letterSpacing: -0.13),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorSchemes.border),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorSchemes.border),
            borderRadius: BorderRadius.circular(10)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorSchemes.redError),
            borderRadius: BorderRadius.circular(10)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorSchemes.border),
            borderRadius: BorderRadius.circular(10)),
        errorText: widget.errorMessage,
        labelText: widget.labelTitle,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        labelStyle: _labelStyle(context, _textFieldHasFocus),
        errorMaxLines: 2,
        suffixIcon: InkWell(
            onTap: widget.onTapClearIcon ?? () {}, child: widget.suffixIcon),
      ),
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
    );
  }

  TextStyle _labelStyle(BuildContext context, bool hasFocus) {
    if (hasFocus || widget.controller.text.isNotEmpty) {
      return Theme.of(context).textTheme.titleLarge!.copyWith(
        fontWeight: Constants.fontWeightRegular,
        color: widget.errorMessage == null
            ? ColorSchemes.gray
            : ColorSchemes.redError,
        letterSpacing: -0.13,
      );
    } else {
      return Theme.of(context).textTheme.titleSmall!.copyWith(
        fontWeight: Constants.fontWeightRegular,
        color: widget.errorMessage == null
            ? ColorSchemes.gray
            : ColorSchemes.redError,
        letterSpacing: -0.13,
      );
    }
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }
}
