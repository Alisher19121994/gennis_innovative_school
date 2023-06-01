class UserProfile {
  User? user;

  UserProfile({this.user});

  UserProfile.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  ActiveToChange? activeToChange;
  List<GroupsN>? groups;
  int? id;
  Info? info;
  List<Links>? links;
  int? locationId;
  List<int>? locationList;
  String? photoProfile;
  String? role;
  String? typeRole;
  String? username;

  User(
      {this.activeToChange,
        this.groups,
        this.id,
        this.info,
        this.links,
        this.locationId,
        this.locationList,
        this.photoProfile,
        this.role,
        this.typeRole,
        this.username});

  User.fromJson(Map<String, dynamic> json) {
    activeToChange = json['activeToChange'] != null
        ? new ActiveToChange.fromJson(json['activeToChange'])
        : null;
    if (json['groups'] != null) {
      groups = <GroupsN>[];
      json['groups'].forEach((v) {
        groups!.add(new GroupsN.fromJson(v));
      });
    }
    id = json['id'];
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    locationId = json['location_id'];
    locationList = json['location_list'].cast<int>();
    photoProfile = json['photo_profile'];
    role = json['role'];
    typeRole = json['type_role'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.activeToChange != null) {
      data['activeToChange'] = this.activeToChange!.toJson();
    }
    if (this.groups != null) {
      data['groups'] = this.groups!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['location_id'] = this.locationId;
    data['location_list'] = this.locationList;
    data['photo_profile'] = this.photoProfile;
    data['role'] = this.role;
    data['type_role'] = this.typeRole;
    data['username'] = this.username;
    return data;
  }
}

class ActiveToChange {
  bool? age;
  bool? birth;
  bool? color;
  bool? comment;
  bool? fathersName;
  bool? language;
  bool? name;
  bool? phone;
  bool? surname;
  bool? username;

  ActiveToChange(
      {this.age,
        this.birth,
        this.color,
        this.comment,
        this.fathersName,
        this.language,
        this.name,
        this.phone,
        this.surname,
        this.username});

  ActiveToChange.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    birth = json['birth'];
    color = json['color'];
    comment = json['comment'];
    fathersName = json['fathersName'];
    language = json['language'];
    name = json['name'];
    phone = json['phone'];
    surname = json['surname'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['birth'] = this.birth;
    data['color'] = this.color;
    data['comment'] = this.comment;
    data['fathersName'] = this.fathersName;
    data['language'] = this.language;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['surname'] = this.surname;
    data['username'] = this.username;
    return data;
  }
}

class GroupsN {
  int? id;
  String? nameGroup;
  String? teacherImg;

  GroupsN({this.id, this.nameGroup, this.teacherImg});

  GroupsN.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameGroup = json['nameGroup'];
    teacherImg = json['teacherImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameGroup'] = this.nameGroup;
    data['teacherImg'] = this.teacherImg;
    return data;
  }
}

class Info {
  Age? age;
  BirthDate? birthDate;
  BirthDay? birthDay;
  BirthDay? birthMonth;
  BirthDay? birthYear;
  BirthDate? fathersName;
  BirthDate? name;
  BirthDate? phone;
  BirthDate? surname;
  BirthDate? username;

  Info(
      {this.age,
        this.birthDate,
        this.birthDay,
        this.birthMonth,
        this.birthYear,
        this.fathersName,
        this.name,
        this.phone,
        this.surname,
        this.username});

  Info.fromJson(Map<String, dynamic> json) {
    age = json['age'] != null ? new Age.fromJson(json['age']) : null;
    birthDate = json['birthDate'] != null
        ? new BirthDate.fromJson(json['birthDate'])
        : null;
    birthDay = json['birthDay'] != null
        ? new BirthDay.fromJson(json['birthDay'])
        : null;
    birthMonth = json['birthMonth'] != null
        ? new BirthDay.fromJson(json['birthMonth'])
        : null;
    birthYear = json['birthYear'] != null
        ? new BirthDay.fromJson(json['birthYear'])
        : null;
    fathersName = json['fathersName'] != null
        ? new BirthDate.fromJson(json['fathersName'])
        : null;
    name = json['name'] != null ? new BirthDate.fromJson(json['name']) : null;
    phone =
    json['phone'] != null ? new BirthDate.fromJson(json['phone']) : null;
    surname = json['surname'] != null
        ? new BirthDate.fromJson(json['surname'])
        : null;
    username = json['username'] != null
        ? new BirthDate.fromJson(json['username'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.age != null) {
      data['age'] = this.age!.toJson();
    }
    if (this.birthDate != null) {
      data['birthDate'] = this.birthDate!.toJson();
    }
    if (this.birthDay != null) {
      data['birthDay'] = this.birthDay!.toJson();
    }
    if (this.birthMonth != null) {
      data['birthMonth'] = this.birthMonth!.toJson();
    }
    if (this.birthYear != null) {
      data['birthYear'] = this.birthYear!.toJson();
    }
    if (this.fathersName != null) {
      data['fathersName'] = this.fathersName!.toJson();
    }
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    if (this.phone != null) {
      data['phone'] = this.phone!.toJson();
    }
    if (this.surname != null) {
      data['surname'] = this.surname!.toJson();
    }
    if (this.username != null) {
      data['username'] = this.username!.toJson();
    }
    return data;
  }
}

class Age {
  String? name;
  int? order;
  int? value;

  Age({this.name, this.order, this.value});

  Age.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    order = json['order'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['order'] = this.order;
    data['value'] = this.value;
    return data;
  }
}

class BirthDate {
  String? name;
  int? order;
  String? value;

  BirthDate({this.name, this.order, this.value});

  BirthDate.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    order = json['order'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['order'] = this.order;
    data['value'] = this.value;
    return data;
  }
}

class BirthDay {
  String? display;
  String? name;
  int? value;

  BirthDay({this.display, this.name, this.value});

  BirthDay.fromJson(Map<String, dynamic> json) {
    display = json['display'];
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['display'] = this.display;
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}

class Links {
  String? iconClazz;
  String? link;
  String? title;
  String? type;

  Links({this.iconClazz, this.link, this.title, this.type});

  Links.fromJson(Map<String, dynamic> json) {
    iconClazz = json['iconClazz'];
    link = json['link'];
    title = json['title'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iconClazz'] = this.iconClazz;
    data['link'] = this.link;
    data['title'] = this.title;
    data['type'] = this.type;
    return data;
  }
}
