import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/domain/entities/my_requests/my_request_filter.dart';
import 'package:talent_link/src/presentation/screens/my_requests/filter/my_request_filter_date_time_widget.dart';
import 'package:talent_link/src/presentation/screens/my_requests/filter/my_requests_filter_status_widget.dart';
import 'package:talent_link/src/presentation/screens/my_requests/filter/utils/my_requests_filter_functions.dart';
import 'package:talent_link/src/presentation/widgets/custom_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_text_field_with_suffix_icon_widget.dart';

class MyRequestsFilterBottomSheetContentWidget extends StatefulWidget {
  final MyRequestFilter myRequestFilter;
  final TextEditingController requestsController;
  final MyRequestsFilterFunctions myRequestsFilterFunctions;

  const MyRequestsFilterBottomSheetContentWidget({
    super.key,
    required this.myRequestFilter,
    required this.myRequestsFilterFunctions,
    required this.requestsController,
  });

  @override
  State<MyRequestsFilterBottomSheetContentWidget> createState() =>
      _MyRequestsFilterBottomSheetContentWidgetState();
}

class _MyRequestsFilterBottomSheetContentWidgetState
    extends State<MyRequestsFilterBottomSheetContentWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFieldWithSuffixIconWidget(
            errorMessage: null,
            controller: widget.requestsController,
            isReadOnly: true,
            suffixIcon: SvgPicture.asset(
              ImagePaths.arrowDown,
              fit: BoxFit.scaleDown,
            ),
            labelTitle: S.of(context).request,
            onChanged: (String value) {},
            onTap: widget.myRequestsFilterFunctions.onTapRequests,
          ),
          const SizedBox(height: 16),
          Text(
            S.of(context).requestedDate,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: ColorSchemes.black),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: MyRequestFilterDateTimeWidget(
                    pickDate: (String date, DateTime dateTime) {
                      widget.myRequestFilter.fromRequestedDate = dateTime;
                      widget.myRequestsFilterFunctions
                          .onPickFromRequestedDate(date);
                    },
                    deleteDate: widget
                        .myRequestsFilterFunctions.onDeleteFromRequestedDate,
                    dateTime: widget.myRequestFilter.fromRequestedDate ??
                        DateTime(DateTime.now().year, DateTime.now().month, 1),
                    errorMassage:
                        widget.myRequestFilter.fromRequestedDateErrorMessage),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: MyRequestFilterDateTimeWidget(
                  pickDate: (String date, DateTime dateTime) {
                    widget.myRequestFilter.toRequestedDate = dateTime;
                    widget.myRequestsFilterFunctions
                        .onPickToRequestedDate(date);
                  },
                  deleteDate:
                      widget.myRequestsFilterFunctions.onDeleteToRequestedDate,
                  dateTime: widget.myRequestFilter.toRequestedDate ??
                      DateTime(
                          DateTime.now().year, DateTime.now().month + 1, 0),
                  errorMassage:
                      widget.myRequestFilter.toRequestedDateErrorMessage,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            S.of(context).createDate,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: ColorSchemes.black),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: MyRequestFilterDateTimeWidget(
                    pickDate: (String date, DateTime dateTime) {
                      widget.myRequestFilter.fromCreatedDate = dateTime;
                      widget.myRequestsFilterFunctions
                          .onPickFromCreatedDate(date);
                    },
                    deleteDate: widget
                        .myRequestsFilterFunctions.onDeletedFromCreatedDate,
                    dateTime: widget.myRequestFilter.fromCreatedDate ??
                        DateTime(DateTime.now().year, DateTime.now().month, 1),
                    errorMassage:
                        widget.myRequestFilter.fromCreatedDateErrorMessage),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: MyRequestFilterDateTimeWidget(
                  pickDate: (String date, DateTime dateTime) {
                    widget.myRequestFilter.toCreatedDate = dateTime;
                    widget.myRequestsFilterFunctions.onPickToCreatedDate(date);
                  },
                  deleteDate:
                      widget.myRequestsFilterFunctions.onDeletedToCreatedDate,
                  dateTime: widget.myRequestFilter.toCreatedDate ??
                      DateTime(
                          DateTime.now().year, DateTime.now().month + 1, 0),
                  errorMassage:
                      widget.myRequestFilter.toCreatedDateErrorMessage,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            S.of(context).status,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: ColorSchemes.black),
          ),
          const SizedBox(height: 16),
          MyRequestsFilterStatusWidget(
              status: widget.myRequestFilter.status ?? []),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: CustomButtonWidget(
                  borderColor: ColorSchemes.gray,
                  onTap: widget.myRequestsFilterFunctions.onTapResetFilter,
                  textColor: ColorSchemes.gray,
                  backgroundColor: ColorSchemes.white,
                  text: S.of(context).reset,
                  fontWeight: Constants.fontWeightBold,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                  child: CustomGradientButtonWidget(
                      text: S.of(context).apply,
                      onTap: widget.myRequestsFilterFunctions.onTapApply)),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
