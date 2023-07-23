class StudentsListInfo {
  Data? data;

  StudentsListInfo({this.data});

  StudentsListInfo.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  AttendanceFilter? attendanceFilter;
  List<Date>? date;
  List<StudentsList>? students;

  Data({this.attendanceFilter, this.date, this.students});

  Data.fromJson(Map<String, dynamic> json) {
    attendanceFilter = json['attendance_filter'] != null
        ? new AttendanceFilter.fromJson(json['attendance_filter'])
        : null;
    if (json['date'] != null) {
      date = <Date>[];
      json['date'].forEach((v) {
        date!.add(new Date.fromJson(v));
      });
    }
    if (json['students'] != null) {
      students = <StudentsList>[];
      json['students'].forEach((v) {
        students!.add(new StudentsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attendanceFilter != null) {
      data['attendance_filter'] = this.attendanceFilter!.toJson();
    }
    if (this.date != null) {
      data['date'] = this.date!.map((v) => v.toJson()).toList();
    }
    if (this.students != null) {
      data['students'] = this.students!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AttendanceFilter {
  List<Attendances>? attendances;
  List<String>? dates;

  AttendanceFilter({this.attendances, this.dates});

  AttendanceFilter.fromJson(Map<String, dynamic> json) {
    if (json['attendances'] != null) {
      attendances = <Attendances>[];
      json['attendances'].forEach((v) {
        attendances!.add(new Attendances.fromJson(v));
      });
    }
    dates = json['dates'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attendances != null) {
      data['attendances'] = this.attendances!.map((v) => v.toJson()).toList();
    }
    data['dates'] = this.dates;
    return data;
  }
}

class Attendances {
  List<Null>? absent;
  List<Dates>? dates;
  int? lenDays;
  List<Null>? present;
  int? studentId;
  String? studentName;
  String? studentSurname;

  Attendances(
      {
        //this.absent,
        this.dates,
        this.lenDays,
      //  this.present,
        this.studentId,
        this.studentName,
        this.studentSurname});

  Attendances.fromJson(Map<String, dynamic> json) {
    if (json['absent'] != null) {
      // absent = <Null>[];
      // json['absent'].forEach((v) {
      //   absent!.add(new Null.fromJson(v));
      // });
    }
    if (json['dates'] != null) {
      dates = <Dates>[];
      json['dates'].forEach((v) {
        dates!.add(new Dates.fromJson(v));
      });
    }
    lenDays = json['len_days'];
    if (json['present'] != null) {
      // present = <Null>[];
      // json['present'].forEach((v) {
      //   present!.add(new Null.fromJson(v));
      // });
    }
    studentId = json['student_id'];
    studentName = json['student_name'];
    studentSurname = json['student_surname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // if (this.absent != null) {
    //   data['absent'] = this.absent!.map((v) => v.toJson()).toList();
    // }
    if (this.dates != null) {
      data['dates'] = this.dates!.map((v) => v.toJson()).toList();
    }
    data['len_days'] = this.lenDays;
    // if (this.present != null) {
    //   data['present'] = this.present!.map((v) => v.toJson()).toList();
    // }
    data['student_id'] = this.studentId;
    data['student_name'] = this.studentName;
    data['student_surname'] = this.studentSurname;
    return data;
  }
}

class Dates {
  Ball? ball;
  String? day;
  int? dayId;
  String? reason;
  bool? status;

  Dates({this.ball, this.day, this.dayId, this.reason, this.status});

  Dates.fromJson(Map<String, dynamic> json) {
    ball = json['ball'] != null ? new Ball.fromJson(json['ball']) : null;
    day = json['day'];
    dayId = json['day_id'];
    reason = json['reason'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ball != null) {
      data['ball'] = this.ball!.toJson();
    }
    data['day'] = this.day;
    data['day_id'] = this.dayId;
    data['reason'] = this.reason;
    data['status'] = this.status;
    return data;
  }
}

class Ball {
  int? activeness;
  int? averageBall;
  int? homework;

  Ball({this.activeness, this.averageBall, this.homework});

  Ball.fromJson(Map<String, dynamic> json) {
    activeness = json['activeness'];
    averageBall = json['average_ball'];
    homework = json['homework'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activeness'] = this.activeness;
    data['average_ball'] = this.averageBall;
    data['homework'] = this.homework;
    return data;
  }
}

class Date {
  List<int>? days;
  String? name;
  String? value;

  Date({this.days, this.name, this.value});

  Date.fromJson(Map<String, dynamic> json) {
    days = json['days'].cast<int>();
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['days'] = this.days;
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}

class StudentsList {
  int? age;
  String? comment;
  int? id;
  Null? img;
  int? money;
  String? moneyType;
  String? name;
  String? phone;
  Null? photoProfile;
  String? regDate;
  String? role;
  String? surname;
  String? username;

  StudentsList(
      {this.age,
        this.comment,
        this.id,
        this.img,
        this.money,
        this.moneyType,
        this.name,
        this.phone,
        this.photoProfile,
        this.regDate,
        this.role,
        this.surname,
        this.username});

  StudentsList.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    comment = json['comment'];
    id = json['id'];
    img = json['img'];
    money = json['money'];
    moneyType = json['moneyType'];
    name = json['name'];
    phone = json['phone'];
    photoProfile = json['photo_profile'];
    regDate = json['reg_date'];
    role = json['role'];
    surname = json['surname'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['comment'] = this.comment;
    data['id'] = this.id;
    data['img'] = this.img;
    data['money'] = this.money;
    data['moneyType'] = this.moneyType;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['photo_profile'] = this.photoProfile;
    data['reg_date'] = this.regDate;
    data['role'] = this.role;
    data['surname'] = this.surname;
    data['username'] = this.username;
    return data;
  }
}
