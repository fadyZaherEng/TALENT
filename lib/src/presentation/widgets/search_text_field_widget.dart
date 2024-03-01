import 'package:flutter/material.dart';

import 'package:talent_link/src/config/theme/color_schemes.dart';

class SearchTextFieldWidget extends StatefulWidget {
  final String? labelText, errorText;
  final void Function(String value) onChange;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? controller;
  final InputBorder? inputBorder;
  final double? height;
  final double? width;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final Function? clearButtonAction;
  final Color? fillColor;
  final double? boxConstraints;

  const SearchTextFieldWidget(
      {Key? key,
      this.height = 60,
      this.width,
      required this.controller,
      required this.labelText,
      this.inputBorder,
      this.errorText,
      this.suffixWidget,
      this.prefixWidget,
      this.onSubmitted,
      required this.onChange,
      this.clearButtonAction,
      this.fillColor,
      this.boxConstraints})
      : super(key: key);

  @override
  State<SearchTextFieldWidget> createState() => _SearchTextFieldWidgetState();
}

class _SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChange,
      controller: widget.controller,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: ColorSchemes.gray),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 10),
        filled: true,
        fillColor: widget.fillColor ?? ColorSchemes.lightGray,
        constraints: widget.boxConstraints != null
            ? BoxConstraints.expand(height: widget.boxConstraints)
            : null,
        hintText: widget.labelText,
        errorText: widget.errorText,
        prefixIcon: const Icon(
          Icons.search,
          size: 28,
          color: ColorSchemes.gray,
        ),
        suffixIcon: widget.controller!.text.isEmpty
            ? const SizedBox()
            : InkWell(
                onTap: () {
                  setState(() {});
                  widget.clearButtonAction!();
                },
                child: const Icon(
                  Icons.close,
                  color: ColorSchemes.gray,
                  size: 20,
                ),
              ),
        border: widget.inputBorder,
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: ColorSchemes.lightGray)),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: ColorSchemes.lightGray)),
        errorBorder: widget.errorText != ""
            ? const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: ColorSchemes.redError))
            : null,
        focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: ColorSchemes.lightGray)),
      ),
      onFieldSubmitted: (value) => widget.onSubmitted!(value),
    );
  }
}
