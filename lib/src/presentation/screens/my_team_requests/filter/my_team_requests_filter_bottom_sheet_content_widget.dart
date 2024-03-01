import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/domain/entities/get_my_team_request/get_companies_and_employees_list/allow_companies.dart';
import 'package:talent_link/src/domain/entities/my_team_requests_filter/my_team_requests_filter.dart';
import 'package:talent_link/src/presentation/screens/my_team_requests/filter/my_team_request_filter_date_time_widget.dart';
import 'package:talent_link/src/presentation/screens/my_team_requests/filter/utils/my_team_requests_filter_functions.dart';
import 'package:talent_link/src/presentation/widgets/compaines_level_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_text_field_with_suffix_icon_widget.dart';

class MyTeamRequestsFilterBottomSheetContentWidget extends StatelessWidget {
  final MyTeamRequestFilter myTeamRequestFilter;
  final TextEditingController requestsController;
  final TextEditingController employeeController;
  final TextEditingController companyController;
  final MyTeamRequestsFilterFunctions myTeamRequestsFilterFunctions;
  final List<AllowedCompanies> allowedCompanies;

  const MyTeamRequestsFilterBottomSheetContentWidget({
    super.key,
    required this.myTeamRequestFilter,
    required this.requestsController,
    required this.employeeController,
    required this.companyController,
    required this.myTeamRequestsFilterFunctions,
    required this.allowedCompanies,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: allowedCompanies
                  .map((company) => CompaniesLevelWidget(
                        onTap: () => myTeamRequestsFilterFunctions
                            .onSelectCompany(company),
                        buttonTitle: company.companyName,
                        onTapClose: () => myTeamRequestsFilterFunctions
                            .onCloseCompany(company),
                        isAllItems: false,
                        isSelected: company.isSelected,
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(height: 16),
          CustomTextFieldWithSuffixIconWidget(
            errorMessage: null,
            controller: employeeController,
            isReadOnly: true,
            suffixIcon: SvgPicture.asset(
              ImagePaths.arrowDown,
              fit: BoxFit.scaleDown,
            ),
            labelTitle: S.of(context).employee,
            onChanged: (String value) {},
            onTap: myTeamRequestsFilterFunctions.onTapEmployee,
          ),
          const SizedBox(height: 16),
          CustomTextFieldWithSuffixIconWidget(
            errorMessage: null,
            controller: requestsController,
            isReadOnly: true,
            suffixIcon: SvgPicture.asset(
              ImagePaths.arrowDown,
              fit: BoxFit.scaleDown,
            ),
            labelTitle: S.of(context).request,
            onChanged: (String value) {},
            onTap: myTeamRequestsFilterFunctions.onTapRequest,
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
                child: MyTeamRequestFilterDateTimeWidget(
                    pickDate: (String date, DateTime dateTime) {
                      myTeamRequestFilter.fromRequestedDate = dateTime;
                      myTeamRequestsFilterFunctions
                          .onPickFromRequestedDate(date);
                    },
                    deleteDate:
                        myTeamRequestsFilterFunctions.onDeleteFromRequestedDate,
                    dateTime: myTeamRequestFilter.fromRequestedDate ??
                        DateTime(DateTime.now().year, DateTime.now().month, 1),
                    errorMassage:
                        myTeamRequestFilter.fromRequestedDateErrorMessage),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: MyTeamRequestFilterDateTimeWidget(
                  pickDate: (String date, DateTime dateTime) {
                    myTeamRequestFilter.toRequestedDate = dateTime;
                    myTeamRequestsFilterFunctions.onPickToRequestedDate(date);
                  },
                  deleteDate:
                      myTeamRequestsFilterFunctions.onDeleteToRequestedDate,
                  dateTime: myTeamRequestFilter.toRequestedDate ??
                      DateTime(
                          DateTime.now().year, DateTime.now().month + 1, 0),
                  errorMassage: myTeamRequestFilter.toRequestedDateErrorMessage,
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
                child: MyTeamRequestFilterDateTimeWidget(
                    pickDate: (String date, DateTime dateTime) {
                      myTeamRequestFilter.fromCreatedDate = dateTime;
                      myTeamRequestsFilterFunctions.onPickFromCreatedDate(date);
                    },
                    deleteDate:
                        myTeamRequestsFilterFunctions.onDeletedFromCreatedDate,
                    dateTime: myTeamRequestFilter.fromCreatedDate ??
                        DateTime(DateTime.now().year, DateTime.now().month, 1),
                    errorMassage:
                        myTeamRequestFilter.fromCreatedDateErrorMessage),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: MyTeamRequestFilterDateTimeWidget(
                  pickDate: (String date, DateTime dateTime) {
                    myTeamRequestFilter.toCreatedDate = dateTime;
                    myTeamRequestsFilterFunctions.onPickToCreatedDate(date);
                  },
                  deleteDate:
                      myTeamRequestsFilterFunctions.onDeletedToCreatedDate,
                  dateTime: myTeamRequestFilter.toCreatedDate ??
                      DateTime(
                          DateTime.now().year, DateTime.now().month + 1, 0),
                  errorMassage: myTeamRequestFilter.toCreatedDateErrorMessage,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: CustomButtonWidget(
                  borderColor: ColorSchemes.gray,
                  onTap: myTeamRequestsFilterFunctions.onTapResetFilter,
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
                    onTap: myTeamRequestsFilterFunctions.onTapApply),
              ),

              // CustomButtonWidget(onTap: () {}, text: S.of(context).reset,height: 50),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
