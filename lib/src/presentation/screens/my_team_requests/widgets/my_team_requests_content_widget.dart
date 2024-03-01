import 'package:flutter/material.dart';

import 'package:talent_link/src/config/routes/routes_manager.dart';
import 'package:talent_link/src/domain/entities/get_my_team_request/get_my_team_request.dart';
import 'package:talent_link/src/presentation/screens/my_team_requests/widgets/my_team_request_item_widget.dart';
import 'package:talent_link/src/presentation/screens/my_team_requests/widgets/my_team_requests_empty_screen_widget.dart';

class MyTeamRequestsContentWidget extends StatelessWidget {
  final List<MyTeamRequest> myTeamRequests;
  final void Function(MyTeamRequest myTeamRequests) onTapTimeLine;

  const MyTeamRequestsContentWidget({
    super.key,
    required this.myTeamRequests,
    required this.onTapTimeLine,
  });

  @override
  Widget build(BuildContext context) {
    return myTeamRequests.isNotEmpty
        ? ListView.builder(
            itemCount: myTeamRequests.length,
            padding: const EdgeInsets.only(top: 20),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
                child: InkWell(
                  onTap: () {
                    _selectOtherRequest(
                      context,
                      myTeamRequests[index].transactionId,
                      myTeamRequests[index].referenceId,
                    );
                  },
                  child: MyTeamRequestItemWidget(
                    myTeamRequest: myTeamRequests[index],
                    onTapTimeLine: (MyTeamRequest myTeamRequest) =>
                        onTapTimeLine(myTeamRequest),
                  ),
                ),
              );
            })
        : const MyTeamRequestsEmptyScreenWidget();
  }

  void _selectOtherRequest(
    BuildContext context,
    int transactionId,
    int referenceId,
  ) {
    Map<String, dynamic> request = {};
    request['transactionId'] = transactionId;
    request['referenceId'] = referenceId;
    request['isFromMyRequest'] = false;
    if (referenceId == 3) {
      Navigator.pushNamed(context, Routes.shortLeaveDetails,
          arguments: request);
    }
    if (referenceId == 9) {
      Navigator.pushNamed(context, Routes.otherRequestDetails,
          arguments: request);
    }
    if (referenceId == 12) {
      Navigator.pushNamed(context, Routes.leaveEncashmentDetails,
          arguments: request);
    }
    if (referenceId == 22) {
      Navigator.pushNamed(context, Routes.airTicketDetails, arguments: request);
    }
    if (referenceId == 6) {
      Navigator.pushNamed(context, Routes.loanDetails, arguments: request);
    }
    if (referenceId == 1) {
      Navigator.pushNamed(context, Routes.leaveDetails, arguments: request);
    }
    if (referenceId == 19) {
      Navigator.pushNamed(context, Routes.resumeDutyDetails,
          arguments: request);
    }
    if (referenceId == 25) {
      Navigator.pushNamed(context, Routes.indemnityEncashmentDetails,
          arguments: request);
    }
    if (referenceId == 5) {
      Navigator.pushNamed(context, Routes.indemnityEncashmentDetails,
          arguments: request);
    }
    if (referenceId == 1013) {
      Navigator.pushNamed(context, Routes.educationDetails, arguments: request);
    }
    if (referenceId == 1011) {
      Navigator.pushNamed(context, Routes.attachmentDetails,
          arguments: request);
    }
    if (referenceId == 1012) {
      Navigator.pushNamed(context, Routes.assetDetails, arguments: request);
    }
    if (referenceId == 1009) {
      Navigator.pushNamed(context, Routes.addressDetails, arguments: request);
    }
    if (referenceId == 1010) {
      Navigator.pushNamed(context, Routes.contactDetails, arguments: request);
    }
  }
}
