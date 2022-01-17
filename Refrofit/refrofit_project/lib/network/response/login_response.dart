import 'package:json_annotation/json_annotation.dart';
import 'package:refrofit_project/network/entity/user_entity.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'Status')
  final int statusCode;

  @JsonKey(name: 'Message')
  final String message;

  @JsonKey(name: 'Content')
  final UserEntity userEntity;

  LoginResponse(this.statusCode, this.message, this.userEntity);
}
