import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:talent_link/src/core/resources/image_paths.dart';
import '../../config/theme/color_schemes.dart';

class CompaniesLevelWidget extends StatefulWidget {
  final void Function() onTap;
  final void Function() onTapClose;
  final String buttonTitle;
  final double height;
  final double? width;
  late bool? isSelected;
  final bool isAllItems;

  CompaniesLevelWidget({
    Key? key,
    required this.onTap,
    required this.buttonTitle,
    this.height = 34,
    this.width,
    this.isSelected = false,
    required this.onTapClose,
    required this.isAllItems,
  }) : super(key: key);

  @override
  State<CompaniesLevelWidget> createState() =>
      _CompaniesLevelWidgetState();
}

class _CompaniesLevelWidgetState
    extends State<CompaniesLevelWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.onTap();
        },
        child: SizedBox(
          height: widget.height,
          width: widget.width,
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: widget.isSelected == true
                            ? ColorSchemes.primary
                            :  ColorSchemes.gray),
                    color: ColorSchemes.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      widget.buttonTitle,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: widget.isSelected == true
                              ? ColorSchemes.primary
                              :   ColorSchemes.gray,
                          letterSpacing: -0.13),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: widget.onTapClose,
                child: Visibility(
                  visible: widget.isSelected!,
                  child: widget.isAllItems
                      ? const SizedBox.shrink()
                      : Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            color: ColorSchemes.primary,
                            borderRadius: BorderRadius.circular(40)),
                        child: SvgPicture.asset(
                          ImagePaths.close,
                          color: Colors.white,
                          fit: BoxFit.scaleDown,
                        ),
                      )),
                ),
              )
            ],
          ),
        ));
  }
}
