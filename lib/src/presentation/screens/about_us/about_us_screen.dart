import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/get_subscribe_info/get_subscribe_info.dart';
import 'package:talent_link/src/presentation/blocs/about_us/about_us_bloc.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class AboutUsScreen extends BaseStatefulWidget {
  const AboutUsScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends BaseState<AboutUsScreen> {
  AboutUsBloc get _bloc => BlocProvider.of<AboutUsBloc>(context);
  GetSubscribeInfo? _getSubscribeInfo;

  @override
  void initState() {
    _bloc.add(GetAboutUsEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<AboutUsBloc, AboutUsState>(listener: (context, state) {
      if (state is AboutUsLoadingState) {
        showLoading();
      } else {
        hideLoading();
      }
      if (state is GetAboutUsSuccessState) {
        _getSubscribeInfo = state.getSubscribeInfo;
      } else if (state is GetAboutUsErrorState) {
        _massageDialog(state.errorMessage, () => _bloc.add(AboutUsBackEvent()));
      } else if (state is AboutUsBackState) {
        Navigator.pop(context);
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: buildAppBarWidget(context,
            title: S.of(context).aboutUs,
            isHaveBackButton: true, onBackButtonPressed: () {
          _bloc.add(AboutUsBackEvent());
        }),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(_getSubscribeInfo?.aboutUs ?? "",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: ColorSchemes.black,
                  )),
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
