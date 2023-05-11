import 'package:gennis_innovative_school/generated/json/base/json_field.dart';
import 'package:gennis_innovative_school/generated/json/response_logged_in_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ResponseLoggedInEntity {
	 ResponseLoggedInData? data;
	late bool success;

	ResponseLoggedInEntity();

	factory ResponseLoggedInEntity.fromJson(Map<String, dynamic> json) => $ResponseLoggedInEntityFromJson(json);

	Map<String, dynamic> toJson() => $ResponseLoggedInEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ResponseLoggedInData {
	@JSONField(name: "access_token")
	late String accessToken;
	late int id;
	@JSONField(name: "location_id")
	late int locationId;
	late String name;
	@JSONField(name: "refresh_token")
	late String refreshToken;
	late String role;
	late String surname;
	late String username;

	ResponseLoggedInData();

	factory ResponseLoggedInData.fromJson(Map<String, dynamic> json) => $ResponseLoggedInDataFromJson(json);

	Map<String, dynamic> toJson() => $ResponseLoggedInDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}