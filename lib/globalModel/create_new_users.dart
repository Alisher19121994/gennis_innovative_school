class CreateAttendances {
  String? groupId;
  StudentListOfUser? student;

  CreateAttendances({this.groupId, this.student});

  CreateAttendances.fromJson(Map<String, dynamic> json) {
    groupId = json['groupId'];
    student =
    json['student'] != null ? new StudentListOfUser.fromJson(json['student']) : null;
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

class StudentListOfUser {
  String? active;
  String? checked;
  DatesOfUsers? date;
  int? id;
  int? money;
  String? moneyType;
  String? name;
  String? profilePhoto;
  String? requestMsg;
  String? requestType;
  List<NewScores>? scores;
  String? surname;
  String? typeChecked;

  StudentListOfUser(
      {this.active,
        this.checked,
        this.date,
        this.id,
        this.money,
        this.moneyType,
        this.name,
        this.profilePhoto,
        this.requestMsg,
        this.requestType,
        this.scores,
        this.surname,
        this.typeChecked});

  StudentListOfUser.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    checked = json['checked'];
    date = json['date'] != null ? new DatesOfUsers.fromJson(json['date']) : null;
    id = json['id'];
    money = json['money'];
    moneyType = json['money_type'];
    name = json['name'];
    profilePhoto = json['profile_photo'];
    requestMsg = json['requestMsg'];
    requestType = json['requestType'];
    if (json['scores'] != null) {
      scores = <NewScores>[];
      json['scores'].forEach((v) {
        scores!.add(new NewScores.fromJson(v));
      });
    }
    surname = json['surname'];
    typeChecked = json['typeChecked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['checked'] = this.checked;
    if (this.date != null) {
      data['date'] = this.date!.toJson();
    }
    data['id'] = this.id;
    data['money'] = this.money;
    data['money_type'] = this.moneyType;
    data['name'] = this.name;
    data['profile_photo'] = this.profilePhoto;
    data['requestMsg'] = this.requestMsg;
    data['requestType'] = this.requestType;
    if (this.scores != null) {
      data['scores'] = this.scores!.map((v) => v.toJson()).toList();
    }
    data['surname'] = this.surname;
    data['typeChecked'] = this.typeChecked;
    return data;
  }
}

class DatesOfUsers {
  String? day;
  String? month;

  DatesOfUsers({this.day, this.month});

  DatesOfUsers.fromJson(Map<String, dynamic> json) {
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

class NewScores {
  int? activeStars;
  int? id;
  String? name;
  List<Stars>? stars;
  String? title;

  NewScores({this.activeStars, this.id, this.name, this.stars, this.title});

  NewScores.fromJson(Map<String, dynamic> json) {
    activeStars = json['activeStars'];
    id = json['id'];
    name = json['name'];
    if (json['stars'] != null) {
      stars = <Stars>[];
      json['stars'].forEach((v) {
        stars!.add(new Stars.fromJson(v));
      });
    }
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activeStars'] = this.activeStars;
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.stars != null) {
      data['stars'] = this.stars!.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    return data;
  }
}

class Stars {
  String? active;

  Stars({this.active});

  Stars.fromJson(Map<String, dynamic> json) {
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    return data;
  }
}
