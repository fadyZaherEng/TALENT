import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/core/resources/image_paths.dart';
import 'package:talent_link/src/core/utils/show_action_dialog_widget.dart';
import 'package:talent_link/src/core/utils/show_bottom_sheet_widget.dart';
import 'package:talent_link/src/core/utils/show_massage_dialog_widget.dart';
import 'package:talent_link/src/domain/entities/air_ticket/air_ticket.dart';
import 'package:talent_link/src/domain/entities/air_ticket/get_ait_ticket_by_employee.dart';
import 'package:talent_link/src/domain/entities/leave/single_selection_button.dart';
import 'package:talent_link/src/domain/entities/request/request_payment_method.dart';
import 'package:talent_link/src/presentation/blocs/air_ticket/air_ticket_bloc.dart';
import 'package:talent_link/src/presentation/screens/air_ticket/utils/air_ticket_controller.dart';
import 'package:talent_link/src/presentation/screens/air_ticket/utils/air_ticket_error_massage.dart';
import 'package:talent_link/src/presentation/screens/air_ticket/utils/air_ticket_functions.dart';
import 'package:talent_link/src/presentation/screens/air_ticket/utils/air_ticket_global_key.dart';
import 'package:talent_link/src/presentation/screens/air_ticket/widgets/air_ticket_content_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:talent_link/src/presentation/widgets/request_payment_method_bottom_sheet_widget.dart';

class AirTicketScreen extends BaseStatefulWidget {
  const AirTicketScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _AirTicketScreenState();
}

class _AirTicketScreenState extends BaseState<AirTicketScreen> {
  AirTicketBloc get _bloc => BlocProvider.of<AirTicketBloc>(context);
  final AirTicketErrorMassage _airTicketErrorMassage = AirTicketErrorMassage();
  AirTicketController _airTicketController = AirTicketController(
      requestedDate: TextEditingController(),
      airTicketDueMonth: TextEditingController(),
      airTicketDueYear: TextEditingController(),
      paymentMethod: TextEditingController());
  final AirTicketGlobalKey _airTicketGlobalKey = AirTicketGlobalKey(
      requestedDate: GlobalKey(),
      airTicketDueMonth: GlobalKey(),
      airTicketDueYear: GlobalKey(),
      paymentMethod: GlobalKey());

  final List<AirTicket> _airTickets = [
    AirTicket(
        id: "#",
        dependent: "Dependent",
        ticketAmount: "Ticket amount",
        destination: "Destination"),
  ];
  List<RequestPaymentMethod> _airTicketPaymentMethods = [];
  RequestPaymentMethod _airTicketPaymentMethod =
      RequestPaymentMethod(id: 0, name: '');
  bool _visiblePaymentMethod = false;
  int _isByPayroll = 0;
  String _requestedDate = '';
  String _airTicketDueMonth = '';
  String _airTicketDueYear = '';
  GetAirTicketByEmployee _getAirTicketByEmployee =
      const GetAirTicketByEmployee();

