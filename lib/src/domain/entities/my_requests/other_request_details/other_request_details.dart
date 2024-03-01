import 'package:talent_link/src/domain/entities/my_requests/employee.dart';
import 'package:talent_link/src/domain/entities/my_requests/other_request_details/employee_other_request_attachments.dart';
import 'package:talent_link/src/domain/entities/my_requests/other_request_details/employee_other_requests_wf.dart';

class GetOtherRequestDetails {
  final int id;
  final int companyId;
  final String companyName;
  final int employeeId;
  final String employeeName;
  final int otherRequestId;
  final String otherRequestName;
  final String requestedDate;
  final String requestNote;
  final int transactionStatusId;
  final String transactionStatusName;
  final String transactionStatusCode;
  final String remarks;
  final int workFlowId;
  final String workFlowName;
  final String filePath;
  final String fileName;
  final String fileSource;
  final bool isEnabled;
  final List<EmployeeOtherRequestAttachments> employeeOtherRequestAttachments;
  final List<EmployeeOtherRequestWF> employeeOtherRequestWF;
  final Employee? employee;

  const GetOtherRequestDetails({
    required this.id,
    required this.companyId,
    required this.companyName,
    required this.employeeId,
    required this.employeeName,
    required this.otherRequestId,
    required this.otherRequestName,
    required this.requestedDate,
    required this.requestNote,
    required this.transactionStatusId,
    required this.transactionStatusName,
    required this.transactionStatusCode,
    required this.remarks,
    required this.workFlowId,
    required this.workFlowName,
    required this.filePath,
    required this.fileName,
    required this.fileSource,
    required this.isEnabled,
    required this.employeeOtherRequestAttachments,
    required this.employeeOtherRequestWF,
    required this.employee,
  });
}
