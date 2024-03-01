class GetTimeLine {
  int id;
  int wFLevelId;
  int companyId;
  int levelNo;
  String levelName;
  int actionUserId;
  String actionUserName;
  int workflowStatusId;
  String workflowStatusName;
  String remarks;
  String createdAt;
  String attachments;
  String date;
  String time;
  bool lastAction;
  int levelType;
  int levelTypeId;
  List<String> usersName;

  GetTimeLine({
    required this.id,
    required this.wFLevelId,
    required this.companyId,
    required this.levelNo,
    required this.levelName,
    required this.actionUserId,
    required this.actionUserName,
    required this.workflowStatusId,
    required this.workflowStatusName,
    required this.remarks,
    required this.createdAt,
    required this.attachments,
    required this.date,
    required this.time,
    required this.lastAction,
    required this.levelType,
    required this.levelTypeId,
    required this.usersName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'wFLevelId': wFLevelId,
      'companyId': companyId,
      'levelNo': levelNo,
      'levelName': levelName,
      'actionUserId': actionUserId,
      'actionUserName': actionUserName,
      'workflowStatusId': workflowStatusId,
      'workflowStatusName': workflowStatusName,
      'remarks': remarks,
      'createdAt': createdAt,
      'attachments': attachments,
      'date': date,
      'time': time,
      'lastAction': lastAction,
      'levelType': levelType,
      'levelTypeId': levelTypeId,
      'usersName': usersName,
    };
  }

  factory GetTimeLine.fromMap(Map<String, dynamic> map) {
    return GetTimeLine(
      id: map['id'],
      wFLevelId: map['wfLevelId'],
      companyId: map['companyId'],
      levelNo: map['levelNo'],
      levelName: map['levelName'],
      actionUserId: map['actionUserId'],
      actionUserName: map['actionUserName'],
      workflowStatusId: map['workflowStatusId'],
      workflowStatusName: map['workflowStatusName'],
      remarks: map['remarks'],
      createdAt: map['createdAt'],
      attachments: map['attachments'],
      date: map['date'],
      time: map['time'],
      lastAction: map['lastAction'],
      levelType: map['levelType'],
      levelTypeId: map['levelTypeId'],
      usersName: map['usersName'],
    );
  }
}
