part of 'sign_up_cubit.dart';

@freezed
class SignupState<T> with _$SignupState<T> {
  const factory SignupState.signupInitial() = _SignupInitial;
  const factory SignupState.signupLoading() = SignupLoading;
  const factory SignupState.signupSuccess(T data) = SignupSuccess;
  const factory SignupState.signupError({required String error}) = SignupError;
}
