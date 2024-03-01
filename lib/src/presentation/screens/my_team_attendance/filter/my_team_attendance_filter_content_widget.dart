import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/constants.dart';
import 'package:talent_link/src/domain/entities/get_my_team_request/get_companies_and_employees_list/allow_companies.dart';
import 'package:talent_link/src/domain/entities/my_team_attendance_filter/my_team_attendance_filter.dart';
import 'package:talent_link/src/presentation/screens/my_team_attendance/filter/my-team_attendance_filter_date_time_widget.dart';
import 'package:talent_link/src/presentation/screens/my_team_attendance/filter/utils/my_team_attendance_filter_functions.dart';
import 'package:talent_link/src/presentation/widgets/compaines_level_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:talent_link/src/presentation/widgets/custom_text_field_with_suffix_icon_widget.dart';

class MyTeamAttendanceFilterContentWidget extends StatelessWidget {
  final TextEditingController employeeController;
  final TextEditingController companyController;
  final MyTeamAttendanceFilterFunctions myTeamAttendanceFilterFunctions;
  final MyTeamAttendanceFilter myTeamAttendanceFilter;
  final List<AllowedCompanies> allowedCompanies;

  const MyTeamAttendanceFilterContentWidget({
    super.key,
    required this.employeeController,
    required this.companyController,
    required this.myTeamAttendanceFilterFunctions,
    required this.myTeamAttendanceFilter,
    required this.allowedCompanies,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: allowedCompanies
                  .map((company) => CompaniesLevelWidget(
                        onTap: () => myTeamAttendanceFilterFunctions
                            .onSelectCompany(company),
                        buttonTitle: company.companyName,
                        onTapClose: () => myTeamAttendanceFilterFunctions
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
            onTap: myTeamAttendanceFilterFunctions.onTapEmployee,
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: MyTeamAttendanceFilterDateTimeWidget(
                    pickDate: (String date, DateTime dateTime) {
                      myTeamAttendanceFilter.fromDate = dateTime;
                      myTeamAttendanceFilterFunctions.onPickFromDate(date);
                    },
                    deleteDate:
                        myTeamAttendanceFilterFunctions.onDeleteFromDate,
                    dateTime: myTeamAttendanceFilter.fromDate ??
                        DateTime(DateTime.now().year, DateTime.now().month, 1),
                    errorMassage: myTeamAttendanceFilter.fromDateErrorMessage),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: MyTeamAttendanceFilterDateTimeWidget(
                  pickDate: (String date, DateTime dateTime) {
                    myTeamAttendanceFilter.toDate = dateTime;
                    myTeamAttendanceFilterFunctions.onPickToDate(date);
                  },
                  deleteDate: myTeamAttendanceFilterFunctions.onDeleteToDate,
                  dateTime: myTeamAttendanceFilter.toDate ??
                      DateTime(
                          DateTime.now().year, DateTime.now().month + 1, 0),
                  errorMassage: myTeamAttendanceFilter.toDateErrorMessage,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: CustomButtonWidget(
                  borderColor: ColorSchemes.gray,
                  onTap: myTeamAttendanceFilterFunctions.onTapResetFilter,
                  textColor: ColorSchemes.gray,
                  backgroundColor: ColorSchemes.white,
                  text: S.of(context).reset,
                  fontWeight: Constants.fontWeightBold,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child:
              CustomGradientButtonWidget(
                  text: S.of(context).apply,
                  onTap: myTeamAttendanceFilterFunctions.onTapApply)),
            ],
          )
        ],
      ),
    );
  }
}
