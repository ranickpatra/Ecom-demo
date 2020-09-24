import 'package:ecom_app/Login.dart';

class LoginStatus {
  bool status;
  int id;

  LoginStatus({this.status, this.id});

  factory LoginStatus.fromJson(Map<String, dynamic> json) {
    return LoginStatus(
      status: json['stat'] as bool,
      id: json['id'] as int
    );
  }
}