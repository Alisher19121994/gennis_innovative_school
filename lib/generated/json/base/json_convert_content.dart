// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/material.dart' show debugPrint;
import 'package:gennis_innovative_school/pages/entrancePage/model/main_entrance_group_entity.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users_list_entity.dart';

JsonConvert jsonConvert = JsonConvert();
typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);
typedef EnumConvertFunction<T> = T Function(String value);

class JsonConvert {
	static final Map<String, JsonConvertFunction> convertFuncMap = {
		(MainEntranceGroupEntity).toString(): MainEntranceGroupEntity.fromJson,
		(MainEntranceGroupGroups).toString(): MainEntranceGroupGroups.fromJson,
		(UsersListEntity).toString(): UsersListEntity.fromJson,
		(UsersListData).toString(): UsersListData.fromJson,
		(UsersListDataInformation).toString(): UsersListDataInformation.fromJson,
		(UsersListDataInformationEduLang).toString(): UsersListDataInformationEduLang.fromJson,
		(UsersListDataInformationGroupCourseType).toString(): UsersListDataInformationGroupCourseType.fromJson,
		(UsersListDataInformationGroupName).toString(): UsersListDataInformationGroupName.fromJson,
		(UsersListDataInformationGroupPrice).toString(): UsersListDataInformationGroupPrice.fromJson,
		(UsersListDataInformationStudentsLength).toString(): UsersListDataInformationStudentsLength.fromJson,
		(UsersListDataInformationTeacherName).toString(): UsersListDataInformationTeacherName.fromJson,
		(UsersListDataInformationTeacherSalary).toString(): UsersListDataInformationTeacherSalary.fromJson,
		(UsersListDataInformationTeacherSurname).toString(): UsersListDataInformationTeacherSurname.fromJson,
		(UsersListDataStudents).toString(): UsersListDataStudents.fromJson,
		(UsersListLinks).toString(): UsersListLinks.fromJson,
		(UsersListTimeTable).toString(): UsersListTimeTable.fromJson,

	};

  T? convert<T>(dynamic value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    if (value is T) {
      return value;
    }
    try {
      return _asT<T>(value, enumConvert: enumConvert);
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return null;
    }
  }

  List<T?>? convertList<T>(List<dynamic>? value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => _asT<T>(e,enumConvert: enumConvert)).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

List<T>? convertListNotNull<T>(dynamic value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) => _asT<T>(e,enumConvert: enumConvert)!).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  T? _asT<T extends Object?>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    final String type = T.toString();
    final String valueS = value.toString();
    if (enumConvert != null) {
      return enumConvert(valueS) as T;
    } else if (type == "String") {
      return valueS as T;
    } else if (type == "int") {
      final int? intValue = int.tryParse(valueS);
      if (intValue == null) {
        return double.tryParse(valueS)?.toInt() as T?;
      } else {
        return intValue as T;
      }
    } else if (type == "double") {
      return double.parse(valueS) as T;
    } else if (type == "DateTime") {
      return DateTime.parse(valueS) as T;
    } else if (type == "bool") {
      if (valueS == '0' || valueS == '1') {
        return (valueS == '1') as T;
      }
      return (valueS == 'true') as T;
    } else if (type == "Map" || type.startsWith("Map<")) {
      return value as T;
    } else {
      if (convertFuncMap.containsKey(type)) {
        return convertFuncMap[type]!(Map<String, dynamic>.from(value)) as T;
      } else {
        throw UnimplementedError('$type unimplemented');
      }
    }
  }

	//list is returned by type
	static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
		if(<MainEntranceGroupEntity>[] is M){
			return data.map<MainEntranceGroupEntity>((Map<String, dynamic> e) => MainEntranceGroupEntity.fromJson(e)).toList() as M;
		}
		if(<MainEntranceGroupGroups>[] is M){
			return data.map<MainEntranceGroupGroups>((Map<String, dynamic> e) => MainEntranceGroupGroups.fromJson(e)).toList() as M;
		}
		if(<UsersListEntity>[] is M){
			return data.map<UsersListEntity>((Map<String, dynamic> e) => UsersListEntity.fromJson(e)).toList() as M;
		}
		if(<UsersListData>[] is M){
			return data.map<UsersListData>((Map<String, dynamic> e) => UsersListData.fromJson(e)).toList() as M;
		}
		if(<UsersListDataInformation>[] is M){
			return data.map<UsersListDataInformation>((Map<String, dynamic> e) => UsersListDataInformation.fromJson(e)).toList() as M;
		}
		if(<UsersListDataInformationEduLang>[] is M){
			return data.map<UsersListDataInformationEduLang>((Map<String, dynamic> e) => UsersListDataInformationEduLang.fromJson(e)).toList() as M;
		}
		if(<UsersListDataInformationGroupCourseType>[] is M){
			return data.map<UsersListDataInformationGroupCourseType>((Map<String, dynamic> e) => UsersListDataInformationGroupCourseType.fromJson(e)).toList() as M;
		}
		if(<UsersListDataInformationGroupName>[] is M){
			return data.map<UsersListDataInformationGroupName>((Map<String, dynamic> e) => UsersListDataInformationGroupName.fromJson(e)).toList() as M;
		}
		if(<UsersListDataInformationGroupPrice>[] is M){
			return data.map<UsersListDataInformationGroupPrice>((Map<String, dynamic> e) => UsersListDataInformationGroupPrice.fromJson(e)).toList() as M;
		}
		if(<UsersListDataInformationStudentsLength>[] is M){
			return data.map<UsersListDataInformationStudentsLength>((Map<String, dynamic> e) => UsersListDataInformationStudentsLength.fromJson(e)).toList() as M;
		}
		if(<UsersListDataInformationTeacherName>[] is M){
			return data.map<UsersListDataInformationTeacherName>((Map<String, dynamic> e) => UsersListDataInformationTeacherName.fromJson(e)).toList() as M;
		}
		if(<UsersListDataInformationTeacherSalary>[] is M){
			return data.map<UsersListDataInformationTeacherSalary>((Map<String, dynamic> e) => UsersListDataInformationTeacherSalary.fromJson(e)).toList() as M;
		}
		if(<UsersListDataInformationTeacherSurname>[] is M){
			return data.map<UsersListDataInformationTeacherSurname>((Map<String, dynamic> e) => UsersListDataInformationTeacherSurname.fromJson(e)).toList() as M;
		}
		if(<UsersListDataStudents>[] is M){
			return data.map<UsersListDataStudents>((Map<String, dynamic> e) => UsersListDataStudents.fromJson(e)).toList() as M;
		}
		if(<UsersListLinks>[] is M){
			return data.map<UsersListLinks>((Map<String, dynamic> e) => UsersListLinks.fromJson(e)).toList() as M;
		}
		if(<UsersListTimeTable>[] is M){
			return data.map<UsersListTimeTable>((Map<String, dynamic> e) => UsersListTimeTable.fromJson(e)).toList() as M;
		}



		debugPrint("${M.toString()} not found");
	
		return null;
}

	static M? fromJsonAsT<M>(dynamic json) {
		if (json is List) {
			return _getListChildType<M>(json.map((e) => e as Map<String, dynamic>).toList());
		} else {
			return jsonConvert.convert<M>(json);
		}
	}
}