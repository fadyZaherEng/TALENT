import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:talent_link/generated/l10n.dart';
import 'package:talent_link/src/core/base/widget/base_stateful_widget.dart';
import 'package:talent_link/src/domain/entities/payslip/payslip.dart';
import 'package:talent_link/src/presentation/blocs/payslip/payslip_bloc.dart';
import 'package:talent_link/src/presentation/blocs/payslip/payslip_event.dart';
import 'package:talent_link/src/presentation/blocs/payslip/payslip_state.dart';
import 'package:talent_link/src/presentation/screens/payslip/utils/show_massage_dialog.dart';
import 'package:talent_link/src/presentation/screens/payslip/widgets/payslip_body_widget.dart';
import 'package:talent_link/src/presentation/screens/payslip/widgets/payslip_shimmer_widget.dart';
import 'package:talent_link/src/presentation/widgets/build_app_bar_widget.dart';

class PayslipScreen extends BaseStatefulWidget {
  const PayslipScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _PayslipScreenState();
}

class _PayslipScreenState extends BaseState<PayslipScreen> {
  Payslip? payslipModel;

  PayslipBloc get _bloc => BlocProvider.of<PayslipBloc>(context);

  @override
  void initState() {
    _getPayslip(dateTime: DateTime.now());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<PayslipBloc, PayslipState>(
      listener: (context, state) {
        if (state is PayslipGetDataSuccessState) {
          payslipModel = state.payslipModel;
        } else if (state is PayslipGetDataErrorState) {
          showProfileMassageDialog(massage: state.errorMSG, context: context);
        } else if (state is PayslipHideLoadingState) {
          hideLoading();
        } else if (state is PayslipGetChangeDataLoadingState) {
          showLoading();
        } else if (state is PayslipGetChangeDataSuccessState) {
          payslipModel = state.payslipModel;
        } else if (state is PayslipGetChangeDataErrorState) {
          showProfileMassageDialog(massage: state.errorMSG, context: context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: buildAppBarWidget(
            context,
            title: S.of(context).payslip,
            isHaveBackButton: false,
          ),
          body: payslipModel == null
              ? const PayslipShimmerWidget()
              : PayslipBodyWidget(
                  payslip: payslipModel ?? const Payslip(),
                  onPreviousMonth: (dateTime) {
                    _getPayslipChangeDate(dateTime: dateTime);
                  },
                  onNextMonth: (dateTime) {
                    _getPayslipChangeDate(dateTime: dateTime);
                  },
                  getPayslip: (dateTime) {
                    _getPayslip(dateTime: dateTime);
                  },
                ),
        );
      },
    );
  }

  void _getPayslip({
    required DateTime dateTime,
  }) {
    _bloc.add(PayslipGetDataEvent(
      year: dateTime.year,
      month: dateTime.month.toString(),
    ));
  }

  void _getPayslipChangeDate({
    required DateTime dateTime,
  }) {
    _bloc.add(PayslipGetChangeDataEvent(
      year: dateTime.year,
      month: dateTime.month.toString(),
    ));
  }
}
