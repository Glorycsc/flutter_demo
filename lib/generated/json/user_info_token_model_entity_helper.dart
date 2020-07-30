import 'package:flutterintexspa/beans/user_info_token_model_entity.dart';

userInfoTokenModelEntityFromJson(UserInfoTokenModelEntity data, Map<String, dynamic> json) {
	if (json['userId'] != null) {
		data.userId = json['userId']?.toString();
	}
	if (json['userName'] != null) {
		data.userName = json['userName']?.toString();
	}
	if (json['emailAddress'] != null) {
		data.emailAddress = json['emailAddress']?.toString();
	}
	if (json['phoneNumber'] != null) {
		data.phoneNumber = json['phoneNumber']?.toString();
	}
	if (json['token'] != null) {
		data.token = json['token']?.toString();
	}
	if (json['refreshToken'] != null) {
		data.refreshToken = json['refreshToken']?.toString();
	}
	return data;
}

Map<String, dynamic> userInfoTokenModelEntityToJson(UserInfoTokenModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['userId'] = entity.userId;
	data['userName'] = entity.userName;
	data['emailAddress'] = entity.emailAddress;
	data['phoneNumber'] = entity.phoneNumber;
	data['token'] = entity.token;
	data['refreshToken'] = entity.refreshToken;
	return data;
}