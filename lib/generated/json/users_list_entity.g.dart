import 'package:gennis_innovative_school/generated/json/base/json_convert_content.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users_list_entity.dart';

UsersListEntity $UsersListEntityFromJson(Map<String, dynamic> json) {
	final UsersListEntity usersListEntity = UsersListEntity();
	final UsersListData? data = jsonConvert.convert<UsersListData>(json['data']);
	if (data != null) {
		usersListEntity.data = data;
	}
	final int? groupID = jsonConvert.convert<int>(json['groupID']);
	if (groupID != null) {
		usersListEntity.groupID = groupID;
	}
	final String? groupName = jsonConvert.convert<String>(json['groupName']);
	if (groupName != null) {
		usersListEntity.groupName = groupName;
	}
	final bool? groupStatus = jsonConvert.convert<bool>(json['groupStatus']);
	if (groupStatus != null) {
		usersListEntity.groupStatus = groupStatus;
	}
	final String? groupSubject = jsonConvert.convert<String>(json['groupSubject']);
	if (groupSubject != null) {
		usersListEntity.groupSubject = groupSubject;
	}
	final bool? isTime = jsonConvert.convert<bool>(json['isTime']);
	if (isTime != null) {
		usersListEntity.isTime = isTime;
	}
	final List<UsersListLinks>? links = jsonConvert.convertListNotNull<UsersListLinks>(json['links']);
	if (links != null) {
		usersListEntity.links = links;
	}
	final int? locationId = jsonConvert.convert<int>(json['locationId']);
	if (locationId != null) {
		usersListEntity.locationId = locationId;
	}
	final int? teacherId = jsonConvert.convert<int>(json['teacher_id']);
	if (teacherId != null) {
		usersListEntity.teacherId = teacherId;
	}
	final List<UsersListTimeTable>? timeTable = jsonConvert.convertListNotNull<UsersListTimeTable>(json['time_table']);
	if (timeTable != null) {
		usersListEntity.timeTable = timeTable;
	}
	return usersListEntity;
}

Map<String, dynamic> $UsersListEntityToJson(UsersListEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data.toJson();
	data['groupID'] = entity.groupID;
	data['groupName'] = entity.groupName;
	data['groupStatus'] = entity.groupStatus;
	data['groupSubject'] = entity.groupSubject;
	data['isTime'] = entity.isTime;
	data['links'] =  entity.links.map((v) => v.toJson()).toList();
	data['locationId'] = entity.locationId;
	data['teacher_id'] = entity.teacherId;
	data['time_table'] =  entity.timeTable.map((v) => v.toJson()).toList();
	return data;
}

UsersListData $UsersListDataFromJson(Map<String, dynamic> json) {
	final UsersListData usersListData = UsersListData();
	final UsersListDataInformation? information = jsonConvert.convert<UsersListDataInformation>(json['information']);
	if (information != null) {
		usersListData.information = information;
	}
	final List<UsersListDataStudents>? students = jsonConvert.convertListNotNull<UsersListDataStudents>(json['students']);
	if (students != null) {
		usersListData.students = students;
	}
	return usersListData;
}

Map<String, dynamic> $UsersListDataToJson(UsersListData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['information'] = entity.information.toJson();
	data['students'] =  entity.students.map((v) => v.toJson()).toList();
	return data;
}

