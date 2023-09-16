class NewAttendances {
  List<NewDate>? date;
  List<ScoresData>? scoresData;
  List<NewStudents>? students;

  NewAttendances({this.date, this.scoresData, this.students});

  NewAttendances.fromJson(Map<String, dynamic> json) {
    if (json['date'] != null) {
      date = <NewDate>[];
      json['date'].forEach((v) {
        date!.add(new NewDate.fromJson(v));
      });
    }
    if (json['scoresData'] != null) {
      scoresData = <ScoresData>[];
      json['scoresData'].forEach((v) {
        scoresData!.add(new ScoresData.fromJson(v));
      });
    }
    if (json['students'] != null) {
      students = <NewStudents>[];
      json['students'].forEach((v) {
        students!.add(new NewStudents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.date != null) {
      data['date'] = this.date!.map((v) => v.toJson()).toList();
    }
    if (this.scoresData != null) {
      data['scoresData'] = this.scoresData!.map((v) => v.toJson()).toList();
    }
    if (this.students != null) {
      data['students'] = this.students!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NewDate {
  List<int>? days;
  String? name;
  String? value;

  NewDate({this.days, this.name, this.value});

  NewDate.fromJson(Map<String, dynamic> json) {
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

class ScoresData {
  int? activeStars;
  int? id;
  String? name;
  List<Stars>? stars;
  String? title;

  ScoresData({this.activeStars, this.id, this.name, this.stars, this.title});

  ScoresData.fromJson(Map<String, dynamic> json) {
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
  bool? active;

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

class NewStudents {
  bool? active;
  bool? checked;
  NewDate? date;
  int? id;
  int? money;
  String? moneyType;
  String? name;
  Null? profilePhoto;
  NewDate? scores;
  String? surname;
  String? typeChecked;

  NewStudents(
      {this.active,
      this.checked,
      this.date,
      this.id,
      this.money,
      this.moneyType,
      this.name,
      this.profilePhoto,
      this.scores,
      this.surname,
      this.typeChecked});

  NewStudents.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    checked = json['checked'];
    date = json['date'] != null ? new NewDate.fromJson(json['date']) : null;
    id = json['id'];
    money = json['money'];
    moneyType = json['money_type'];
    name = json['name'];
    profilePhoto = json['profile_photo'];
    scores =
        json['scores'] != null ? new NewDate.fromJson(json['scores']) : null;
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
    if (this.scores != null) {
      data['scores'] = this.scores!.toJson();
    }
    data['surname'] = this.surname;
    data['typeChecked'] = this.typeChecked;
    return data;
  }
}
