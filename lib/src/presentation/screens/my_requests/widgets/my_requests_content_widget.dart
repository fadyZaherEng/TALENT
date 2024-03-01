import 'package:flutter/material.dart';

import 'package:talent_link/src/config/routes/routes_manager.dart';
import 'package:talent_link/src/domain/entities/my_requests/my_request.dart';
import 'package:talent_link/src/presentation/screens/my_requests/widgets/my_request_empty_scrren_widget.dart';
import 'package:talent_link/src/presentation/screens/my_requests/widgets/my_request_item_widget.dart';

class MyRequestsContentWidget extends StatelessWidget {
  final List<MyRequest> myRequests;
  final void Function(MyRequest myRequest) onTapCancel;
  final void Function(MyRequest myRequest) onTapTimeLine;

  const MyRequestsContentWidget({
    super.key,
    required this.myRequests,
    required this.onTapCancel,
    required this.onTapTimeLine,
  });

  @override
  Widget build(BuildContext context) {
    return myRequests.isEmpty
        ? const MyTeamRequestEmptyScreenWidget()
        : ListView.builder(
            itemCount: myRequests.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: InkWell(
                  onTap: () {
                    _selectOtherRequest(
                      context,
                      myRequests[index].transactionId,
                      myRequests[index].id,
                    );
                  },
                  child: MyRequestItemWidget(
                    myRequest: myRequests[index],
                    onTapCancel: (MyRequest myRequest) =>
                        onTapCancel(myRequest),
                    onTapTimeLine: (MyRequest myRequest) =>
                        onTapTimeLine(myRequest),
                  ),
                ),
              );
            });
  }

  void _selectOtherRequest(
    BuildContext context,
    int transactionId,
    int referenceId,
  ) {
    Map<String, dynamic> request = {};
    request['transactionId'] = transactionId;
    request['referenceId'] = referenceId;
    request['isFromMyRequest'] = true;
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
      Navigator.pushNamed(context, Routes.halfDayLeaveDetails,
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
