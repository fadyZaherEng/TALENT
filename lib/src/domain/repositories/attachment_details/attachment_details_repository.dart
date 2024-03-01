import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/attachment_details/attachment_details.dart';
import 'package:talent_link/src/domain/entities/education_details/education_details.dart';

abstract class AttachmentDetailsRepository {
  Future<DataState<AttachmentDetails>> getAttachmentDetails({
    required int transactionId,
  });
}
