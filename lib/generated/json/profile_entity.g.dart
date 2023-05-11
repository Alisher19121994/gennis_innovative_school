import 'package:gennis_innovative_school/generated/json/base/json_convert_content.dart';
import 'package:gennis_innovative_school/pages/profilePage/model/profile_entity.dart';

ProfileEntity $ProfileEntityFromJson(Map<String, dynamic> json) {
	final ProfileEntity profileEntity = ProfileEntity();
	final ProfileUser? user = jsonConvert.convert<ProfileUser>(json['user']);
	if (user != null) {
		profileEntity.user = user;
	}
	return profileEntity;
}

Map<String, dynamic> $ProfileEntityToJson(ProfileEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['user'] = entity.user?.toJson();
	return data;
}

ProfileUser $ProfileUserFromJson(Map<String, dynamic> json) {
	final ProfileUser profileUser = ProfileUser();
	final ProfileUserActiveToChange? activeToChange = jsonConvert.convert<ProfileUserActiveToChange>(json['activeToChange']);
	if (activeToChange != null) {
		profileUser.activeToChange = activeToChange;
	}
	final List<ProfileUserGroups>? groups = jsonConvert.convertListNotNull<ProfileUserGroups>(json['groups']);
	if (groups != null) {
		profileUser.groups = groups;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		profileUser.id = id;
	}
	final ProfileUserInfo? info = jsonConvert.convert<ProfileUserInfo>(json['info']);
	if (info != null) {
		profileUser.info = info;
	}
	final List<ProfileUserLinks>? links = jsonConvert.convertListNotNull<ProfileUserLinks>(json['links']);
	if (links != null) {
		profileUser.links = links;
	}
	final int? locationId = jsonConvert.convert<int>(json['location_id']);
	if (locationId != null) {
		profileUser.locationId = locationId;
	}
	final List<int>? locationList = jsonConvert.convertListNotNull<int>(json['location_list']);
	if (locationList != null) {
		profileUser.locationList = locationList;
	}
	final String? photoProfile = jsonConvert.convert<String>(json['photo_profile']);
	if (photoProfile != null) {
		profileUser.photoProfile = photoProfile;
	}
	final String? role = jsonConvert.convert<String>(json['role']);
	if (role != null) {
		profileUser.role = role;
	}
	final String? typeRole = jsonConvert.convert<String>(json['type_role']);
	if (typeRole != null) {
		profileUser.typeRole = typeRole;
	}
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		profileUser.username = username;
	}
	return profileUser;
}

Map<String, dynamic> $ProfileUserToJson(ProfileUser entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['activeToChange'] = entity.activeToChange.toJson();
	data['groups'] =  entity.groups.map((v) => v.toJson()).toList();
	data['id'] = entity.id;
	data['info'] = entity.info.toJson();
	data['links'] =  entity.links.map((v) => v.toJson()).toList();
	data['location_id'] = entity.locationId;
	data['location_list'] =  entity.locationList;
	data['photo_profile'] = entity.photoProfile;
	data['role'] = entity.role;
	data['type_role'] = entity.typeRole;
	data['username'] = entity.username;
	return data;
}

ProfileUserActiveToChange $ProfileUserActiveToChangeFromJson(Map<String, dynamic> json) {
	final ProfileUserActiveToChange profileUserActiveToChange = ProfileUserActiveToChange();
	final bool? age = jsonConvert.convert<bool>(json['age']);
	if (age != null) {
		profileUserActiveToChange.age = age;
	}
	final bool? birth = jsonConvert.convert<bool>(json['birth']);
	if (birth != null) {
		profileUserActiveToChange.birth = birth;
	}
	final bool? color = jsonConvert.convert<bool>(json['color']);
	if (color != null) {
		profileUserActiveToChange.color = color;
	}
	final bool? comment = jsonConvert.convert<bool>(json['comment']);
	if (comment != null) {
		profileUserActiveToChange.comment = comment;
	}
	final bool? fathersName = jsonConvert.convert<bool>(json['fathersName']);
	if (fathersName != null) {
		profileUserActiveToChange.fathersName = fathersName;
	}
	final bool? language = jsonConvert.convert<bool>(json['language']);
	if (language != null) {
		profileUserActiveToChange.language = language;
	}
	final bool? name = jsonConvert.convert<bool>(json['name']);
	if (name != null) {
		profileUserActiveToChange.name = name;
	}
	final bool? phone = jsonConvert.convert<bool>(json['phone']);
	if (phone != null) {
		profileUserActiveToChange.phone = phone;
	}
	final bool? surname = jsonConvert.convert<bool>(json['surname']);
	if (surname != null) {
		profileUserActiveToChange.surname = surname;
	}
	final bool? username = jsonConvert.convert<bool>(json['username']);
	if (username != null) {
		profileUserActiveToChange.username = username;
	}
	return profileUserActiveToChange;
}

