import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/domain/entities/my_requests/asset_details/asset_details.dart';
import 'package:talent_link/src/domain/entities/my_requests/get_indemnity_encashment_details/get_indemnity_encashment_details.dart';

class AssetDetailsInformationWidget extends StatefulWidget {
  final AssetDetails assetDetails;

  const AssetDetailsInformationWidget({
    super.key,
    required this.assetDetails,
  });

  @override
  State<AssetDetailsInformationWidget> createState() =>
      _AssetDetailsInformationWidgetState();
}

class _AssetDetailsInformationWidgetState
    extends State<AssetDetailsInformationWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin:
            const EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 15),
        padding: const EdgeInsetsDirectional.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(7),
          color: ColorSchemes.white,
          boxShadow: [
            BoxShadow(
              color: ColorSchemes.gray.withOpacity(0.13),
              spreadRadius: 4,
              blurRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
          child: Column(
            children: [
              _getRequestDetailsItemContent(
                text: S.of(context).asset,
                value: widget.assetDetails.assetTypeName,
              ),
              const SizedBox(
                height: 20,
              ),
              _getRequestDetailsItemContent(
                text: S.of(context).quantity,
                value: widget.assetDetails.quantity.toString(),
              ),
              const SizedBox(
                height: 20,
              ),
              _getRequestDetailsItemContent(
                text: S.of(context).transactionStatusName,
                value: widget.assetDetails.status,
              ),
              const SizedBox(
                height: 20,
              ),
              _getRequestDetailsItemContent(
                text: S.of(context).remarks,
                value: widget.assetDetails.remarks.toString(),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getRequestDetailsItemContent({
    required String text,
    required String value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ColorSchemes.grayText,
                fontWeight: Constants.fontWeightRegular),
            maxLines: 1,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: Constants.fontWeightMedium,
                  color: ColorSchemes.black,
                ),
            maxLines: 10,
          ),
        ),
      ],
    );
  }
}
