class TeachersGroup {
  List<Groups>? groups;

  TeachersGroup({
    required this.groups,
  });

  // TeachersGroup.fromJson(Map<String, dynamic> json){
  //   groups = List.from(json['groups']).map((e)=>Groups.fromJson(e)).toList();
  // }
  TeachersGroup.fromJson(Map<String, dynamic> json) {
    if (json['groups'] != null) {
      groups = <Groups>[];
      json['groups'].forEach((v) {
        groups?.add( Groups.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['groups'] = groups?.map((e)=>e.toJson()).toList();
    return data;
  }
}

class Groups {
  Groups({
    required this.id,
    required this.name,
    required this.payment,
    required this.studentsLength,
    required this.subject,
    required this.teacherID,
    required this.teacherImg,
    required this.teacherName,
    required this.teacherSurname,
    required this.typeOfCourse,
  });
  late final int id;
  late final String name;
  late final int payment;
  late final int studentsLength;
  late final String subject;
  late final int teacherID;
  late final String teacherImg;
  late final String teacherName;
  late final String teacherSurname;
  late final String typeOfCourse;

  Groups.fromJson(Map<String, dynamic> json){
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
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['payment'] = payment;
    data['studentsLength'] = studentsLength;
    data['subject'] = subject;
    data['teacherID'] = teacherID;
    data['teacherImg'] = teacherImg;
    data['teacherName'] = teacherName;
    data['teacherSurname'] = teacherSurname;
    data['typeOfCourse'] = typeOfCourse;
    return data;
  }
}