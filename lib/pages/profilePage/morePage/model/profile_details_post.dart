class ProfileDetailsPost {
  String? birthDay;
  String? birthMonth;
  String? birthYear;
  String? fatherName;
  String? name;
  String? phone;
  String? role;
  List<String>? selectedSubjects;
  String? surname;
  String? type;
  String? username;

  ProfileDetailsPost(
      {this.birthDay,
        this.birthMonth,
        this.birthYear,
        this.fatherName,
        this.name,
        this.phone,
        this.role,
        this.selectedSubjects,
        this.surname,
        this.type,
        this.username});

  ProfileDetailsPost.fromJson(Map<String, dynamic> json) {
    birthDay = json['birthDay'];
    birthMonth = json['birthMonth'];
    birthYear = json['birthYear'];
    fatherName = json['fatherName'];
    name = json['name'];
    phone = json['phone'];
    role = json['role'];
    // if (json['selectedSubjects'] != null) {
    //   selectedSubjects = <String>[];
    //   json['selectedSubjects'].forEach((v) {
    //     selectedSubjects!.add(new String.fromJson(v));
    //   });
    // }
    surname = json['surname'];
    type = json['type'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['birthDay'] = birthDay;
    data['birthMonth'] = birthMonth;
    data['birthYear'] = birthYear;
    data['fatherName'] = fatherName;
    data['name'] = name;
    data['phone'] = phone;
    data['role'] = role;
    // if (this.selectedSubjects != null) {
    //   data['selectedSubjects'] =
    //       this.selectedSubjects!.map((v) => v.toJson()).toList();
    // }
    data['surname'] = surname;
    data['type'] = type;
    data['username'] = username;
    return data;
  }
}
