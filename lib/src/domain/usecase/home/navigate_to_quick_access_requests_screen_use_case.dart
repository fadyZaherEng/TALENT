import 'package:talent_link/src/presentation/blocs/home/home_bloc.dart';

class NavigateToQuickAccessRequestsScreenUseCase {
  HomeState call({
    required HomeState requestState,
    required int id,
  }) {
    if (id == 4151) {
      requestState = NavigateToLeaveScreenState();
    } else if (id == 4152) {
      requestState = NavigateToShortLeaveScreenState();
    } else if (id == 4153) {
      requestState = NavigateToLeaveEncashmentScreenState();
    } else if (id == 4155) {
      requestState = NavigateToLoanScreenState();
    } else if (id == 4156) {
      requestState = NavigateToIndemnityScreenState();
    } else if (id == 4157) {
      requestState = NavigateToAirTicketScreenState();
    } else if (id == 4159) {
      requestState = NavigateToHalfDayLeaveScreenState();
    } else if (id == 5158) {
      requestState = NavigateToResumeDutyScreenState();
    } else if (id == 5157) {
      requestState = NavigateToBusinessTripScreenState();
    } else if (id == 6168) {
      requestState = NavigateToOtherRequestScreenState();
    }

    return requestState;
  }
}