  @override
  void initState() {
    _bloc.add(GetPaymentAirTicketMethodEvent());
    _bloc.add(GetAirTicketByEmployeeEvent());
    _bloc.add(GetDependentAirTicketEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<AirTicketBloc, AirTicketState>(
      listener: (context, state) {
        if (state is AirTicketLoadingState) {
          showLoading();
        } else {
          hideLoading();
        }
        if (state is AirTicketBackState) {
          Navigator.pop(context);
        } else if (state is AirTicketOpenPaymentMethodBottomSheetState) {
          _openPaymentMethodBottomSheet();
        } else if (state is AirTicketSelectPaymentMethodState) {
          _airTicketController.paymentMethod.text = state.paymentMethod.name;
          _bloc.add(AirTicketValidationPaymentMethodEvent(
            value: state.paymentMethod.name,
            isVisible: _visiblePaymentMethod,
          ));
        } else if (state is AirTicketShowPaymentMethodTextFieldState) {
          _visiblePaymentMethod = state.visiblePaymentMethod;
          state.visiblePaymentMethod ? _isByPayroll = 1 : _isByPayroll = 0;
          if (state.visiblePaymentMethod == false) {
            _airTicketPaymentMethod = RequestPaymentMethod(id: 0, name: '');
            _airTicketController.paymentMethod.text = '';
            _airTicketErrorMassage.paymentMethod = null;
          }
        } else if (state is AirTicketValidationPaymentMethodEmptyState) {
          _airTicketErrorMassage.paymentMethod = state.validationMassage;
          _animateTo(_airTicketGlobalKey.paymentMethod);
        } else if (state is AirTicketValidationPaymentMethodValidState) {
          _airTicketErrorMassage.paymentMethod = null;
        } else if (state is AirTicketSubmitSuccessState) {
          _massageDialog(state.successMassage, () {
            _bloc.add(AirTicketBackEvent());
            _bloc.add(AirTicketBackEvent());
          });
        } else if (state is AirTicketGetPaymentMethodSuccessState) {
          _airTicketPaymentMethods = state.paymentMethod;
        } else if (state is AirTicketGetPaymentMethodErrorState) {
          _massageDialog(state.errorMessage, () {
            _bloc.add(AirTicketBackEvent());
          });
        } else if (state is GetDependentAirTicketSuccessState) {
          _airTickets.addAll(state.airTickets);
        } else if (state is GetAirTicketByEmployeeSuccessState) {
          _requestedDate = "";
          _airTicketDueMonth = state.getAirTicketByEmployee.dueTicketMonth;
          _airTicketDueYear = state.getAirTicketByEmployee.ticketYear;
          _airTicketController.airTicketDueMonth.text =
              state.getAirTicketByEmployee.dueTicketMonth;
          _airTicketController.airTicketDueYear.text =
              state.getAirTicketByEmployee.ticketYear;
          _getAirTicketByEmployee = state.getAirTicketByEmployee;
        } else if (state is GetDependentAirTicketErrorState) {
          _massageDialog(state.errorMessage, () {
            _bloc.add(AirTicketBackEvent());
          });
        } else if (state is GetAirTicketByEmployeeErrorState) {
          _massageDialog(state.errorMessage, () {
            _bloc.add(AirTicketBackEvent());
          });
        } else if (state is AirTicketValidationRequestDateNotValidState) {
          _airTicketErrorMassage.requestedDate = state.validationMessage;
          _animateTo(_airTicketGlobalKey.requestedDate);
        } else if (state is AirTicketValidationRequestDateValidState) {
          _airTicketErrorMassage.requestedDate = null;
        } else if (state is AirTicketValidationAirTicketDueMonthValidState) {
          _airTicketErrorMassage.airTicketDueMonth = null;
        } else if (state is AirTicketValidationAirTicketDueMonthNotValidState) {
          _airTicketErrorMassage.airTicketDueMonth = state.validationMessage;
          _animateTo(_airTicketGlobalKey.airTicketDueMonth);
        } else if (state is AirTicketValidationAirTicketDueYearValidState) {
          _airTicketErrorMassage.airTicketDueYear = null;
        } else if (state is AirTicketValidationAirTicketDueYearNotValidState) {
          _airTicketErrorMassage.airTicketDueYear = state.validationMessage;
          _animateTo(_airTicketGlobalKey.airTicketDueYear);
        } else if (state is CalculateInCaseAirTicketSuccessState) {
          _bloc.add(
            InsertAirTicketEvent(
              getAirTicketByEmployee: _getAirTicketByEmployee,
              serviceDays: state.calculateInCaseAirTicket.serviceDays,
              ticketAmount: state.calculateInCaseAirTicket.ticketAmount,
            ),
          );
        } else if (state is CalculateInCaseAirTicketErrorState) {
          _massageDialog(state.errorMessage, () => Navigator.pop(context));
        } else if (state is InsertAirTicketSuccessState) {
          _massageDialog(state.dataState.message, () => _pop(context));
        } else if (state is AirTicketValidationPaymentMethodEmptyState) {
          _massageDialog(state.validationMassage, () => _pop(context));
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () {
            _onBackEvent();
            return Future.value(true);
          },
          child: Scaffold(
            appBar: buildAppBarWidget(context,
                title: S.of(context).airTicket,
                isHaveBackButton: true, onBackButtonPressed: () {
              _onBackEvent();
            }),
            body: AirTicketContentWidget(
              airTicketErrorMassage: _airTicketErrorMassage,
              airTicketController: _airTicketController,
              airTicketGlobalKey: _airTicketGlobalKey,
              airTicketFunctions:
                  AirTicketFunctions(onPickRequestedDate: (value) {
                _requestedDate = value;
                _bloc.add(AirTicketValidationRequestDateEvent(value: value));
              }, onDeleteRequestedDate: () {
                _requestedDate = '';
                _bloc.add(AirTicketValidationRequestDateEvent(value: ''));
              }, onTapAirTicketDueMonth: () {
                _bloc.add(AirTicketValidationTicketDueMontEvent(value: ''));
              }, onTapAirTicketDueYear: () {
                _bloc.add(AirTicketValidationTicketDueYearEvent(value: ''));
              }, onSelectRadioButton: (SingleSelectionModel item) {
                _bloc.add(AirTicketShowPaymentMethodTextFieldEvent(
                    singleSelectionModel: item));
              }, onTapPaymentMethod: () {
                _bloc.add(AirTicketOpenPaymentMethodBottomSheetEvent());
              }, onTapSubmit: () {
                _bloc.add(AirTicketSubmitEvent(
                  airTicketController: _airTicketController,
                  isVisiblePaymentMethod: _visiblePaymentMethod,
                  requestedDate: _requestedDate,
                  isByPayroll: _isByPayroll,
                  airTicketDueMonth: _airTicketDueMonth,
                  airTicketDueYear: _airTicketDueYear,
                ));
              }),
              airTickets: _airTickets,
              visiblePaymentMethod: _visiblePaymentMethod,
            ),
          ),
        );
      },
    );
  }

  void _openPaymentMethodBottomSheet() {
    showBottomSheetWidget(
      height: 300,
      context: context,
      content: RequestPaymentMethodBottomSheetWidget(
        paymentMethods: _airTicketPaymentMethods,
        paymentMethod: _airTicketPaymentMethod,
      ),
      titleLabel: S.of(context).paymentMethod,
    ).then((value) {
      _airTicketPaymentMethod = value;
      _bloc.add(AirTicketSelectPaymentMethodEvent(
        paymentMethod: value,
      ));
    });
  }

  void _animateTo(GlobalKey? key) {
    Scrollable.ensureVisible(
      key?.currentContext ?? context,
      duration: const Duration(milliseconds: 500),
      alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtStart,
      curve: Curves.easeInOut,
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

  void _onBackEvent() {
    if (_areAllFieldsEmpty(_airTicketController) || _requestedDate.isEmpty) {
      _bloc.add(AirTicketBackEvent());
    } else {
      _showActionDialog(
          onPrimaryAction: () {
            _bloc.add(AirTicketBackEvent());
            _bloc.add(AirTicketBackEvent());
            _airTicketController = AirTicketController(
                requestedDate: TextEditingController(),
                airTicketDueMonth: TextEditingController(),
                airTicketDueYear: TextEditingController(),
                paymentMethod: TextEditingController());
            _requestedDate = '';
            _airTicketDueMonth = '';
            _airTicketDueYear = '';
          },
          onSecondaryAction: () {
            _bloc.add(AirTicketBackEvent());
          },
          primaryText: S.of(context).yes,
          secondaryText: S.of(context).no,
          text: S.of(context).areYouSureYouWantToDiscardTheChanges);
    }
  }

  bool _areAllFieldsEmpty(AirTicketController value) {
    return value.paymentMethod.text.isEmpty &&
        value.airTicketDueYear.text.isEmpty &&
        value.airTicketDueMonth.text.isEmpty &&
        value.requestedDate.text.isEmpty &&
        _requestedDate.isEmpty &&
        _airTicketDueMonth.isEmpty &&
        _airTicketDueYear.isEmpty;
  }

  _pop(BuildContext context) {
    Navigator.pop(context);
    Navigator.pop(context);
  }
}
