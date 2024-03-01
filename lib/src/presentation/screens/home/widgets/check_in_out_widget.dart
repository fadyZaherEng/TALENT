import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/domain/entities/home/home.dart';

class CheckInOutWidget extends StatelessWidget {
  final Function() checkInEvent;
  final Function() checkOutEvent;
  final Home home;

  const CheckInOutWidget({
    Key? key,
    required this.checkInEvent,
    required this.checkOutEvent,
    required this.home,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    checkInEvent();
                  },
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorSchemes.blue),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          ImagePaths.checkIn,
                          fit: BoxFit.scaleDown,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          S.of(context).checkIn,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: ColorSchemes.white),
                        ),
                        const SizedBox(height: 3),
                        Text(home.homeData!.checkInTime == "" ? "--" : home.homeData!.checkInTime,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: ColorSchemes.white)),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 40),
              Expanded(
                child: InkWell(
                  onTap: () {
                    checkOutEvent();
                  },
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorSchemes.redError),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          ImagePaths.checkOut,
                          fit: BoxFit.scaleDown,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          S.of(context).checkOut,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: ColorSchemes.white),
                        ),
                        const SizedBox(height: 3),
                        Text(home.homeData!.checkOutTime == "" ? "--" : home.homeData!.checkOutTime,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: ColorSchemes.white)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

}