Map<String, dynamic> $ProfileUserActiveToChangeToJson(ProfileUserActiveToChange entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['age'] = entity.age;
	data['birth'] = entity.birth;
	data['color'] = entity.color;
	data['comment'] = entity.comment;
	data['fathersName'] = entity.fathersName;
	data['language'] = entity.language;
	data['name'] = entity.name;
	data['phone'] = entity.phone;
	data['surname'] = entity.surname;
	data['username'] = entity.username;
	return data;
}

ProfileUserGroups $ProfileUserGroupsFromJson(Map<String, dynamic> json) {
	final ProfileUserGroups profileUserGroups = ProfileUserGroups();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		profileUserGroups.id = id;
	}
	final String? nameGroup = jsonConvert.convert<String>(json['nameGroup']);
	if (nameGroup != null) {
		profileUserGroups.nameGroup = nameGroup;
	}
	final String? teacherImg = jsonConvert.convert<String>(json['teacherImg']);
	if (teacherImg != null) {
		profileUserGroups.teacherImg = teacherImg;
	}
	return profileUserGroups;
}

Map<String, dynamic> $ProfileUserGroupsToJson(ProfileUserGroups entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['nameGroup'] = entity.nameGroup;
	data['teacherImg'] = entity.teacherImg;
	return data;
}

ProfileUserInfo $ProfileUserInfoFromJson(Map<String, dynamic> json) {
	final ProfileUserInfo profileUserInfo = ProfileUserInfo();
	final ProfileUserInfoAge? age = jsonConvert.convert<ProfileUserInfoAge>(json['age']);
	if (age != null) {
		profileUserInfo.age = age;
	}
	final ProfileUserInfoBirthDate? birthDate = jsonConvert.convert<ProfileUserInfoBirthDate>(json['birthDate']);
	if (birthDate != null) {
		profileUserInfo.birthDate = birthDate;
	}
	final ProfileUserInfoBirthDay? birthDay = jsonConvert.convert<ProfileUserInfoBirthDay>(json['birthDay']);
	if (birthDay != null) {
		profileUserInfo.birthDay = birthDay;
	}
	final ProfileUserInfoBirthMonth? birthMonth = jsonConvert.convert<ProfileUserInfoBirthMonth>(json['birthMonth']);
	if (birthMonth != null) {
		profileUserInfo.birthMonth = birthMonth;
	}
	final ProfileUserInfoBirthYear? birthYear = jsonConvert.convert<ProfileUserInfoBirthYear>(json['birthYear']);
	if (birthYear != null) {
		profileUserInfo.birthYear = birthYear;
	}
	final ProfileUserInfoFathersName? fathersName = jsonConvert.convert<ProfileUserInfoFathersName>(json['fathersName']);
	if (fathersName != null) {
		profileUserInfo.fathersName = fathersName;
	}
	final ProfileUserInfoName? name = jsonConvert.convert<ProfileUserInfoName>(json['name']);
	if (name != null) {
		profileUserInfo.name = name;
	}
	final ProfileUserInfoPhone? phone = jsonConvert.convert<ProfileUserInfoPhone>(json['phone']);
	if (phone != null) {
		profileUserInfo.phone = phone;
	}
	final ProfileUserInfoSurname? surname = jsonConvert.convert<ProfileUserInfoSurname>(json['surname']);
	if (surname != null) {
		profileUserInfo.surname = surname;
	}
	final ProfileUserInfoUsername? username = jsonConvert.convert<ProfileUserInfoUsername>(json['username']);
	if (username != null) {
		profileUserInfo.username = username;
	}
	return profileUserInfo;
}

Map<String, dynamic> $ProfileUserInfoToJson(ProfileUserInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['age'] = entity.age.toJson();
	data['birthDate'] = entity.birthDate.toJson();
	data['birthDay'] = entity.birthDay.toJson();
	data['birthMonth'] = entity.birthMonth.toJson();
	data['birthYear'] = entity.birthYear.toJson();
	data['fathersName'] = entity.fathersName.toJson();
	data['name'] = entity.name.toJson();
	data['phone'] = entity.phone.toJson();
	data['surname'] = entity.surname.toJson();
	data['username'] = entity.username.toJson();
	return data;
}

