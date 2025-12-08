import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';
@JsonSerializable()
class SignupResponse {
  final int statusCode;
  final String message;
  final String alert;
  final User user;

  SignupResponse(
      {required this.statusCode,
      required this.message,
      required this.alert,
      required this.user});

  factory SignupResponse.fromJson(Map<String, dynamic> json) => _$SignupResponseFromJson(json);
}

@JsonSerializable()
class User {
  final int id;
  @JsonKey(name: "first_name")
  final String firstName;
  @JsonKey(name: "last_name")
  final String lastName;
  final String email;
  final String phone;
  @JsonKey(name: "image_path")
  final String imagePath;
  @JsonKey(name: "is_verified")
  final String isVerified;

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.imagePath,
      required this.isVerified});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
