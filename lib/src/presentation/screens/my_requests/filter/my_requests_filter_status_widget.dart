import 'package:flutter/material.dart';

import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';

class MyRequestsFilterStatusWidget extends StatefulWidget {
  final List<RequestType> status;

  const MyRequestsFilterStatusWidget({
    super.key,
    required this.status,
  });

  @override
  State<MyRequestsFilterStatusWidget> createState() =>
      _MyRequestsFilterStatusWidgetState();
}

class _MyRequestsFilterStatusWidgetState
    extends State<MyRequestsFilterStatusWidget> {
  Color _borderWithTitleColor = ColorSchemes.gray;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
          itemCount: widget.status.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {
                  _checkButtonIsSelected(widget.status[index].id);
                },
                child: SizedBox(
                  height: 35,
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: widget.status[index].isSelected == true
                                ? _borderWithTitleColor = ColorSchemes.primary
                                : _borderWithTitleColor = ColorSchemes.gray),
                        color: ColorSchemes.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Center(
                        child: Text(
                          widget.status[index].name,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                              color: _borderWithTitleColor,
                              fontSize: 13,
                              letterSpacing: -0.13),
                        ),
                      ),
                    ),
                  ),
                ));
          }),
    );
  }

  void _checkButtonIsSelected(int id) {
    setState(() {
      for (var element in widget.status) {
        if (id == element.id) {
          if (element.isSelected == false) {
            _borderWithTitleColor = ColorSchemes.primary;
            element.isSelected = true;
          } else {
            element.isSelected = false;
            _borderWithTitleColor = ColorSchemes.gray;
          }
        } else {
          element.isSelected = false;
          _borderWithTitleColor = ColorSchemes.gray;
        }
      }
    });
  }
}
