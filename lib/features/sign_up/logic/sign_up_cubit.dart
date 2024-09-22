import 'package:doctor_appointment/features/sign_up/data/models/sign_up_response.dart';
import 'package:doctor_appointment/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/sign_up_request_body.dart';

part 'sign_up_state.dart';

part 'sign_up_cubit.freezed.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupRepo _signUpRepo;

  SignupCubit(this._signUpRepo) : super(const SignupState.signupInitial());
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  void emitSignUpStates() async {
    emit(const SignupState.signupLoading());
    final response = await _signUpRepo.signup(
      SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        gender: 1,
      ),
    );

    response.when(
      success: (signupResponse) {
        emit(SignupState.signupSuccess(signupResponse));
      },
      failure: (error) {
        emit(
          SignupState.signupError(error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}
