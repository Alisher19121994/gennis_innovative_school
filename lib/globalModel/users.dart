class Users {
  Users({
    required this.data,
    required this.groupID,
    required this.groupName,
    required this.groupStatus,
    required this.groupSubject,
    required this.isTime,
    required this.level,
    required this.levels,
    required this.links,
    required this.locationId,
    required this.teacherId,
    required this.timeTable,
  });
  late final Data data;
  late final int groupID;
  late final String groupName;
  late final bool groupStatus;
  late final String groupSubject;
  late final bool isTime;
  late final Level level;
  late final List<dynamic> levels;
  late final List<Links> links;
  late final int locationId;
  late final int teacherId;
  late final List<TimeTable> timeTable;

  Users.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
    groupID = json['groupID'];
    groupName = json['groupName'];
    groupStatus = json['groupStatus'];
    groupSubject = json['groupSubject'];
    isTime = json['isTime'];
    level = Level.fromJson(json['level']);
    levels = List.castFrom<dynamic, dynamic>(json['levels']);
    links = List.from(json['links']).map((e)=>Links.fromJson(e)).toList();
    locationId = json['locationId'];
    teacherId = json['teacher_id'];
    timeTable = List.from(json['time_table']).map((e)=>TimeTable.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    _data['groupID'] = groupID;
    _data['groupName'] = groupName;
    _data['groupStatus'] = groupStatus;
    _data['groupSubject'] = groupSubject;
    _data['isTime'] = isTime;
    _data['level'] = level.toJson();
    _data['levels'] = levels;
    _data['links'] = links.map((e)=>e.toJson()).toList();
    _data['locationId'] = locationId;
    _data['teacher_id'] = teacherId;
    _data['time_table'] = timeTable.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.information,
    required this.students,
  });
  late final Information information;
  late final List<Students> students;

  Data.fromJson(Map<String, dynamic> json){
    information = Information.fromJson(json['information']);
    students = List.from(json['students']).map((e)=>Students.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['information'] = information.toJson();
    _data['students'] = students.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Information {
  Information({
    required this.eduLang,
    required this.groupCourseType,
    required this.groupLevel,
    required this.groupName,
    required this.groupPrice,
    required this.studentsLength,
    required this.teacherName,
    required this.teacherSalary,
    required this.teacherSurname,
  });
  late final EduLang eduLang;
  late final GroupCourseType groupCourseType;
  late final GroupLevel groupLevel;
  late final GroupName groupName;
  late final GroupPrice groupPrice;
  late final StudentsLength studentsLength;
  late final TeacherName teacherName;
  late final TeacherSalary teacherSalary;
  late final TeacherSurname teacherSurname;

  Information.fromJson(Map<String, dynamic> json){
    eduLang = EduLang.fromJson(json['eduLang']);
    groupCourseType = GroupCourseType.fromJson(json['groupCourseType']);
    groupLevel = GroupLevel.fromJson(json['groupLevel']);
    groupName = GroupName.fromJson(json['groupName']);
    groupPrice = GroupPrice.fromJson(json['groupPrice']);
    studentsLength = StudentsLength.fromJson(json['studentsLength']);
    teacherName = TeacherName.fromJson(json['teacherName']);
    teacherSalary = TeacherSalary.fromJson(json['teacherSalary']);
    teacherSurname = TeacherSurname.fromJson(json['teacherSurname']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['eduLang'] = eduLang.toJson();
    _data['groupCourseType'] = groupCourseType.toJson();
    _data['groupLevel'] = groupLevel.toJson();
    _data['groupName'] = groupName.toJson();
    _data['groupPrice'] = groupPrice.toJson();
    _data['studentsLength'] = studentsLength.toJson();
    _data['teacherName'] = teacherName.toJson();
    _data['teacherSalary'] = teacherSalary.toJson();
    _data['teacherSurname'] = teacherSurname.toJson();
    return _data;
  }
}

class EduLang {
  EduLang({
    required this.name,
    required this.value,
  });
  late final String name;
  late final String value;

  EduLang.fromJson(Map<String, dynamic> json){
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['value'] = value;
    return _data;
  }
}

class GroupCourseType {
  GroupCourseType({
    required this.name,
    required this.value,
  });
  late final String name;
  late final String value;

  GroupCourseType.fromJson(Map<String, dynamic> json){
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['value'] = value;
    return _data;
  }
}

class GroupLevel {
  GroupLevel({
    required this.name,
    required this.value,
  });
  late final String name;
  late final String value;

  GroupLevel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['value'] = value;
    return _data;
  }
}

class GroupName {
  GroupName({
    required this.name,
    required this.value,
  });
  late final String name;
  late final String value;

  GroupName.fromJson(Map<String, dynamic> json){
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['value'] = value;
    return _data;
  }
}

class GroupPrice {
  GroupPrice({
    required this.name,
    required this.value,
  });
  late final String name;
  late final int value;

  GroupPrice.fromJson(Map<String, dynamic> json){
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['value'] = value;
    return _data;
  }
}

class StudentsLength {
  StudentsLength({
    required this.name,
    required this.value,
  });
  late final String name;
  late final int value;

  StudentsLength.fromJson(Map<String, dynamic> json){
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['value'] = value;
    return _data;
  }
}

class TeacherName {
  TeacherName({
    required this.name,
    required this.value,
  });
  late final String name;
  late final String value;

  TeacherName.fromJson(Map<String, dynamic> json){
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['value'] = value;
    return _data;
  }
}

class TeacherSalary {
  TeacherSalary({
    required this.name,
    required this.value,
  });
  late final String name;
  late final int value;

  TeacherSalary.fromJson(Map<String, dynamic> json){
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['value'] = value;
    return _data;
  }
}

class TeacherSurname {
  TeacherSurname({
    required this.name,
    required this.value,
  });
  late final String name;
  late final String value;

  TeacherSurname.fromJson(Map<String, dynamic> json){
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['value'] = value;
    return _data;
  }
}

class Students {
  Students({
    required this.age,
    required this.comment,
    required this.id,
    this.img,
    required this.money,
    required this.moneyType,
    required this.name,
    required this.phone,
    this.photoProfile,
    required this.regDate,
    required this.role,
    required this.surname,
    required this.username,
  });
  late final int age;
  late final String comment;
  late final int id;
  late final Null img;
  late final int money;
  late final String moneyType;
  late final String name;
  late final String phone;
  late final Null photoProfile;
  late final String regDate;
  late final String role;
  late final String surname;
  late final String username;

  Students.fromJson(Map<String, dynamic> json){
    age = json['age'];
    comment = json['comment'];
    id = json['id'];
    img = null;
    money = json['money'];
    moneyType = json['moneyType'];
    name = json['name'];
    phone = json['phone'];
    photoProfile = null;
    regDate = json['reg_date'];
    role = json['role'];
    surname = json['surname'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['age'] = age;
    _data['comment'] = comment;
    _data['id'] = id;
    _data['img'] = img;
    _data['money'] = money;
    _data['moneyType'] = moneyType;
    _data['name'] = name;
    _data['phone'] = phone;
    _data['photo_profile'] = photoProfile;
    _data['reg_date'] = regDate;
    _data['role'] = role;
    _data['surname'] = surname;
    _data['username'] = username;
    return _data;
  }
}

class Level {
  Level();

  Level.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}

class Links {
  Links({
    required this.iconClazz,
    required this.link,
    required this.title,
    required this.type,
  });
  late final String iconClazz;
  late final String link;
  late final String title;
  late final String type;

  Links.fromJson(Map<String, dynamic> json){
    iconClazz = json['iconClazz'];
    link = json['link'];
    title = json['title'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['iconClazz'] = iconClazz;
    _data['link'] = link;
    _data['title'] = title;
    _data['type'] = type;
    return _data;
  }
}

class TimeTable {
  TimeTable({
    required this.day,
    required this.endTime,
    required this.room,
    required this.startTime,
    required this.timeId,
  });
  late final String day;
  late final String endTime;
  late final String room;
  late final String startTime;
  late final int timeId;

  TimeTable.fromJson(Map<String, dynamic> json){
    day = json['day'];
    endTime = json['end_time'];
    room = json['room'];
    startTime = json['start_time'];
    timeId = json['time_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['day'] = day;
    _data['end_time'] = endTime;
    _data['room'] = room;
    _data['start_time'] = startTime;
    _data['time_id'] = timeId;
    return _data;
  }
}