UsersListDataInformation $UsersListDataInformationFromJson(Map<String, dynamic> json) {
	final UsersListDataInformation usersListDataInformation = UsersListDataInformation();
	final UsersListDataInformationEduLang? eduLang = jsonConvert.convert<UsersListDataInformationEduLang>(json['eduLang']);
	if (eduLang != null) {
		usersListDataInformation.eduLang = eduLang;
	}
	final UsersListDataInformationGroupCourseType? groupCourseType = jsonConvert.convert<UsersListDataInformationGroupCourseType>(json['groupCourseType']);
	if (groupCourseType != null) {
		usersListDataInformation.groupCourseType = groupCourseType;
	}
	final UsersListDataInformationGroupName? groupName = jsonConvert.convert<UsersListDataInformationGroupName>(json['groupName']);
	if (groupName != null) {
		usersListDataInformation.groupName = groupName;
	}
	final UsersListDataInformationGroupPrice? groupPrice = jsonConvert.convert<UsersListDataInformationGroupPrice>(json['groupPrice']);
	if (groupPrice != null) {
		usersListDataInformation.groupPrice = groupPrice;
	}
	final UsersListDataInformationStudentsLength? studentsLength = jsonConvert.convert<UsersListDataInformationStudentsLength>(json['studentsLength']);
	if (studentsLength != null) {
		usersListDataInformation.studentsLength = studentsLength;
	}
	final UsersListDataInformationTeacherName? teacherName = jsonConvert.convert<UsersListDataInformationTeacherName>(json['teacherName']);
	if (teacherName != null) {
		usersListDataInformation.teacherName = teacherName;
	}
	final UsersListDataInformationTeacherSalary? teacherSalary = jsonConvert.convert<UsersListDataInformationTeacherSalary>(json['teacherSalary']);
	if (teacherSalary != null) {
		usersListDataInformation.teacherSalary = teacherSalary;
	}
	final UsersListDataInformationTeacherSurname? teacherSurname = jsonConvert.convert<UsersListDataInformationTeacherSurname>(json['teacherSurname']);
	if (teacherSurname != null) {
		usersListDataInformation.teacherSurname = teacherSurname;
	}
	return usersListDataInformation;
}

Map<String, dynamic> $UsersListDataInformationToJson(UsersListDataInformation entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['eduLang'] = entity.eduLang.toJson();
	data['groupCourseType'] = entity.groupCourseType.toJson();
	data['groupName'] = entity.groupName.toJson();
	data['groupPrice'] = entity.groupPrice.toJson();
	data['studentsLength'] = entity.studentsLength.toJson();
	data['teacherName'] = entity.teacherName.toJson();
	data['teacherSalary'] = entity.teacherSalary.toJson();
	data['teacherSurname'] = entity.teacherSurname.toJson();
	return data;
}

UsersListDataInformationEduLang $UsersListDataInformationEduLangFromJson(Map<String, dynamic> json) {
	final UsersListDataInformationEduLang usersListDataInformationEduLang = UsersListDataInformationEduLang();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		usersListDataInformationEduLang.name = name;
	}
	final String? value = jsonConvert.convert<String>(json['value']);
	if (value != null) {
		usersListDataInformationEduLang.value = value;
	}
	return usersListDataInformationEduLang;
}

Map<String, dynamic> $UsersListDataInformationEduLangToJson(UsersListDataInformationEduLang entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['value'] = entity.value;
	return data;
}

UsersListDataInformationGroupCourseType $UsersListDataInformationGroupCourseTypeFromJson(Map<String, dynamic> json) {
	final UsersListDataInformationGroupCourseType usersListDataInformationGroupCourseType = UsersListDataInformationGroupCourseType();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		usersListDataInformationGroupCourseType.name = name;
	}
	final String? value = jsonConvert.convert<String>(json['value']);
	if (value != null) {
		usersListDataInformationGroupCourseType.value = value;
	}
	return usersListDataInformationGroupCourseType;
}

Map<String, dynamic> $UsersListDataInformationGroupCourseTypeToJson(UsersListDataInformationGroupCourseType entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['value'] = entity.value;
	return data;
}

UsersListDataInformationGroupName $UsersListDataInformationGroupNameFromJson(Map<String, dynamic> json) {
	final UsersListDataInformationGroupName usersListDataInformationGroupName = UsersListDataInformationGroupName();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		usersListDataInformationGroupName.name = name;
	}
	final String? value = jsonConvert.convert<String>(json['value']);
	if (value != null) {
		usersListDataInformationGroupName.value = value;
	}
	return usersListDataInformationGroupName;
}

Map<String, dynamic> $UsersListDataInformationGroupNameToJson(UsersListDataInformationGroupName entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['value'] = entity.value;
	return data;
}

