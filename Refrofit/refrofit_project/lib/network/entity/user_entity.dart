import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UserEntity {
  @JsonKey(name: 'UserName')
  final String userName;

  @JsonKey(name: 'Id')
  final int id;

  @JsonKey(name: 'Email')
  final String email;

  @JsonKey(name: 'Phone')
  final String phone;

  @JsonKey(name: 'Name')
  final String name;

  @JsonKey(name: 'Photo')
  final String photo;

  UserEntity(
      this.userName, this.id, this.email, this.phone, this.name, this.photo);
}
