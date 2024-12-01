import 'package:flutter/material.dart';
import 'package:shopping_app/utils/config/constants/colors.dart';

class CommonTextFormField extends StatelessWidget {
  const CommonTextFormField(
      {super.key,
      this.textFormFieldController,
      this.labelName,
      this.prefixIcon,
      this.keyboardType,
      required this.emptyMessage,
      this.validationMessage,
      this.textFieldValidateExpression,
      this.focusNode,
      this.maxLength,
      this.onChangeEvent});

  final TextEditingController? textFormFieldController;
  final String? labelName;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final String emptyMessage;
  final String? validationMessage;
  final String? textFieldValidateExpression;
  final FocusNode? focusNode;
  final int? maxLength;
  final void Function(String)? onChangeEvent;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textFormFieldController,
      focusNode: focusNode,
      maxLength: maxLength,
      onChanged: (value) => onChangeEvent,
      decoration: InputDecoration(
        filled: true,
        labelText: labelName,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: AppColors.themeColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(),
        ),
        prefixIcon: Icon(prefixIcon),
      ),
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return emptyMessage;
        } else if ((validationMessage != null &&
                textFieldValidateExpression != null) &&
            !RegExp(textFieldValidateExpression!).hasMatch(value)) {
          return validationMessage;
        }
        return null;
      },
    );
  }
}