UsersListDataInformationGroupPrice $UsersListDataInformationGroupPriceFromJson(Map<String, dynamic> json) {
	final UsersListDataInformationGroupPrice usersListDataInformationGroupPrice = UsersListDataInformationGroupPrice();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		usersListDataInformationGroupPrice.name = name;
	}
	final int? value = jsonConvert.convert<int>(json['value']);
	if (value != null) {
		usersListDataInformationGroupPrice.value = value;
	}
	return usersListDataInformationGroupPrice;
}

Map<String, dynamic> $UsersListDataInformationGroupPriceToJson(UsersListDataInformationGroupPrice entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['value'] = entity.value;
	return data;
}

UsersListDataInformationStudentsLength $UsersListDataInformationStudentsLengthFromJson(Map<String, dynamic> json) {
	final UsersListDataInformationStudentsLength usersListDataInformationStudentsLength = UsersListDataInformationStudentsLength();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		usersListDataInformationStudentsLength.name = name;
	}
	final int? value = jsonConvert.convert<int>(json['value']);
	if (value != null) {
		usersListDataInformationStudentsLength.value = value;
	}
	return usersListDataInformationStudentsLength;
}

Map<String, dynamic> $UsersListDataInformationStudentsLengthToJson(UsersListDataInformationStudentsLength entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['value'] = entity.value;
	return data;
}

UsersListDataInformationTeacherName $UsersListDataInformationTeacherNameFromJson(Map<String, dynamic> json) {
	final UsersListDataInformationTeacherName usersListDataInformationTeacherName = UsersListDataInformationTeacherName();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		usersListDataInformationTeacherName.name = name;
	}
	final String? value = jsonConvert.convert<String>(json['value']);
	if (value != null) {
		usersListDataInformationTeacherName.value = value;
	}
	return usersListDataInformationTeacherName;
}

Map<String, dynamic> $UsersListDataInformationTeacherNameToJson(UsersListDataInformationTeacherName entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['value'] = entity.value;
	return data;
}

UsersListDataInformationTeacherSalary $UsersListDataInformationTeacherSalaryFromJson(Map<String, dynamic> json) {
	final UsersListDataInformationTeacherSalary usersListDataInformationTeacherSalary = UsersListDataInformationTeacherSalary();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		usersListDataInformationTeacherSalary.name = name;
	}
	final int? value = jsonConvert.convert<int>(json['value']);
	if (value != null) {
		usersListDataInformationTeacherSalary.value = value;
	}
	return usersListDataInformationTeacherSalary;
}

Map<String, dynamic> $UsersListDataInformationTeacherSalaryToJson(UsersListDataInformationTeacherSalary entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['value'] = entity.value;
	return data;
}

UsersListDataInformationTeacherSurname $UsersListDataInformationTeacherSurnameFromJson(Map<String, dynamic> json) {
	final UsersListDataInformationTeacherSurname usersListDataInformationTeacherSurname = UsersListDataInformationTeacherSurname();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		usersListDataInformationTeacherSurname.name = name;
	}
	final String? value = jsonConvert.convert<String>(json['value']);
	if (value != null) {
		usersListDataInformationTeacherSurname.value = value;
	}
	return usersListDataInformationTeacherSurname;
}

Map<String, dynamic> $UsersListDataInformationTeacherSurnameToJson(UsersListDataInformationTeacherSurname entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['value'] = entity.value;
	return data;
}

