class UserData {
  int? groupId;
  StudentsD? student;

  UserData({this.groupId, this.student});

  UserData.fromJson(Map<String, dynamic> json) {
    groupId = json['groupId'];
    student = json['student'] != null ? new StudentsD.fromJson(json['student']) : null;
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

class StudentsD {
  int? age;
  String? attended;
  String? comment;
  Dates? date;
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
  ScoresData? scores;
  String? surname;
  String? typeChecked;
  String? username;

  StudentsD({this.age, this.attended, this.comment, this.date, this.id, this.img, this.money, this.moneyType, this.name, this.phone, this.photoProfile, this.reason, this.regDate, this.role, this.scores, this.surname, this.typeChecked, this.username});

  StudentsD.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    attended = json['attended'];
    comment = json['comment'];
    date = json['date'] != null ? new Dates.fromJson(json['date']) : null;
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
    scores = json['scores'] != null ? new ScoresData.fromJson(json['scores']) : null;
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

class Dates {
  int? day;
  String? month;

  Dates({this.day, this.month});

  Dates.fromJson(Map<String, dynamic> json) {
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

class ScoresData {


  ScoresData();

ScoresData.fromJson(Map<String, dynamic> json) {
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
return data;
}
}
