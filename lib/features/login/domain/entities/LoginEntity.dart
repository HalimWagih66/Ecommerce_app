import 'package:equatable/equatable.dart';

import '../../../sign_up/domain/entities/SignUpEntity.dart';

class LoginEntity extends Equatable{
  LoginEntity({
      this.user, 
      this.token});

  UserEntity? user;
  String? token;

  @override
  // TODO: implement props
  List<Object?> get props => [user,token];


}