UsersListDataStudents $UsersListDataStudentsFromJson(Map<String, dynamic> json) {
	final UsersListDataStudents usersListDataStudents = UsersListDataStudents();
	final int? age = jsonConvert.convert<int>(json['age']);
	if (age != null) {
		usersListDataStudents.age = age;
	}
	final String? comment = jsonConvert.convert<String>(json['comment']);
	if (comment != null) {
		usersListDataStudents.comment = comment;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		usersListDataStudents.id = id;
	}
	final dynamic img = jsonConvert.convert<dynamic>(json['img']);
	if (img != null) {
		usersListDataStudents.img = img;
	}
	final int? money = jsonConvert.convert<int>(json['money']);
	if (money != null) {
		usersListDataStudents.money = money;
	}
	final String? moneyType = jsonConvert.convert<String>(json['moneyType']);
	if (moneyType != null) {
		usersListDataStudents.moneyType = moneyType;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		usersListDataStudents.name = name;
	}
	final String? phone = jsonConvert.convert<String>(json['phone']);
	if (phone != null) {
		usersListDataStudents.phone = phone;
	}
	final dynamic photoProfile = jsonConvert.convert<dynamic>(json['photo_profile']);
	if (photoProfile != null) {
		usersListDataStudents.photoProfile = photoProfile;
	}
	final String? regDate = jsonConvert.convert<String>(json['reg_date']);
	if (regDate != null) {
		usersListDataStudents.regDate = regDate;
	}
	final String? role = jsonConvert.convert<String>(json['role']);
	if (role != null) {
		usersListDataStudents.role = role;
	}
	final String? surname = jsonConvert.convert<String>(json['surname']);
	if (surname != null) {
		usersListDataStudents.surname = surname;
	}
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		usersListDataStudents.username = username;
	}
	return usersListDataStudents;
}

Map<String, dynamic> $UsersListDataStudentsToJson(UsersListDataStudents entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['age'] = entity.age;
	data['comment'] = entity.comment;
	data['id'] = entity.id;
	data['img'] = entity.img;
	data['money'] = entity.money;
	data['moneyType'] = entity.moneyType;
	data['name'] = entity.name;
	data['phone'] = entity.phone;
	data['photo_profile'] = entity.photoProfile;
	data['reg_date'] = entity.regDate;
	data['role'] = entity.role;
	data['surname'] = entity.surname;
	data['username'] = entity.username;
	return data;
}

UsersListLinks $UsersListLinksFromJson(Map<String, dynamic> json) {
	final UsersListLinks usersListLinks = UsersListLinks();
	final String? iconClazz = jsonConvert.convert<String>(json['iconClazz']);
	if (iconClazz != null) {
		usersListLinks.iconClazz = iconClazz;
	}
	final String? link = jsonConvert.convert<String>(json['link']);
	if (link != null) {
		usersListLinks.link = link;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		usersListLinks.title = title;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		usersListLinks.type = type;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		usersListLinks.name = name;
	}
	return usersListLinks;
}

Map<String, dynamic> $UsersListLinksToJson(UsersListLinks entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['iconClazz'] = entity.iconClazz;
	data['link'] = entity.link;
	data['title'] = entity.title;
	data['type'] = entity.type;
	data['name'] = entity.name;
	return data;
}

UsersListTimeTable $UsersListTimeTableFromJson(Map<String, dynamic> json) {
	final UsersListTimeTable usersListTimeTable = UsersListTimeTable();
	final String? day = jsonConvert.convert<String>(json['day']);
	if (day != null) {
		usersListTimeTable.day = day;
	}
	final String? endTime = jsonConvert.convert<String>(json['end_time']);
	if (endTime != null) {
		usersListTimeTable.endTime = endTime;
	}
	final String? room = jsonConvert.convert<String>(json['room']);
	if (room != null) {
		usersListTimeTable.room = room;
	}
	final String? startTime = jsonConvert.convert<String>(json['start_time']);
	if (startTime != null) {
		usersListTimeTable.startTime = startTime;
	}
	final int? timeId = jsonConvert.convert<int>(json['time_id']);
	if (timeId != null) {
		usersListTimeTable.timeId = timeId;
	}
	return usersListTimeTable;
}

Map<String, dynamic> $UsersListTimeTableToJson(UsersListTimeTable entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['day'] = entity.day;
	data['end_time'] = entity.endTime;
	data['room'] = entity.room;
	data['start_time'] = entity.startTime;
	data['time_id'] = entity.timeId;
	return data;
}