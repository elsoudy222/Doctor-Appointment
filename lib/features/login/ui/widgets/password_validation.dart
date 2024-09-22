import 'package:doctor_appointment/core/helper/spacing.dart';
import 'package:doctor_appointment/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class PasswordValidation extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacter;
  final bool hasNumber;
  final bool hasMinLength;

  const PasswordValidation({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacter,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow("At least 1 Lowercase Character", hasLowerCase),
        verticalSpace(2),
        buildValidationRow("At least 1 Uppercase Character", hasUpperCase),
        verticalSpace(2),
        buildValidationRow("At least 1 Special Character", hasSpecialCharacter),
        verticalSpace(2),
        buildValidationRow("At least 1 Number", hasNumber),
        verticalSpace(2),
        buildValidationRow("At least 8 Characters long", hasMinLength),
        verticalSpace(2),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 5,
          backgroundColor: ColorManager.lightGray,
        ),
        horizontalSpace(6),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? ColorManager.gray : ColorManager.darkBlue,

          ),
        ),
      ],
    );
  }
}
