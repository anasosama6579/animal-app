import 'dart:io';
import 'package:animal_app/assets/assets.dart';
import 'package:animal_app/core/networking/api_result.dart';
import 'package:animal_app/features/signup/data/models/signup_request_body.dart';
import 'package:animal_app/features/signup/data/repos/signup_repo.dart';
import 'package:animal_app/features/signup/logic/signup/signup_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;

  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmedPassword = TextEditingController();
  File? selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImageFromGallery() async {
    try {
      final image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        selectedImage = File(image.path);
      }
    } catch (e) {
      print('Error picking image from gallery: $e');
    }
  }

// Pick image from camera
  Future<void> pickImageFromCamera() async {
    try {
      final image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );

      if (image != null) {
        selectedImage = File(image.path);
      }
    } catch (e) {
      print('Error picking image from camera: $e');
    }
  }

  Future<void> emitSignupStates() async {
    emit(SignupState.loading());
    var data = await _signupRepo.signup(
        SignupRequestBody(
            firstName: firstName.text,
            lastName: lastName.text,
            email: email.text,
            phone: phone.text,
            password: password.text),
        selectedImage ?? File(Assets.pngLogo));
    data.when(
      success: (data) {
        emit(SignupState.success(data));
      },
      failure: (errorMassage) {
        emit(SignupState.failure(
            errorMassage.apiErrorModel.error.first ));
      },
    );
  }
}
