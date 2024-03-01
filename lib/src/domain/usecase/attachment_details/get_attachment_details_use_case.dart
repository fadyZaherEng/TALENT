import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/attachment_details/attachment_details.dart';
import 'package:talent_link/src/domain/repositories/attachment_details/attachment_details_repository.dart';

class GetAttachmentDetailsUseCase {
  final AttachmentDetailsRepository _repository;

  GetAttachmentDetailsUseCase(this._repository);

  Future<DataState<AttachmentDetails>> call({
    required int transactionId,
  }) async {
    return await _repository.getAttachmentDetails(transactionId: transactionId);
  }
}
