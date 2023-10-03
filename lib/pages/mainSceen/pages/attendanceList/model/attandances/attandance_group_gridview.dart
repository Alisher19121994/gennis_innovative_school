class UsersInAttendanceInGridview {
  List<AttendanceInfo>? attendanceInfo;

  UsersInAttendanceInGridview({this.attendanceInfo});

  UsersInAttendanceInGridview.fromJson(Map<String, dynamic> json) {
    if (json['attendance_info'] != null) {
      attendanceInfo = <AttendanceInfo>[];
      json['attendance_info'].forEach((v) {
        attendanceInfo!.add(new AttendanceInfo.fromJson(v));
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

class AttendanceInfo {
  int? absent;
  String? day;
  int? present;

  AttendanceInfo({this.absent, this.day, this.present});

  AttendanceInfo.fromJson(Map<String, dynamic> json) {
    absent = json['absent'];
    day = json['day'];
    present = json['present'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['absent'] = this.absent;
    data['day'] = this.day;
    data['present'] = this.present;
    return data;
  }
}
