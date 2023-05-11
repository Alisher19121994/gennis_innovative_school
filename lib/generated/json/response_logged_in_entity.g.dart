import 'package:gennis_innovative_school/generated/json/base/json_convert_content.dart';
import 'package:gennis_innovative_school/pages/registration/model/response_logged_in_entity.dart';

ResponseLoggedInEntity $ResponseLoggedInEntityFromJson(Map<String, dynamic> json) {
	final ResponseLoggedInEntity responseLoggedInEntity = ResponseLoggedInEntity();
	final ResponseLoggedInData? data = jsonConvert.convert<ResponseLoggedInData>(json['data']);
	if (data != null) {
		responseLoggedInEntity.data = data;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		responseLoggedInEntity.success = success;
	}
	return responseLoggedInEntity;
}

Map<String, dynamic> $ResponseLoggedInEntityToJson(ResponseLoggedInEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data?.toJson();
	data['success'] = entity.success;
	return data;
}

ResponseLoggedInData $ResponseLoggedInDataFromJson(Map<String, dynamic> json) {
	final ResponseLoggedInData responseLoggedInData = ResponseLoggedInData();
	final String? accessToken = jsonConvert.convert<String>(json['access_token']);
	if (accessToken != null) {
		responseLoggedInData.accessToken = accessToken;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		responseLoggedInData.id = id;
	}
	final int? locationId = jsonConvert.convert<int>(json['location_id']);
	if (locationId != null) {
		responseLoggedInData.locationId = locationId;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		responseLoggedInData.name = name;
	}
	final String? refreshToken = jsonConvert.convert<String>(json['refresh_token']);
	if (refreshToken != null) {
		responseLoggedInData.refreshToken = refreshToken;
	}
	final String? role = jsonConvert.convert<String>(json['role']);
	if (role != null) {
		responseLoggedInData.role = role;
	}
	final String? surname = jsonConvert.convert<String>(json['surname']);
	if (surname != null) {
		responseLoggedInData.surname = surname;
	}
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		responseLoggedInData.username = username;
	}
	return responseLoggedInData;
}

Map<String, dynamic> $ResponseLoggedInDataToJson(ResponseLoggedInData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['access_token'] = entity.accessToken;
	data['id'] = entity.id;
	data['location_id'] = entity.locationId;
	data['name'] = entity.name;
	data['refresh_token'] = entity.refreshToken;
	data['role'] = entity.role;
	data['surname'] = entity.surname;
	data['username'] = entity.username;
	return data;
}