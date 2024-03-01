import 'package:talent_link/src/domain/entities/request/request.dart';

class GetRequestsListUseCase {
  List<Request> call({required List<Request> allRequests,required List<Request> requests,required int id}) {
    List<Request> requestsDisplay =[];
    for (var remoteRequest in allRequests) {
      if (remoteRequest.id == id) {
        remoteRequest.requests?.forEach((element) {
          for (var request in requests) {
            if (request.id == element.id) {
              request.id = element.id;
              request.text = element.text;
              request.isReturned = true;
            }
          }
        });
      }
    }
    for (var element in requests) {
      if (element.isReturned == true) {
        requestsDisplay.add(element);
      }
    }

    return requestsDisplay;
  }
}
