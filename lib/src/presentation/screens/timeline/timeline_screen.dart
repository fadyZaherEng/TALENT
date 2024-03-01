import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/get_time_line/get_time_line.dart';
import 'package:talent_link/src/domain/entities/timeline/timeline.dart';
import 'package:talent_link/src/presentation/blocs/timeline/timeline_bloc.dart';
import 'package:talent_link/src/presentation/screens/timeline/widgets/time_line_content_widget.dart';
import 'package:talent_link/src/presentation/screens/timeline/widgets/timeline_skeleton_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class TimelineScreen extends BaseStatefulWidget {
  final Timeline timeline;

  const TimelineScreen({super.key, required this.timeline});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _TimelineScreenState();
}

class _TimelineScreenState extends BaseState<TimelineScreen> {
  TimelineBloc get _bloc => BlocProvider.of<TimelineBloc>(context);
  List<GetTimeLine> _timelines = [];

  @override
  void initState() {
    _bloc.add(GetTimelineEvent(timeline: widget.timeline));
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<TimelineBloc, TimelineState>(
      listener: (context, state) {
        if (state is TimelineBackState) {
          Navigator.pop(context);
        } else if (state is GetTimeLineSuccessState) {
          _timelines = state.timelines;
        } else if (state is GetTimeLineErrorState) {
          _massageDialog(state.errorMessage, () {
            _bloc.add(TimelineBackEvent());
          });
        }
      },
      builder: (context, state) {
        if (state is GetTimeLineSkeletonState) {
          return const TimelineSkeletonWidget();
        }
        return Scaffold(
          appBar: buildAppBarWidget(context,
              title: S.of(context).timeline,
              isHaveBackButton: true, onBackButtonPressed: () {
            _bloc.add(TimelineBackEvent());
          }),
          body: TimelineContentWidget(timelines: _timelines),
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
