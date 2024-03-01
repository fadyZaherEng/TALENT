import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/core/utils/status_color.dart';
import 'package:talent_link/src/domain/entities/my_requests/my_request.dart';
import 'package:talent_link/src/presentation/widgets/custom_button_widget.dart';

class MyRequestItemWidget extends StatelessWidget {
  final MyRequest myRequest;
  final void Function(MyRequest myRequest) onTapCancel;
  final void Function(MyRequest myRequest) onTapTimeLine;

  const MyRequestItemWidget(
      {super.key,
      required this.myRequest,
      required this.onTapCancel,
      required this.onTapTimeLine});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: ColorSchemes.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                offset: Offset(1, 2),
                blurRadius: 24,
                spreadRadius: 0,
                color: Color.fromRGBO(23, 43, 77, 0.16),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "#${myRequest.transactionId}",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: ColorSchemes.black),
                  ),
                  Text(
                    myRequest.date,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorSchemes.gray,
                        fontWeight: Constants.fontWeightLight),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(ImagePaths.requestType,
                          fit: BoxFit.scaleDown),
                      const SizedBox(width: 4),
                      Text(
                        myRequest.requestType,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: ColorSchemes.black,
                            fontWeight: Constants.fontWeightRegular),
                      )
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: statusColor(myRequest.transactionStatuesId)
                            .withOpacity(0.1)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      child: Text(
                        myRequest.requestStatus,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: statusColor(myRequest.transactionStatuesId)
                                .withOpacity(0.9),
                            fontWeight: Constants.fontWeightRegular),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 17),
              Row(
                children: [
                  Expanded(
                      child: Visibility(
                    visible:
                        _showHideCancelButton(myRequest.transactionStatuesId),
                    child: CustomButtonWidget(
                      onTap: () => onTapCancel(myRequest),
                      text: S.of(context).cancel,
                      backgroundColor: ColorSchemes.redError,
                      height: 36,
                      buttonBorderRadius: 8,
                    ),
                  )),
                  const SizedBox(width: 20),
                  Expanded(
                      child: CustomButtonWidget(
                    onTap: () => onTapTimeLine(myRequest),
                    text: S.of(context).timeline,
                    backgroundColor: ColorSchemes.blue,
                    height: 36,
                    buttonBorderRadius: 8,
                  ))
                ],
              ),
            ],
          ),
        ));
  }

  bool _showHideCancelButton(int transactionStatusId) {
    if (transactionStatusId == 1 || transactionStatusId == 6 ) {
      return true;
    } else {
      return false;
    }
  }
}
