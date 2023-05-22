class UserList {
  Data? data;
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
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  Information? information;
  List<Students>? students;

  Data({this.information, this.students});

  Data.fromJson(Map<String, dynamic> json) {
    information = json['information'] != null
        ? new Information.fromJson(json['information'])
        : null;
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add(new Students.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.information != null) {
      data['information'] = this.information!.toJson();
    }
    if (this.students != null) {
      data['students'] = this.students!.map((v) => v.toJson()).toList();
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
  bool? isTypeChecked;
  String? surname;
  String? username;

  Students(
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
        this.isTypeChecked,
        this.surname,
        this.username});

  Students.fromJson(Map<String, dynamic> json) {
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
    isTypeChecked = json['isTypeChecked'];
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
    data['isTypeChecked'] = this.isTypeChecked;
    data['surname'] = this.surname;
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
