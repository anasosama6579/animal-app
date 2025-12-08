
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@Freezed()
class SignupState<T> with _$SignupState<T> {
  const factory SignupState.initial() = _Initial;
  const factory SignupState.loading() = _Loading;
  const factory SignupState.success(T data) = _Success<T>;
  const factory SignupState.failure(String errorMassage) = _Failure<T>;
}

