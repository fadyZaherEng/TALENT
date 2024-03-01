import 'dart:io';

import 'package:flutter/material.dart';

import 'package:talent_link/src/domain/entities/profile/profile_employee.dart';
import 'package:talent_link/src/presentation/blocs/profile/profile_bloc.dart';
import 'package:talent_link/src/presentation/screens/profile/utils/show_bottom_sheet.dart';
import 'package:talent_link/src/presentation/screens/profile/widgets/basic_profile_information_widget.dart';
import 'package:talent_link/src/presentation/screens/profile/widgets/image_profile_widget.dart';
import 'package:talent_link/src/presentation/screens/profile/widgets/position_profile_information_widget.dart';
import 'package:talent_link/src/presentation/screens/profile/widgets/salary_profile_information_widget.dart';

class ProfileBodyWidget extends StatefulWidget {
  final ProfileBloc bloc;
  final ProfileEmployee profileEmployee;
  final String? profileImage;

  const ProfileBodyWidget({
    super.key,
    required this.bloc,
    required this.profileEmployee,
    this.profileImage,
  });

  @override
  State<ProfileBodyWidget> createState() => _ProfileBodyWidgetState();
}

class _ProfileBodyWidgetState extends State<ProfileBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 8),
        ProfileImageWidget(
          onCameraPressed: () {
            showProfileBottomSheet(
              context: context,
              bloc: widget.bloc,
            );
          },
          imageUrl: widget.profileEmployee.mobileImageFilePath ?? "",
          profileImage: widget.profileImage,
        ),
        const SizedBox(
          height: 20,
        ),
        BasicsProfileInformationWidget(
          profileEmployee: widget.profileEmployee,
        ),
        PositionProfileInformationWidget(
          profileEmployee: widget.profileEmployee,
        ),
        SalaryProfileInformationWidget(
          profileEmployee: widget.profileEmployee,
        ),
      ],
    );
  }
}
