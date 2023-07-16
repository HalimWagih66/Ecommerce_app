import 'package:ecommerce/features/sign_up/domain/entities/SignUpEntity.dart';

class SignUpModel extends SignUpEntity{
  SignUpModel({
      required this.message,required super.token,required super.user});

  SignUpModel.fromJson(dynamic json) :this(
    user: User.fromJson(json['user']),
    token: json['token'],
    message: json['message'],
  );
  String? message;
  /*
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }*/

}

class User extends UserEntity{
  User({
      super.email,
      super.name,
      required this.role});

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }

}