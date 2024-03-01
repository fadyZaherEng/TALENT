import 'package:flutter/material.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/domain/entities/my_requests/address_details/address_details.dart';

class AddressDetailsWidget extends StatefulWidget {
  final AddressDetails addressDetails;

  const AddressDetailsWidget({
    super.key,
    required this.addressDetails,
  });

  @override
  State<AddressDetailsWidget> createState() => _AddressDetailsWidgetState();
}

class _AddressDetailsWidgetState extends State<AddressDetailsWidget> {
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
                text: S.of(context).addressName,
                value: widget.addressDetails.addressName,
              ),
              const SizedBox(height: 20),
              _getRequestDetailsItemContent(
                text: S.of(context).addressDetails,
                value: widget.addressDetails.addressDetails,
              ),
              const SizedBox(height: 20),
              _getRequestDetailsItemContent(
                text: S.of(context).areaName,
                value: widget.addressDetails.areaName,
              ),
              const SizedBox(height: 20),
              _getRequestDetailsItemContent(
                text: S.of(context).buildingNumber,
                value: widget.addressDetails.buildingNumber,
              ),
              const SizedBox(height: 20),
              _getRequestDetailsItemContent(
                text: S.of(context).status,
                value: widget.addressDetails.status,
              ),
              const SizedBox(height: 20),
              _getRequestDetailsItemContent(
                text: S.of(context).remarks,
                value: widget.addressDetails.remarks,
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