ProfileUserInfoAge $ProfileUserInfoAgeFromJson(Map<String, dynamic> json) {
	final ProfileUserInfoAge profileUserInfoAge = ProfileUserInfoAge();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		profileUserInfoAge.name = name;
	}
	final int? order = jsonConvert.convert<int>(json['order']);
	if (order != null) {
		profileUserInfoAge.order = order;
	}
	final int? value = jsonConvert.convert<int>(json['value']);
	if (value != null) {
		profileUserInfoAge.value = value;
	}
	return profileUserInfoAge;
}

Map<String, dynamic> $ProfileUserInfoAgeToJson(ProfileUserInfoAge entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['order'] = entity.order;
	data['value'] = entity.value;
	return data;
}

ProfileUserInfoBirthDate $ProfileUserInfoBirthDateFromJson(Map<String, dynamic> json) {
	final ProfileUserInfoBirthDate profileUserInfoBirthDate = ProfileUserInfoBirthDate();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		profileUserInfoBirthDate.name = name;
	}
	final int? order = jsonConvert.convert<int>(json['order']);
	if (order != null) {
		profileUserInfoBirthDate.order = order;
	}
	final String? value = jsonConvert.convert<String>(json['value']);
	if (value != null) {
		profileUserInfoBirthDate.value = value;
	}
	return profileUserInfoBirthDate;
}

Map<String, dynamic> $ProfileUserInfoBirthDateToJson(ProfileUserInfoBirthDate entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['order'] = entity.order;
	data['value'] = entity.value;
	return data;
}

ProfileUserInfoBirthDay $ProfileUserInfoBirthDayFromJson(Map<String, dynamic> json) {
	final ProfileUserInfoBirthDay profileUserInfoBirthDay = ProfileUserInfoBirthDay();
	final String? display = jsonConvert.convert<String>(json['display']);
	if (display != null) {
		profileUserInfoBirthDay.display = display;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		profileUserInfoBirthDay.name = name;
	}
	final int? value = jsonConvert.convert<int>(json['value']);
	if (value != null) {
		profileUserInfoBirthDay.value = value;
	}
	return profileUserInfoBirthDay;
}

Map<String, dynamic> $ProfileUserInfoBirthDayToJson(ProfileUserInfoBirthDay entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['display'] = entity.display;
	data['name'] = entity.name;
	data['value'] = entity.value;
	return data;
}

ProfileUserInfoBirthMonth $ProfileUserInfoBirthMonthFromJson(Map<String, dynamic> json) {
	final ProfileUserInfoBirthMonth profileUserInfoBirthMonth = ProfileUserInfoBirthMonth();
	final String? display = jsonConvert.convert<String>(json['display']);
	if (display != null) {
		profileUserInfoBirthMonth.display = display;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		profileUserInfoBirthMonth.name = name;
	}
	final int? value = jsonConvert.convert<int>(json['value']);
	if (value != null) {
		profileUserInfoBirthMonth.value = value;
	}
	return profileUserInfoBirthMonth;
}

Map<String, dynamic> $ProfileUserInfoBirthMonthToJson(ProfileUserInfoBirthMonth entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['display'] = entity.display;
	data['name'] = entity.name;
	data['value'] = entity.value;
	return data;
}

ProfileUserInfoBirthYear $ProfileUserInfoBirthYearFromJson(Map<String, dynamic> json) {
	final ProfileUserInfoBirthYear profileUserInfoBirthYear = ProfileUserInfoBirthYear();
	final String? display = jsonConvert.convert<String>(json['display']);
	if (display != null) {
		profileUserInfoBirthYear.display = display;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		profileUserInfoBirthYear.name = name;
	}
	final int? value = jsonConvert.convert<int>(json['value']);
	if (value != null) {
		profileUserInfoBirthYear.value = value;
	}
	return profileUserInfoBirthYear;
}

Map<String, dynamic> $ProfileUserInfoBirthYearToJson(ProfileUserInfoBirthYear entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['display'] = entity.display;
	data['name'] = entity.name;
	data['value'] = entity.value;
	return data;
}

