import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/domain/entities/vacation/vacation.dart';

class VacationCardWidget extends StatelessWidget {
  final Vacation vacation;
  final bool isEnglishLanguage;

  const VacationCardWidget({
    super.key,
    required this.vacation,
    required this.isEnglishLanguage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: ColorSchemes.lightGray,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: double.infinity,
            decoration: BoxDecoration(
              color: vacation.statusColor,
              borderRadius: BorderRadius.horizontal(
                  right: isEnglishLanguage
                      ? Radius.zero
                      : const Radius.circular(6),
                  left: isEnglishLanguage
                      ? const Radius.circular(6)
                      : Radius.zero),
            ),
            child: SvgPicture.asset(
              vacation.iconPath,
              fit: BoxFit.scaleDown,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, top: 16, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vacation.title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorSchemes.black,
                      fontWeight: Constants.fontWeightBold),
                ),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${vacation.date} .",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: ColorSchemes.gray,
                            fontWeight: Constants.fontWeightSemiBold,
                          ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      vacation.status,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: vacation.statusColor,
                            fontWeight: Constants.fontWeightSemiBold,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
