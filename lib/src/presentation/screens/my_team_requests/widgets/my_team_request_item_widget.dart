import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/core/utils/status_color.dart';
import 'package:talent_link/src/domain/entities/get_my_team_request/get_my_team_request.dart';
import 'package:talent_link/src/presentation/screens/my_team_requests/widgets/my_team_requests_image_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_button_widget.dart';

class MyTeamRequestItemWidget extends StatelessWidget {
  final MyTeamRequest myTeamRequest;
  final void Function(MyTeamRequest myTeamRequest) onTapTimeLine;

  const MyTeamRequestItemWidget({
    super.key,
    required this.myTeamRequest,
    required this.onTapTimeLine,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorSchemes.cardHeader,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              offset: Offset(1, 2),
              blurRadius: 24,
              spreadRadius: 0,
              color: Color.fromRGBO(23, 43, 77, 0.16),
            ),
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    MyTeamRequestsImageWidget(
                        imageUrl: myTeamRequest.imagePath),
                    const SizedBox(width: 10),
                    Text(
                      myTeamRequest.employeeName,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ColorSchemes.black,
                          fontWeight: Constants.fontWeightLight),
                    ),
                  ],
                ),
                Text(
                  myTeamRequest.createdAt,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorSchemes.gray,
                        fontWeight: Constants.fontWeightLight,
                      ),
                )
              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: ColorSchemes.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "# ${myTeamRequest.transactionId}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: ColorSchemes.gray),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(ImagePaths.requestType,
                                    fit: BoxFit.scaleDown),
                                const SizedBox(width: 4),
                                Text(
                                  myTeamRequest.referenceName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: ColorSchemes.black,
                                          fontWeight:
                                              Constants.fontWeightRegular),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: statusColor(
                                          myTeamRequest.transactionStatusId)
                                      .withOpacity(0.1)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                child: Text(
                                  myTeamRequest.transactionStatusName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: statusColor(myTeamRequest
                                                  .transactionStatusId)
                                              .withOpacity(0.9),
                                          fontWeight:
                                              Constants.fontWeightRegular),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      height: 2,
                      color: ColorSchemes.lightGray),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        const Expanded(child: SizedBox()),
                        Expanded(
                            child: CustomButtonWidget(
                          onTap: () => onTapTimeLine(myTeamRequest),
                          text: S.of(context).timeline,
                          backgroundColor: ColorSchemes.blue,
                          height: 36,
                          buttonBorderRadius: 8,
                        ))
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
