import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/src/config/theme/color_schemes.dart';

class MoreHeaderWidget extends StatelessWidget {
  final String logo;

  const MoreHeaderWidget({super.key, required this.logo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Stack(clipBehavior: Clip.none, children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            height: MediaQuery.of(context).size.height / 4,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              color: ColorSchemes.primary,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(left: 70, top: 5),
            child: Opacity(
              opacity: 0.5,
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                    color: ColorSchemes.lightGray,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 90,
            height: 90,
            child: Card(
                elevation: 1,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                    child: SvgPicture.asset(logo, fit: BoxFit.scaleDown))),
          ),
        )
      ]),
    );
  }
}
