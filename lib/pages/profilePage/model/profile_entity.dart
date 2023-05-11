import 'package:gennis_innovative_school/generated/json/base/json_field.dart';
import 'package:gennis_innovative_school/generated/json/profile_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ProfileEntity {
	late ProfileUser user;

	ProfileEntity();

	factory ProfileEntity.fromJson(Map<String, dynamic> json) => $ProfileEntityFromJson(json);

	Map<String, dynamic> toJson() => $ProfileEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProfileUser {
	late ProfileUserActiveToChange activeToChange;
	late List<ProfileUserGroups> groups;
	late int id;
	late ProfileUserInfo info;
	late List<ProfileUserLinks> links;
	@JSONField(name: "location_id")
	late int locationId;
	@JSONField(name: "location_list")
	late List<int> locationList;
	@JSONField(name: "photo_profile")
	late String photoProfile;
	late String role;
	@JSONField(name: "type_role")
	late String typeRole;
	late String username;

	ProfileUser();

	factory ProfileUser.fromJson(Map<String, dynamic> json) => $ProfileUserFromJson(json);

	Map<String, dynamic> toJson() => $ProfileUserToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProfileUserActiveToChange {
	late bool age;
	late bool birth;
	late bool color;
	late bool comment;
	late bool fathersName;
	late bool language;
	late bool name;
	late bool phone;
	late bool surname;
	late bool username;

	ProfileUserActiveToChange();

	factory ProfileUserActiveToChange.fromJson(Map<String, dynamic> json) => $ProfileUserActiveToChangeFromJson(json);

	Map<String, dynamic> toJson() => $ProfileUserActiveToChangeToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProfileUserGroups {
	late int id;
	late String nameGroup;
	late String teacherImg;

	ProfileUserGroups();

	factory ProfileUserGroups.fromJson(Map<String, dynamic> json) => $ProfileUserGroupsFromJson(json);

	Map<String, dynamic> toJson() => $ProfileUserGroupsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProfileUserInfo {
	late ProfileUserInfoAge age;
	late ProfileUserInfoBirthDate birthDate;
	late ProfileUserInfoBirthDay birthDay;
	late ProfileUserInfoBirthMonth birthMonth;
	late ProfileUserInfoBirthYear birthYear;
	late ProfileUserInfoFathersName fathersName;
	late ProfileUserInfoName name;
	late ProfileUserInfoPhone phone;
	late ProfileUserInfoSurname surname;
	late ProfileUserInfoUsername username;

	ProfileUserInfo();

	factory ProfileUserInfo.fromJson(Map<String, dynamic> json) => $ProfileUserInfoFromJson(json);

	Map<String, dynamic> toJson() => $ProfileUserInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProfileUserInfoAge {
	late String name;
	late int order;
	late int value;

	ProfileUserInfoAge();

	factory ProfileUserInfoAge.fromJson(Map<String, dynamic> json) => $ProfileUserInfoAgeFromJson(json);

	Map<String, dynamic> toJson() => $ProfileUserInfoAgeToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProfileUserInfoBirthDate {
	late String name;
	late int order;
	late String value;

	ProfileUserInfoBirthDate();

	factory ProfileUserInfoBirthDate.fromJson(Map<String, dynamic> json) => $ProfileUserInfoBirthDateFromJson(json);

	Map<String, dynamic> toJson() => $ProfileUserInfoBirthDateToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProfileUserInfoBirthDay {
	late String display;
	late String name;
	late int value;

	ProfileUserInfoBirthDay();

	factory ProfileUserInfoBirthDay.fromJson(Map<String, dynamic> json) => $ProfileUserInfoBirthDayFromJson(json);

	Map<String, dynamic> toJson() => $ProfileUserInfoBirthDayToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProfileUserInfoBirthMonth {
	late String display;
	late String name;
	late int value;

	ProfileUserInfoBirthMonth();

	factory ProfileUserInfoBirthMonth.fromJson(Map<String, dynamic> json) => $ProfileUserInfoBirthMonthFromJson(json);

	Map<String, dynamic> toJson() => $ProfileUserInfoBirthMonthToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProfileUserInfoBirthYear {
	late String display;
	late String name;
	late int value;

	ProfileUserInfoBirthYear();

	factory ProfileUserInfoBirthYear.fromJson(Map<String, dynamic> json) => $ProfileUserInfoBirthYearFromJson(json);

	Map<String, dynamic> toJson() => $ProfileUserInfoBirthYearToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProfileUserInfoFathersName {
	late String name;
	late int order;
	late String value;

	ProfileUserInfoFathersName();

	factory ProfileUserInfoFathersName.fromJson(Map<String, dynamic> json) => $ProfileUserInfoFathersNameFromJson(json);

	Map<String, dynamic> toJson() => $ProfileUserInfoFathersNameToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProfileUserInfoName {
	late String name;
	late int order;
	late String value;

	ProfileUserInfoName();

	factory ProfileUserInfoName.fromJson(Map<String, dynamic> json) => $ProfileUserInfoNameFromJson(json);

	Map<String, dynamic> toJson() => $ProfileUserInfoNameToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProfileUserInfoPhone {
	late String name;
	late int order;
	late String value;

	ProfileUserInfoPhone();

	factory ProfileUserInfoPhone.fromJson(Map<String, dynamic> json) => $ProfileUserInfoPhoneFromJson(json);

	Map<String, dynamic> toJson() => $ProfileUserInfoPhoneToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProfileUserInfoSurname {
	late String name;
	late int order;
	late String value;

	ProfileUserInfoSurname();

	factory ProfileUserInfoSurname.fromJson(Map<String, dynamic> json) => $ProfileUserInfoSurnameFromJson(json);

	Map<String, dynamic> toJson() => $ProfileUserInfoSurnameToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProfileUserInfoUsername {
	late String name;
	late int order;
	late String value;

	ProfileUserInfoUsername();

	factory ProfileUserInfoUsername.fromJson(Map<String, dynamic> json) => $ProfileUserInfoUsernameFromJson(json);

	Map<String, dynamic> toJson() => $ProfileUserInfoUsernameToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProfileUserLinks {
	late String iconClazz;
	late String link;
	late String title;
	late String type;

	ProfileUserLinks();

	factory ProfileUserLinks.fromJson(Map<String, dynamic> json) => $ProfileUserLinksFromJson(json);

	Map<String, dynamic> toJson() => $ProfileUserLinksToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}