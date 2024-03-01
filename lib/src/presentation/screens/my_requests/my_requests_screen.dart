import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/config/routes/routes_manager.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_action_dialog_widget.dart';
import 'package:talent_link/src/core/utils/show_bottom_sheet_widget.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/my_requests/my_request.dart';
import 'package:talent_link/src/domain/entities/timeline/timeline.dart';
import 'package:talent_link/src/presentation/blocs/my_requests/my_requests_bloc.dart';
import 'package:talent_link/src/presentation/screens/my_requests/filter/my_requests_filter_bottom_sheet_widget.dart';
import 'package:talent_link/src/presentation/screens/my_requests/widgets/my_requests_content_widget.dart';
import 'package:talent_link/src/presentation/screens/my_requests/widgets/my_requests_skeleton_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';
import '../../../domain/entities/my_requests/my_request_filter.dart';

class MyRequestsScreen extends BaseStatefulWidget {
  const MyRequestsScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _MyRequestsScreenState();
}

class _MyRequestsScreenState extends BaseState<MyRequestsScreen> {
  MyRequestsBloc get _bloc => BlocProvider.of<MyRequestsBloc>(context);
  List<MyRequest> _myRequests = [];
  MyRequestFilter _myRequestFilter = MyRequestFilter(requests: [], status: []);

  @override
  void initState() {
    _bloc.add(GetMyRequestsEvent(
        myRequestFilter: MyRequestFilter(
      fromRequestedDate: DateTime(DateTime.now().year, DateTime.now().month, 1),
      toCreatedDate: DateTime(DateTime.now().year, DateTime.now().month + 1, 0),
      fromCreatedDate: DateTime(DateTime.now().year, DateTime.now().month, 1),
      toRequestedDate:
          DateTime(DateTime.now().year, DateTime.now().month + 1, 0),
    )));
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<MyRequestsBloc, MyRequestsState>(
        listener: (context, state) {
      if (state is CancelRequestLoadingState) {
        showLoading();
      } else {
        hideLoading();
      }
      if (state is GetMyRequestsSuccessState) {
        _myRequests = _sortMyRequestsByDate(state.myRequests);
        if (_myRequestFilter.requests!.isEmpty) {
          _bloc.add(GetAllRequestsListEvent());
        }
        if (_myRequestFilter.status!.isEmpty) {
          _bloc.add(GetTransactionStatusEvent());
        }
      } else if (state is GetMyRequestsErrorState) {
        _massageDialog(state.errorMessage, () {
          _bloc.add(MyRequestsBackEvent());
        });
      } else if (state is MyRequestsBackState) {
        Navigator.pop(context);
      } else if (state is OpenMyRequestFilterBottomSheetState) {
        _openFilter();
      } else if (state is GetMyRequestsFilterSuccessState) {
        _myRequestFilter = state.myRequestFilter.copy();
      } else if (state is ApplyFilterMyRequestsState) {
        _myRequestFilter = state.myRequestFilter;
        _bloc.add(GetMyRequestsEvent(myRequestFilter: state.myRequestFilter));
      } else if (state is CancelRequestSuccessState) {
        _massageDialog(state.successMessage, () {
          _bloc.add(MyRequestsBackEvent());
          _bloc.add(GetMyRequestsEvent(myRequestFilter: _myRequestFilter));
        });
      } else if (state is CancelRequestErrorState) {
        _massageDialog(state.errorMessage, () {
          _bloc.add(MyRequestsBackEvent());
        });
      } else if (state is GetAllRequestsListErrorState) {
        _massageDialog(state.errorMessage, () {
          _bloc.add(MyRequestsBackEvent());
        });
      } else if (state is GetTransactionStatueErrorState) {
        _massageDialog(state.errorMessage, () {
          _bloc.add(MyRequestsBackEvent());
        });
      } else if (state is MyRequestsNavigationToTimelineScreenState) {
        Navigator.pushNamed(context, Routes.timeline,
            arguments: state.timeline);
      }
    }, builder: (context, state) {
      if (state is GetMyRequestsSkeletonState) {
        return const MyRequestsSkeletonWidget();
      }
      return Scaffold(
          appBar: buildAppBarWidget(context,
              title: S.of(context).myRequests,
              isHaveBackButton: true, onBackButtonPressed: () {
            _bloc.add(MyRequestsBackEvent());
          },
              actionWidget: InkWell(
                onTap: () {
                  _bloc.add(OpenMyRequestFilterBottomSheetEvent());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SvgPicture.asset(
                    ImagePaths.filter,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              )),
          body: MyRequestsContentWidget(
            myRequests: _myRequests,
            onTapCancel: (MyRequest myRequest) {
              _showActionDialog(
                  onPrimaryAction: () {
                    _bloc.add(MyRequestsBackEvent());
                    _bloc.add(CancelRequestEvent(myRequest: myRequest));
                  },
                  onSecondaryAction: () {
                    _bloc.add(MyRequestsBackEvent());
                  },
                  primaryText: S.of(context).yes,
                  secondaryText: S.of(context).no,
                  text: S.of(context).areYouSureYouWantCancelRequest);
            },
            onTapTimeLine: (MyRequest myRequest) {
              _bloc.add(MyRequestsNavigationToTimelineScreenEvent(
                  timeline: Timeline(
                      transactionId: myRequest.transactionId,
                      tableId: myRequest.id,
                      baseUrl: '')));
            },
          ));
    });
  }

  void _openFilter() {
    showBottomSheetWidget(
            height: 530,
            context: context,
            content: MyRequestsFilterBottomSheetWidget(
                myRequestFilter: _myRequestFilter.copy()),
            titleLabel: '')
        .then((value) {
      if (value != null) {
        _bloc.add(ApplyFilterMyRequestsEvent(myRequestFilter: value));
      }
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

  Future _showActionDialog({
    required Function() onPrimaryAction,
    required Function() onSecondaryAction,
    required String primaryText,
    required String secondaryText,
    required String text,
  }) {
    return showActionDialogWidget(
      context: context,
      text: text,
      primaryText: primaryText,
      primaryAction: onPrimaryAction,
      secondaryText: secondaryText,
      secondaryAction: onSecondaryAction,
      icon: ImagePaths.approve,
    );
  }

  List<MyRequest> _sortMyRequestsByDate(List<MyRequest> requests) {
    requests.sort((a, b) => b.date.compareTo(a.date));
    return requests;
  }

}