ProfileUserInfoFathersName $ProfileUserInfoFathersNameFromJson(Map<String, dynamic> json) {
	final ProfileUserInfoFathersName profileUserInfoFathersName = ProfileUserInfoFathersName();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		profileUserInfoFathersName.name = name;
	}
	final int? order = jsonConvert.convert<int>(json['order']);
	if (order != null) {
		profileUserInfoFathersName.order = order;
	}
	final String? value = jsonConvert.convert<String>(json['value']);
	if (value != null) {
		profileUserInfoFathersName.value = value;
	}
	return profileUserInfoFathersName;
}

Map<String, dynamic> $ProfileUserInfoFathersNameToJson(ProfileUserInfoFathersName entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['order'] = entity.order;
	data['value'] = entity.value;
	return data;
}

ProfileUserInfoName $ProfileUserInfoNameFromJson(Map<String, dynamic> json) {
	final ProfileUserInfoName profileUserInfoName = ProfileUserInfoName();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		profileUserInfoName.name = name;
	}
	final int? order = jsonConvert.convert<int>(json['order']);
	if (order != null) {
		profileUserInfoName.order = order;
	}
	final String? value = jsonConvert.convert<String>(json['value']);
	if (value != null) {
		profileUserInfoName.value = value;
	}
	return profileUserInfoName;
}

Map<String, dynamic> $ProfileUserInfoNameToJson(ProfileUserInfoName entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['order'] = entity.order;
	data['value'] = entity.value;
	return data;
}

ProfileUserInfoPhone $ProfileUserInfoPhoneFromJson(Map<String, dynamic> json) {
	final ProfileUserInfoPhone profileUserInfoPhone = ProfileUserInfoPhone();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		profileUserInfoPhone.name = name;
	}
	final int? order = jsonConvert.convert<int>(json['order']);
	if (order != null) {
		profileUserInfoPhone.order = order;
	}
	final String? value = jsonConvert.convert<String>(json['value']);
	if (value != null) {
		profileUserInfoPhone.value = value;
	}
	return profileUserInfoPhone;
}

Map<String, dynamic> $ProfileUserInfoPhoneToJson(ProfileUserInfoPhone entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['order'] = entity.order;
	data['value'] = entity.value;
	return data;
}

ProfileUserInfoSurname $ProfileUserInfoSurnameFromJson(Map<String, dynamic> json) {
	final ProfileUserInfoSurname profileUserInfoSurname = ProfileUserInfoSurname();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		profileUserInfoSurname.name = name;
	}
	final int? order = jsonConvert.convert<int>(json['order']);
	if (order != null) {
		profileUserInfoSurname.order = order;
	}
	final String? value = jsonConvert.convert<String>(json['value']);
	if (value != null) {
		profileUserInfoSurname.value = value;
	}
	return profileUserInfoSurname;
}

Map<String, dynamic> $ProfileUserInfoSurnameToJson(ProfileUserInfoSurname entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['order'] = entity.order;
	data['value'] = entity.value;
	return data;
}

ProfileUserInfoUsername $ProfileUserInfoUsernameFromJson(Map<String, dynamic> json) {
	final ProfileUserInfoUsername profileUserInfoUsername = ProfileUserInfoUsername();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		profileUserInfoUsername.name = name;
	}
	final int? order = jsonConvert.convert<int>(json['order']);
	if (order != null) {
		profileUserInfoUsername.order = order;
	}
	final String? value = jsonConvert.convert<String>(json['value']);
	if (value != null) {
		profileUserInfoUsername.value = value;
	}
	return profileUserInfoUsername;
}

Map<String, dynamic> $ProfileUserInfoUsernameToJson(ProfileUserInfoUsername entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['order'] = entity.order;
	data['value'] = entity.value;
	return data;
}

ProfileUserLinks $ProfileUserLinksFromJson(Map<String, dynamic> json) {
	final ProfileUserLinks profileUserLinks = ProfileUserLinks();
	final String? iconClazz = jsonConvert.convert<String>(json['iconClazz']);
	if (iconClazz != null) {
		profileUserLinks.iconClazz = iconClazz;
	}
	final String? link = jsonConvert.convert<String>(json['link']);
	if (link != null) {
		profileUserLinks.link = link;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		profileUserLinks.title = title;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		profileUserLinks.type = type;
	}
	return profileUserLinks;
}

Map<String, dynamic> $ProfileUserLinksToJson(ProfileUserLinks entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['iconClazz'] = entity.iconClazz;
	data['link'] = entity.link;
	data['title'] = entity.title;
	data['type'] = entity.type;
	return data;
}