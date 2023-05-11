import 'package:gennis_innovative_school/generated/json/base/json_convert_content.dart';
import 'package:gennis_innovative_school/pages/entrancePage/model/main_entrance_group_entity.dart';

MainEntranceGroupEntity $MainEntranceGroupEntityFromJson(Map<String, dynamic> json) {
	final MainEntranceGroupEntity mainEntranceGroupEntity = MainEntranceGroupEntity();
	final List<MainEntranceGroupGroups>? groups = jsonConvert.convertListNotNull<MainEntranceGroupGroups>(json['groups']);
	if (groups != null) {
		mainEntranceGroupEntity.groups = groups;
	}
	return mainEntranceGroupEntity;
}

Map<String, dynamic> $MainEntranceGroupEntityToJson(MainEntranceGroupEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['groups'] =  entity.groups.map((v) => v.toJson()).toList();
	return data;
}

MainEntranceGroupGroups $MainEntranceGroupGroupsFromJson(Map<String, dynamic> json) {
	final MainEntranceGroupGroups mainEntranceGroupGroups = MainEntranceGroupGroups();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		mainEntranceGroupGroups.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		mainEntranceGroupGroups.name = name;
	}
	final int? payment = jsonConvert.convert<int>(json['payment']);
	if (payment != null) {
		mainEntranceGroupGroups.payment = payment;
	}
	final int? studentsLength = jsonConvert.convert<int>(json['studentsLength']);
	if (studentsLength != null) {
		mainEntranceGroupGroups.studentsLength = studentsLength;
	}
	final String? subject = jsonConvert.convert<String>(json['subject']);
	if (subject != null) {
		mainEntranceGroupGroups.subject = subject;
	}
	final int? teacherID = jsonConvert.convert<int>(json['teacherID']);
	if (teacherID != null) {
		mainEntranceGroupGroups.teacherID = teacherID;
	}
	final String? teacherImg = jsonConvert.convert<String>(json['teacherImg']);
	if (teacherImg != null) {
		mainEntranceGroupGroups.teacherImg = teacherImg;
	}
	final String? teacherName = jsonConvert.convert<String>(json['teacherName']);
	if (teacherName != null) {
		mainEntranceGroupGroups.teacherName = teacherName;
	}
	final String? teacherSurname = jsonConvert.convert<String>(json['teacherSurname']);
	if (teacherSurname != null) {
		mainEntranceGroupGroups.teacherSurname = teacherSurname;
	}
	final String? typeOfCourse = jsonConvert.convert<String>(json['typeOfCourse']);
	if (typeOfCourse != null) {
		mainEntranceGroupGroups.typeOfCourse = typeOfCourse;
	}
	return mainEntranceGroupGroups;
}

Map<String, dynamic> $MainEntranceGroupGroupsToJson(MainEntranceGroupGroups entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['payment'] = entity.payment;
	data['studentsLength'] = entity.studentsLength;
	data['subject'] = entity.subject;
	data['teacherID'] = entity.teacherID;
	data['teacherImg'] = entity.teacherImg;
	data['teacherName'] = entity.teacherName;
	data['teacherSurname'] = entity.teacherSurname;
	data['typeOfCourse'] = entity.typeOfCourse;
	return data;
}