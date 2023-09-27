class LessonPlanGet {
  LessonPlan? lessonPlan;

  LessonPlanGet({this.lessonPlan});

  LessonPlanGet.fromJson(Map<String, dynamic> json) {
    lessonPlan = json['lesson_plan'] != null
        ? LessonPlan.fromJson(json['lesson_plan'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (lessonPlan != null) {
      data['lesson_plan'] = lessonPlan!.toJson();
    }
    return data;
  }
}

class LessonPlan {
  String? assessment;
  String? date;
  Group? group;
  int? id;
  String? lastHomework;
  String? lessonName;
  String? lessonTarget;
  String? mainLesson;
  String? newHomework;
  Group? teacher;

  LessonPlan(
      {this.assessment,
        this.date,
        this.group,
        this.id,
        this.lastHomework,
        this.lessonName,
        this.lessonTarget,
        this.mainLesson,
        this.newHomework,
        this.teacher});

  LessonPlan.fromJson(Map<String, dynamic> json) {
    assessment = json['assessment'];
    date = json['date'];
    group = json['group'] != null ? new Group.fromJson(json['group']) : null;
    id = json['id'];
    lastHomework = json['last_homework'];
    lessonName = json['lesson_name'];
    lessonTarget = json['lesson_target'];
    mainLesson = json['main_lesson'];
    newHomework = json['new_homework'];
    teacher =
    json['teacher'] != null ? new Group.fromJson(json['teacher']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assessment'] = this.assessment;
    data['date'] = this.date;
    if (this.group != null) {
      data['group'] = this.group!.toJson();
    }
    data['id'] = this.id;
    data['last_homework'] = this.lastHomework;
    data['lesson_name'] = this.lessonName;
    data['lesson_target'] = this.lessonTarget;
    data['main_lesson'] = this.mainLesson;
    data['new_homework'] = this.newHomework;
    if (this.teacher != null) {
      data['teacher'] = this.teacher!.toJson();
    }
    return data;
  }
}

class Group {
  int? id;
  String? name;

  Group({this.id, this.name});

  Group.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
