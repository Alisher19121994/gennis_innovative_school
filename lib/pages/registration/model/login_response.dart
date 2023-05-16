class LoginResponse {
  Data? data;
  bool? success;

  LoginResponse({this.data, this.success});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class Data {
  String? accessToken;
  int? id;
  int? locationId;
  String? name;
  String? refreshToken;
  String? role;
  String? surname;
  String? username;

  Data(
      {this.accessToken,
        this.id,
        this.locationId,
        this.name,
        this.refreshToken,
        this.role,
        this.surname,
        this.username});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    id = json['id'];
    locationId = json['location_id'];
    name = json['name'];
    refreshToken = json['refresh_token'];
    role = json['role'];
    surname = json['surname'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['id'] = this.id;
    data['location_id'] = this.locationId;
    data['name'] = this.name;
    data['refresh_token'] = this.refreshToken;
    data['role'] = this.role;
    data['surname'] = this.surname;
    data['username'] = this.username;
    return data;
  }
}
