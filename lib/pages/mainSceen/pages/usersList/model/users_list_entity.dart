import 'package:gennis_innovative_school/generated/json/base/json_field.dart';
import 'package:gennis_innovative_school/generated/json/users_list_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class UsersListEntity {
	 UsersListData data = UsersListData();
	late int groupID;
	late String groupName;
	late bool groupStatus;
	late String groupSubject;
	late bool isTime;
	late List<UsersListLinks> links;
	late int locationId;
	@JSONField(name: "teacher_id")
	late int teacherId;
	@JSONField(name: "time_table")
	late List<UsersListTimeTable> timeTable;

	UsersListEntity();

	factory UsersListEntity.fromJson(Map<String, dynamic> json) => $UsersListEntityFromJson(json);

	Map<String, dynamic> toJson() => $UsersListEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UsersListData {
	 UsersListDataInformation information = UsersListDataInformation();
	late List<UsersListDataStudents> students;

	UsersListData();

	factory UsersListData.fromJson(Map<String, dynamic> json) => $UsersListDataFromJson(json);

	Map<String, dynamic> toJson() => $UsersListDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UsersListDataInformation {
	late UsersListDataInformationEduLang eduLang = UsersListDataInformationEduLang();
	late UsersListDataInformationGroupCourseType groupCourseType;
	late UsersListDataInformationGroupName groupName;
	late UsersListDataInformationGroupPrice groupPrice;
	late UsersListDataInformationStudentsLength studentsLength;
	late UsersListDataInformationTeacherName teacherName;
	late UsersListDataInformationTeacherSalary teacherSalary;
	late UsersListDataInformationTeacherSurname teacherSurname;

	UsersListDataInformation();

	factory UsersListDataInformation.fromJson(Map<String, dynamic> json) => $UsersListDataInformationFromJson(json);

	Map<String, dynamic> toJson() => $UsersListDataInformationToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UsersListDataInformationEduLang {
	late String name;
	late String value;

	UsersListDataInformationEduLang();

	factory UsersListDataInformationEduLang.fromJson(Map<String, dynamic> json) => $UsersListDataInformationEduLangFromJson(json);

	Map<String, dynamic> toJson() => $UsersListDataInformationEduLangToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UsersListDataInformationGroupCourseType {
	late String name;
	late String value;

	UsersListDataInformationGroupCourseType();

	factory UsersListDataInformationGroupCourseType.fromJson(Map<String, dynamic> json) => $UsersListDataInformationGroupCourseTypeFromJson(json);

	Map<String, dynamic> toJson() => $UsersListDataInformationGroupCourseTypeToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UsersListDataInformationGroupName {
	late String name;
	late String value;

	UsersListDataInformationGroupName();

	factory UsersListDataInformationGroupName.fromJson(Map<String, dynamic> json) => $UsersListDataInformationGroupNameFromJson(json);

	Map<String, dynamic> toJson() => $UsersListDataInformationGroupNameToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UsersListDataInformationGroupPrice {
	late String name;
	late int value;

	UsersListDataInformationGroupPrice();

	factory UsersListDataInformationGroupPrice.fromJson(Map<String, dynamic> json) => $UsersListDataInformationGroupPriceFromJson(json);

	Map<String, dynamic> toJson() => $UsersListDataInformationGroupPriceToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UsersListDataInformationStudentsLength {
	late String name;
	late int value;

	UsersListDataInformationStudentsLength();

	factory UsersListDataInformationStudentsLength.fromJson(Map<String, dynamic> json) => $UsersListDataInformationStudentsLengthFromJson(json);

	Map<String, dynamic> toJson() => $UsersListDataInformationStudentsLengthToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UsersListDataInformationTeacherName {
	late String name;
	late String value;

	UsersListDataInformationTeacherName();

	factory UsersListDataInformationTeacherName.fromJson(Map<String, dynamic> json) => $UsersListDataInformationTeacherNameFromJson(json);

	Map<String, dynamic> toJson() => $UsersListDataInformationTeacherNameToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UsersListDataInformationTeacherSalary {
	late String name;
	late int value;

	UsersListDataInformationTeacherSalary();

	factory UsersListDataInformationTeacherSalary.fromJson(Map<String, dynamic> json) => $UsersListDataInformationTeacherSalaryFromJson(json);

	Map<String, dynamic> toJson() => $UsersListDataInformationTeacherSalaryToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UsersListDataInformationTeacherSurname {
	late String name;
	late String value;

	UsersListDataInformationTeacherSurname();

	factory UsersListDataInformationTeacherSurname.fromJson(Map<String, dynamic> json) => $UsersListDataInformationTeacherSurnameFromJson(json);

	Map<String, dynamic> toJson() => $UsersListDataInformationTeacherSurnameToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UsersListDataStudents {
	late int age;
	late String comment;
	late int id;
	dynamic img;
	late int money;
	late String moneyType;
	late String name;
	late String phone;
	@JSONField(name: "photo_profile")
	dynamic photoProfile;
	@JSONField(name: "reg_date")
	late String regDate;
	late String role;
	late String surname;
	late String username;

	UsersListDataStudents();

	factory UsersListDataStudents.fromJson(Map<String, dynamic> json) => $UsersListDataStudentsFromJson(json);

	Map<String, dynamic> toJson() => $UsersListDataStudentsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UsersListLinks {
	late String iconClazz;
	late String link;
	late String title;
	late String type;
	late String name;

	UsersListLinks();

	factory UsersListLinks.fromJson(Map<String, dynamic> json) => $UsersListLinksFromJson(json);

	Map<String, dynamic> toJson() => $UsersListLinksToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UsersListTimeTable {
	late String day;
	@JSONField(name: "end_time")
	late String endTime;
	late String room;
	@JSONField(name: "start_time")
	late String startTime;
	@JSONField(name: "time_id")
	late int timeId;

	UsersListTimeTable();

	factory UsersListTimeTable.fromJson(Map<String, dynamic> json) => $UsersListTimeTableFromJson(json);

	Map<String, dynamic> toJson() => $UsersListTimeTableToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}