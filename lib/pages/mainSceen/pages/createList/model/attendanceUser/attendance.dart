class Attendance {
  int? groupId;
  Student? student;

  Attendance({this.groupId, this.student});

  Attendance.fromJson(Map<String, dynamic> json) {
    groupId = json['groupId'];
    student = json['student'] != null ? Student.fromJson(json['student']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupId'] = this.groupId;
    if (this.student != null) {
      data['student'] = this.student!.toJson();
    }
    return data;
  }
}

class Student {
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

  Student(
      {this.age,
      this.attended,
      this.comment,
      this.date,
      this.id,
      this.img,
      this.money,
      this.moneyType,
      this.name,
      this.phone,
      this.photoProfile,
      this.reason,
      this.regDate,
      this.role,
      this.scores,
      this.surname,
      this.typeChecked,
      this.username});

  Student.fromJson(Map<String, dynamic> json) {
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
    typeChecked = json['typeChecked'];
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
    data['typeChecked'] = this.typeChecked;
    data['username'] = this.username;
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
