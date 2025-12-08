import 'package:animal_app/core/networking/api_constants.dart';
import 'package:animal_app/features/signup/data/models/signup_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @MultiPart()
  @POST(ApiConstants.signupEndpoint)
  Future<SignupResponse> signup(
      @Part(name: "firstName") String firstName,
      @Part(name: "lastName") String lastName,
      @Part(name: "email") String email,
      @Part(name: "phone") String phone,
      @Part(name: "password") String password,
      @Part(name: "image") MultipartFile image,
      );
}
