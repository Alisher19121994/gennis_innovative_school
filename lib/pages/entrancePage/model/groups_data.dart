class GroupOfData {
  List<Groups>? groups;

  GroupOfData({this.groups});

  GroupOfData.fromJson(Map<String, dynamic> json) {
    if (json['groups'] != null) {
      groups = <Groups>[];
      json['groups'].forEach((v) {
        groups!.add( Groups.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.groups != null) {
      data['groups'] = this.groups!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Groups {
  int? id;
  String? name;
  int? payment;
  int? studentsLength;
  String? subject;
  int? teacherID;
  String? teacherImg;
  String? teacherName;
  String? teacherSurname;
  String? typeOfCourse;

  Groups(
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

  Groups.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data =  Map<String, dynamic>();
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
