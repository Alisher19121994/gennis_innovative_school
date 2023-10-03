class UsersInAttendanceInListVertical {
  List<NewAttendanceInfo>? attendanceInfo;

  UsersInAttendanceInListVertical({this.attendanceInfo});

  UsersInAttendanceInListVertical.fromJson(Map<String, dynamic> json) {
    if (json['attendance_info'] != null) {
      attendanceInfo = <NewAttendanceInfo>[];
      json['attendance_info'].forEach((v) {
        attendanceInfo!.add(new NewAttendanceInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attendanceInfo != null) {
      data['attendance_info'] =
          this.attendanceInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NewAttendanceInfo {
  String? activeness;
  String? day;
  String? dictionary;
  String? homework;
  int? id;
  bool? status;
  Student? student;

  NewAttendanceInfo(
      {this.activeness,
        this.day,
        this.dictionary,
        this.homework,
        this.id,
        this.status,
        this.student});

  NewAttendanceInfo.fromJson(Map<String, dynamic> json) {
    activeness = json['activeness'];
    day = json['day'];
    dictionary = json['dictionary'];
    homework = json['homework'];
    id = json['id'];
    status = json['status'];
    student =
    json['student'] != null ? new Student.fromJson(json['student']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activeness'] = this.activeness;
    data['day'] = this.day;
    data['dictionary'] = this.dictionary;
    data['homework'] = this.homework;
    data['id'] = this.id;
    data['status'] = this.status;
    if (this.student != null) {
      data['student'] = this.student!.toJson();
    }
    return data;
  }
}

class Student {
  int? id;
  String? name;
  String? surname;

  Student({this.id, this.name, this.surname});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['surname'] = this.surname;
    return data;
  }
}
