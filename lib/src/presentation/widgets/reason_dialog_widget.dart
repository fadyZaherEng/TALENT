import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/presentation/widgets/custom_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_text_field_widget.dart';

class ReasonDialogWidget extends StatefulWidget {
  final void Function(String value) primaryAction;
  final Function() secondaryAction;
  final bool isRequired;

  const ReasonDialogWidget({
    Key? key,
    required this.primaryAction,
    required this.secondaryAction,
    required this.isRequired,
  }) : super(key: key);

  @override
  State<ReasonDialogWidget> createState() => _ReasonDialogWidgetState();
}

class _ReasonDialogWidgetState extends State<ReasonDialogWidget> {
  TextEditingController reasonControl = TextEditingController();
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorSchemes.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(ImagePaths.profile),
              const SizedBox(height: 16.2),
              Text(
                widget.isRequired
                    ? S.of(context).areYouSureYouWantReject
                    : S.of(context).areYouSureYouWantApprove,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorSchemes.black, letterSpacing: -0.24),
              ),
              const SizedBox(height: 32.0),
              CustomTextFieldWidget(
                  textInputType: TextInputType.text,
                  inputFormatters: const [],
                  controller: reasonControl,
                  errorMessage: errorMessage,
                  labelTitle: S.of(context).reason,
                  onChange: (value) {
                    setState(() {});
                    _validate(value, (String value) {});
                  }),
              const SizedBox(height: 32.0),
              Row(
                children: [
                  Expanded(
                    child: CustomButtonWidget(
                      borderColor: ColorSchemes.gray,
                      height: 44,
                      onTap: widget.secondaryAction,
                      textColor: ColorSchemes.gray,
                      backgroundColor: ColorSchemes.white,
                      text: S.of(context).no,
                    ),
                  ),
                  const SizedBox(
                    width: 23,
                  ),
                  Expanded(
                      child: CustomGradientButtonWidget(
                    height: 44,
                    onTap: () {
                      setState(() {});
                      _validate(reasonControl.text, (String value)=>widget.primaryAction(reasonControl.text));
                    },
                    text: S.of(context).yes,
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validate(String value, void Function(String value) onValid) {
    if (widget.isRequired) {
      if (value.trim().isEmpty) {
        errorMessage = S.of(context).thisFieldIsRequired;
      } else {
        errorMessage = null;
        onValid(value);
      }
    } else {
      errorMessage = null;
      onValid(value);
    }
  }
}
