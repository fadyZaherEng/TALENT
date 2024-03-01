import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/domain/entities/request/request.dart';
import 'package:talent_link/src/presentation/screens/request_screen/widgets/request_card_item_widget.dart';

class QuickRequestsWidget extends StatelessWidget {
  final Function() onTapSeeMore;
  final void Function(Request request) onTapRequest;
  final List<Request> requests;

  const QuickRequestsWidget({
    super.key,
    required this.onTapSeeMore,
    required this.requests,
    required this.onTapRequest,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            color: ColorSchemes.lightGray,
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        S.of(context).quickRequests,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: ColorSchemes.black,
                                  fontWeight: Constants.fontWeightSemiBold,
                                ),
                      )),
                      InkWell(
                        onTap: onTapSeeMore,
                        child: Row(
                          children: [
                            Text(S.of(context).seeMore,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: ColorSchemes.redError,
                                      fontWeight: Constants.fontWeightSemiBold,
                                    )),
                            SvgPicture.asset(
                              ImagePaths.rightArrow,
                              matchTextDirection: true,
                            )
                          ],
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: 162,
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    itemExtent: 120,
                    itemCount: requests.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: RequestCardItemWidget(
                          request: requests[index],
                          onTapItem: () => onTapRequest(requests[index]),
                        ),
                      );
                    }),
              )
            ])),
        const SizedBox(height: 46),
      ],
    );
  }
}
