
import 'dart:io';

import 'package:animal_app/core/networking/api_error_handler.dart';
import 'package:animal_app/core/networking/api_result.dart';
import 'package:animal_app/core/networking/api_services.dart';
import 'package:animal_app/features/signup/data/models/signup_request_body.dart';
import 'package:animal_app/features/signup/data/models/signup_response.dart';
import 'package:dio/dio.dart';

class SignupRepo {
  
  final ApiServices _apiServices;

  SignupRepo(this._apiServices);
  
  Future<ApiResult<SignupResponse>> signup(SignupRequestBody signupRequestBody, File image)async{
    try {
      final multiPartImage = await MultipartFile.fromFile(image.path);
      var response = await _apiServices.signup(signupRequestBody.firstName,
          signupRequestBody.lastName,
          signupRequestBody.email,
          signupRequestBody.phone,
          signupRequestBody.password, multiPartImage);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}