import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/profile/profile_employee.dart';
import 'package:talent_link/src/presentation/blocs/profile/profile_bloc.dart';
import 'package:talent_link/src/presentation/screens/profile/widgets/profile_body_widget.dart';
import 'package:talent_link/src/presentation/screens/profile/widgets/profile_shimmer_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class ProfileScreen extends BaseStatefulWidget {
  const ProfileScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseState<ProfileScreen> {
  String? profileImage;
  ProfileBloc get _bloc => BlocProvider.of<ProfileBloc>(context);
  ProfileEmployee? profileEmployee;

  @override
  void initState() {
    _bloc.add(GetProfileInfoEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(
        context,
        title: S.of(context).profile,
        isHaveBackButton: false,
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileChangeImageSuccessState) {
            profileImage = state.profileImage;
          } else if (state is ProfileChangeImagePopDialogState) {
            _pop();
          } else if (state is ProfileGetInfoSuccessState) {
            profileEmployee = state.profileEmployee;
          } else if (state is ProfileGetInfoErrorState) {
            _massageDialog(massage: state.errorMSG);
          } else if (state is ProfileHideLoadingState) {
            hideLoading();
          } else if (state is ProfileChangeImageLoadingState) {
            showLoading();
          }
        },
        builder: (context, state) {
          if (profileEmployee == null) {
            return const ProfileShimmerWidget();
          } else {
            return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ProfileBodyWidget(
                  bloc: _bloc,
                  profileEmployee: profileEmployee ??  ProfileEmployee(),
                  profileImage: profileImage,
                ));
          }
        },
      ),
    );
  }

  void _pop() => Navigator.pop(context);

  void _massageDialog({
    required String massage,
  }) =>
      showMassageDialogWidget(
        context: context,
        text: massage,
        icon: ImagePaths.profile,
        buttonText: S.of(context).ok,
        onTap: _pop,
      );
}
