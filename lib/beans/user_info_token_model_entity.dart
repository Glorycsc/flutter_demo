import 'package:flutterintexspa/generated/json/base/json_convert_content.dart';

class UserInfoTokenModelEntity with JsonConvert<UserInfoTokenModelEntity> {
	String userId;
	String userName;
	String emailAddress;
	String phoneNumber;
	String token;
	String refreshToken;
}
