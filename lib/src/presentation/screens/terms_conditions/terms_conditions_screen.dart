import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/presentation/blocs/terms_conditions/terms_conditions_bloc.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';
import '../../../domain/entities/get_subscribe_info/get_subscribe_info.dart';

class TermsConditionsScreen extends BaseStatefulWidget {
  const TermsConditionsScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends BaseState<TermsConditionsScreen> {
  TermsConditionsBloc get _bloc =>
      BlocProvider.of<TermsConditionsBloc>(context);
  GetSubscribeInfo? _getSubscribeInfo;

  @override
  void initState() {
    _bloc.add(GetTermsConditionsEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<TermsConditionsBloc, TermsConditionsState>(
        listener: (context, state) {
      if (state is TermsConditionsLoadingState) {
        showLoading();
      } else {
        hideLoading();
      }
      if (state is TermsConditionsSuccessState) {
        _getSubscribeInfo = state.getSubscribeInfo;
      } else if (state is TermsConditionsBackState) {
        Navigator.pop(context);
      } else if (state is TermsConditionsErrorState) {
        _massageDialog(
          state.errorMassage,
          () => _bloc.add(TermsConditionsBackEvent()),
        );
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: buildAppBarWidget(context,
            title: S.of(context).termsConditions,
            isHaveBackButton: true, onBackButtonPressed: () {
          _bloc.add(TermsConditionsBackEvent());
        }),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(_getSubscribeInfo?.termsAndConditions ?? '',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: ColorSchemes.black),
              textAlign: TextAlign.start),
        ),
      );
    });
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
