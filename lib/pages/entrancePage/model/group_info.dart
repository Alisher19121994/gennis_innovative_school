class GroupInfo {
  List<GroupsInfo>? groups;

  GroupInfo({this.groups});

  GroupInfo.fromJson(Map<String, dynamic> json) {
    if (json['groups'] != null) {
      groups = <GroupsInfo>[];
      json['groups'].forEach((v) {
        groups?.add( GroupsInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['groups'] = groups?.map((v) => v.toJson()).toList();
    return data;
  }
}

class GroupsInfo {
  int? id;
  String? name;
  int? payment;
  int? studentsLength;
  String? subject;
  int? teacherID;
  Null? teacherImg;
  String? teacherName;
  String? teacherSurname;
  String? typeOfCourse;

  GroupsInfo(
      {this.id,
        this.name,
        this.payment,
        this.studentsLength,
        this.subject,
        this.teacherID,
        this.teacherImg,
        this.teacherName,
        this.teacherSurname,
        this.typeOfCourse});

  GroupsInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    payment = json['payment'];
    studentsLength = json['studentsLength'];
    subject = json['subject'];
    teacherID = json['teacherID'];
    teacherImg = json['teacherImg'];
    teacherName = json['teacherName'];
    teacherSurname = json['teacherSurname'];
    typeOfCourse = json['typeOfCourse'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['payment'] = this.payment;
    data['studentsLength'] = this.studentsLength;
    data['subject'] = this.subject;
    data['teacherID'] = this.teacherID;
    data['teacherImg'] = this.teacherImg;
    data['teacherName'] = this.teacherName;
    data['teacherSurname'] = this.teacherSurname;
    data['typeOfCourse'] = this.typeOfCourse;
    return data;
  }
}
