import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../theme/custom_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final FieldValidator validator;
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: CustomColors.PRIMARY,
      validator: validator,
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.2,
            color: CustomColors.PRIMARY,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.2,
            color: CustomColors.PRIMARY,
          ),
        ),
        hintText: hintText,
      ),
    );
  }
}
