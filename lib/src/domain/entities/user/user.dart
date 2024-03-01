class User {
  final int userId;
  final String username;
  final int employeeId;
  final String employeeName;
  final String positionName;
  final String email;
  final int companyId;
  final String companyName;
  final String companyLogo;
  final String joiningDate;
  final String mobileImageFilePath;
  final int userTypeId;
  final int subscriberId;
  final int noOfDigits;
  final String contactNo;
  final String fingerPrintNo;
  final int totalAllowance;
  final int baseSalary;

  User(
      {required this.userId,
      required this.username,
      required this.employeeId,
      required this.employeeName,
      required this.positionName,
      required this.email,
      required this.companyId,
      required this.companyName,
      required this.companyLogo,
      required this.joiningDate,
      required this.mobileImageFilePath,
      required this.userTypeId,
      required this.noOfDigits,
      required this.contactNo,
      required this.fingerPrintNo,
      required this.totalAllowance,
      required this.baseSalary,
      required this.subscriberId,
      });
}
