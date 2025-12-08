
import 'package:json_annotation/json_annotation.dart';
part 'signup_request_body.g.dart';
@JsonSerializable()
class SignupRequestBody {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;
  
  SignupRequestBody({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,

  });

Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
