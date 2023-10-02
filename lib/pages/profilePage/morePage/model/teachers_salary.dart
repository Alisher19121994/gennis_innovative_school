class TeachersSalary {
  List<DataOfTeachersSalary>? data;

  TeachersSalary({this.data});

  TeachersSalary.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataOfTeachersSalary>[];
      json['data'].forEach((v) {
        data!.add(new DataOfTeachersSalary.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataOfTeachersSalary {
  String? date;
  int? id;
  int? residue;
  int? salary;
  int? takenSalary;

  DataOfTeachersSalary({this.date, this.id, this.residue, this.salary, this.takenSalary});

  DataOfTeachersSalary.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    id = json['id'];
    residue = json['residue'];
    salary = json['salary'];
    takenSalary = json['taken_salary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['id'] = this.id;
    data['residue'] = this.residue;
    data['salary'] = this.salary;
    data['taken_salary'] = this.takenSalary;
    return data;
  }
}
