import 'package:talent_link/src/core/resources/data_state.dart';
import 'package:talent_link/src/domain/entities/request/request_type.dart';
import 'package:talent_link/src/domain/repositories/attachment/attachment_repository.dart';

class GetAttachmentTypeListUseCase {
  final AttachmentRepository _repository;

  GetAttachmentTypeListUseCase(this._repository);

  Future<DataState<List<RequestType>>> call() async {
    return await _repository.attachmentType();
  }
}
