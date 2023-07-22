import '../../createList/model/attendanceUser/attendance.dart';

class UserList {
  DataList? data;
  int? groupID;
  String? groupName;
  bool? groupStatus;
  String? groupSubject;
  bool? isTime;
  List<Links>? links;
  int? locationId;
  int? teacherId;
  List<TimeTable>? timeTable;

  UserList(
      {this.data,
        this.groupID,
        this.groupName,
        this.groupStatus,
        this.groupSubject,
        this.isTime,
        this.links,
        this.locationId,
        this.teacherId,
        this.timeTable});

  UserList.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? DataList.fromJson(json['data']) : null;
    groupID = json['groupID'];
    groupName = json['groupName'];
    groupStatus = json['groupStatus'];
    groupSubject = json['groupSubject'];
    isTime = json['isTime'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    locationId = json['locationId'];
    teacherId = json['teacher_id'];
    if (json['time_table'] != null) {
      timeTable = <TimeTable>[];
      json['time_table'].forEach((v) {
        timeTable!.add(new TimeTable.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['groupID'] = this.groupID;
    data['groupName'] = this.groupName;
    data['groupStatus'] = this.groupStatus;
    data['groupSubject'] = this.groupSubject;
    data['isTime'] = this.isTime;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['locationId'] = this.locationId;
    data['teacher_id'] = this.teacherId;
    if (this.timeTable != null) {
      data['time_table'] = this.timeTable!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataList {
  Information? information;
  List<Students>? students;

  DataList({this.information, this.students});

  DataList.fromJson(Map<String, dynamic> json) {
    information = json['information'] != null
        ?  Information.fromJson(json['information'])
        : null;
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add( Students.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (information != null) {
      data['information'] = this.information!.toJson();
    }
    if (students != null) {
      data['students'] = students!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Information {
  EduLang? eduLang;
  EduLang? groupCourseType;
  EduLang? groupName;
  GroupPrice? groupPrice;
  GroupPrice? studentsLength;
  EduLang? teacherName;
  GroupPrice? teacherSalary;
  EduLang? teacherSurname;

  Information(
      {this.eduLang,
        this.groupCourseType,
        this.groupName,
        this.groupPrice,
        this.studentsLength,
        this.teacherName,
        this.teacherSalary,
        this.teacherSurname});

  Information.fromJson(Map<String, dynamic> json) {
    eduLang =
    json['eduLang'] != null ? new EduLang.fromJson(json['eduLang']) : null;
    groupCourseType = json['groupCourseType'] != null
        ? new EduLang.fromJson(json['groupCourseType'])
        : null;
    groupName = json['groupName'] != null
        ? new EduLang.fromJson(json['groupName'])
        : null;
    groupPrice = json['groupPrice'] != null
        ? new GroupPrice.fromJson(json['groupPrice'])
        : null;
    studentsLength = json['studentsLength'] != null
        ? new GroupPrice.fromJson(json['studentsLength'])
        : null;
    teacherName = json['teacherName'] != null
        ? new EduLang.fromJson(json['teacherName'])
        : null;
    teacherSalary = json['teacherSalary'] != null
        ? new GroupPrice.fromJson(json['teacherSalary'])
        : null;
    teacherSurname = json['teacherSurname'] != null
        ? new EduLang.fromJson(json['teacherSurname'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.eduLang != null) {
      data['eduLang'] = this.eduLang!.toJson();
    }
    if (this.groupCourseType != null) {
      data['groupCourseType'] = this.groupCourseType!.toJson();
    }
    if (this.groupName != null) {
      data['groupName'] = this.groupName!.toJson();
    }
    if (this.groupPrice != null) {
      data['groupPrice'] = this.groupPrice!.toJson();
    }
    if (this.studentsLength != null) {
      data['studentsLength'] = this.studentsLength!.toJson();
    }
    if (this.teacherName != null) {
      data['teacherName'] = this.teacherName!.toJson();
    }
    if (this.teacherSalary != null) {
      data['teacherSalary'] = this.teacherSalary!.toJson();
    }
    if (this.teacherSurname != null) {
      data['teacherSurname'] = this.teacherSurname!.toJson();
    }
    return data;
  }
}

class EduLang {
  String? name;
  String? value;

  EduLang({this.name, this.value});

  EduLang.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}

class GroupPrice {
  String? name;
  int? value;

  GroupPrice({this.name, this.value});

  GroupPrice.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}

class Students {
  int? age;
  String? attended;
  String? comment;
  Date? date;
  int? id;
  String? img;
  int? money;
  String? moneyType;
  String? name;
  String? phone;
  String? photoProfile;
  String? reason;
  String? regDate;
  String? role;
  Scores? scores;
  String? surname;
  String? typeChecked;
  String? username;

  Students( Date dates, Date string, String check,
      {
        //this.age,
       // this.attended,
       // this.comment,
        this.date,
        //this.id,
        // this.img,
        // this.money,
        // this.moneyType,
        // this.name,
        // this.phone,
        // this.photoProfile,
        // this.reason,
        // this.regDate,
        // this.role,
        // this.scores,
        // this.surname,
        this.typeChecked,
        //this.username
      });

  Students.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    attended = json['attended'];
    comment = json['comment'];
    date = json['date'] != null ? new Date.fromJson(json['date']) : null;
    id = json['id'];
    img = json['img'];
    money = json['money'];
    moneyType = json['moneyType'];
    name = json['name'];
    phone = json['phone'];
    photoProfile = json['photo_profile'];
    reason = json['reason'];
    regDate = json['reg_date'];
    role = json['role'];
    scores =
    json['scores'] != null ? new Scores.fromJson(json['scores']) : null;
    surname = json['surname'];
    typeChecked = json['isTypeChecked'];
    username = json['username'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['attended'] = this.attended;
    data['comment'] = this.comment;
    if (this.date != null) {
      data['date'] = this.date!.toJson();
    }
    data['id'] = this.id;
    data['img'] = this.img;
    data['money'] = this.money;
    data['moneyType'] = this.moneyType;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['photo_profile'] = this.photoProfile;
    data['reason'] = this.reason;
    data['reg_date'] = this.regDate;
    data['role'] = this.role;
    if (this.scores != null) {
      data['scores'] = this.scores!.toJson();
    }
    data['surname'] = this.surname;
    data['isTypeChecked'] = this.typeChecked;
    data['username'] = this.username;
    return data;
  }
}

class Links {
  String? iconClazz;
  String? link;
  String? title;
  String? type;
  String? name;

  Links({this.iconClazz, this.link, this.title, this.type, this.name});

  Links.fromJson(Map<String, dynamic> json) {
    iconClazz = json['iconClazz'];
    link = json['link'];
    title = json['title'];
    type = json['type'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iconClazz'] = this.iconClazz;
    data['link'] = this.link;
    data['title'] = this.title;
    data['type'] = this.type;
    data['name'] = this.name;
    return data;
  }
}
class TimeTable {
  String? day;
  String? endTime;
  String? room;
  String? startTime;
  int? timeId;

  TimeTable({this.day, this.endTime, this.room, this.startTime, this.timeId});

  TimeTable.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    endTime = json['end_time'];
    room = json['room'];
    startTime = json['start_time'];
    timeId = json['time_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['end_time'] = this.endTime;
    data['room'] = this.room;
    data['start_time'] = this.startTime;
    data['time_id'] = this.timeId;
    return data;
  }

}
class Date {
  int? day;
  String? month;

  Date({this.day, this.month});

  Date.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    month = json['month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['month'] = this.month;
    return data;
  }
}
class Scores {
  Scores();

  Scores.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    return data;
  }
}
