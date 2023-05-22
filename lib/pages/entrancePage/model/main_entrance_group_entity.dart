import 'package:gennis_innovative_school/generated/json/base/json_field.dart';
import 'package:gennis_innovative_school/generated/json/main_entrance_group_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class MainEntranceGroupEntity {
	 List<MainEntranceGroupGroups> groups = [];

	MainEntranceGroupEntity();

	factory MainEntranceGroupEntity.fromJson(Map<String, dynamic> json) => $MainEntranceGroupEntityFromJson(json);

	Map<String, dynamic> toJson() => $MainEntranceGroupEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MainEntranceGroupGroups {
	late int id;
	late String name;
	late int payment;
	late int studentsLength;
	late String subject;
	late int teacherID;
	 String? teacherImg;
	late String teacherName;
	late String teacherSurname;
	late String typeOfCourse;

	MainEntranceGroupGroups();

	factory MainEntranceGroupGroups.fromJson(Map<String, dynamic> json) => $MainEntranceGroupGroupsFromJson(json);

	Map<String, dynamic> toJson() => $MainEntranceGroupGroupsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}