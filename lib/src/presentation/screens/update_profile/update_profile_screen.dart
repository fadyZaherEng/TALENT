import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/routes/routes_manager.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/request/request.dart';
import 'package:talent_link/src/presentation/blocs/update_profile/update_profile_bloc.dart';
import 'package:talent_link/src/presentation/screens/update_profile/widgets/update_profile_requests_content.dart';
import 'package:talent_link/src/presentation/screens/update_profile/widgets/update_profile_skeleton_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class UpdateProfileScreen extends BaseStatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends BaseState<UpdateProfileScreen> {
  UpdateProfileBloc get _bloc => BlocProvider.of<UpdateProfileBloc>(context);
  List<Request> _requests = [];

  @override
  void initState() {
    _bloc.add(GetUpdateProfileListEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<UpdateProfileBloc, UpdateProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileBackState) {
          Navigator.pop(context);
        } else if (state is UpdateProfileSuccessState) {
          _requests = state.requests;
        } else if (state is UpdateProfileErrorState) {
          _massageDialog(state.errorMassage, () {
            _bloc.add(UpdateProfileBackEvent());
          });
        } else if (state is NavigateToAddressScreenState) {
          Navigator.pushNamed(context, Routes.address);
        } else if (state is NavigateToContactScreenState) {
          Navigator.pushNamed(context, Routes.contact);
        } else if (state is NavigateToAttachmentScreenState) {
          Navigator.pushNamed(context, Routes.attachment);
        } else if (state is NavigateToAssetScreenState) {
          Navigator.pushNamed(context, Routes.asset);
        } else if (state is NavigateToEducationScreenState) {
          Navigator.pushNamed(context, Routes.education);
        }
      },
      builder: (context, state) {
        if (state is UpdateProfileSkeletonState) {
          return const UpdateProfileSkeletonWidget();
        }
        return Scaffold(
          appBar: buildAppBarWidget(context,
              title: S.of(context).updateProfile,
              isHaveBackButton: true, onBackButtonPressed: () {
            _bloc.add(UpdateProfileBackEvent());
          }),
          body: UpdateProfileContentWidget(
            requests: _requests,
            onTapItem: (Request request) {
              _bloc.add(NavigateToUpdateProfileScreensEvent(request: request));
            },
          ),
        );
      },
    );
  }

  void _massageDialog(massage, Function() onTap) {
    showMassageDialogWidget(
        context: context,
        text: massage,
        icon: ImagePaths.profile,
        buttonText: S.of(context).ok,
        onTap: onTap);
  }
}
