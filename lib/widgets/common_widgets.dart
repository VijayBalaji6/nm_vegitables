import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';

class CommonWidgets {
  static Padding commmonTextFormfield({
    TextEditingController? textController,
    required FocusNode textFocusNode,
    String? hintName,
    TextStyle? hintTextStyle,
    TextInputType? textInputType,
    bool? obscureText,
    int? maxLength,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String Function(String?)? validatorMessage,
    Function(String)? onTextFieldChange,
    Function(String)? onSubmit,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: textController,
        focusNode: textFocusNode,
        obscureText: obscureText ?? false,
        maxLines: 1,
        expands: false,
        maxLength: maxLength ?? 20,
        keyboardType: textInputType ?? TextInputType.text,
        validator: validatorMessage,
        onChanged: onTextFieldChange,
        onFieldSubmitted: onSubmit,
        onTapOutside: (event) => textFocusNode.unfocus(),
        decoration: InputDecoration(
          counterText: '',
          contentPadding: const EdgeInsets.all(16),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 0.5),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.errorColor, width: 1.0),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.errorColor, width: 1.0),
          ),
          hintText: hintName ?? '',
          hintStyle: hintTextStyle,
          filled: true,
        ),
      ),
    );
  }

  static Padding commonButton(
      {required String buttonText,
      required VoidCallback onTapFun,
      double? topPadding,
      double? bottomPadding,
      double? leftPadding,
      double? rightPadding}) {
    return Padding(
      padding: EdgeInsets.only(
          top: topPadding ?? 8,
          bottom: bottomPadding ?? 8,
          left: leftPadding ?? 8,
          right: rightPadding ?? 8),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: onTapFun,
          child: Text(buttonText),
        ),
      ),
    );
  }

  static InkWell commonTapableText(
      {required String text,
      required VoidCallback onTapFun,
      double? topPadding,
      double? bottomPadding,
      double? leftPadding,
      double? rightPadding}) {
    return InkWell(
      onTap: onTapFun,
      child: Padding(
          padding: EdgeInsets.only(
              top: topPadding ?? 8,
              bottom: bottomPadding ?? 8,
              left: leftPadding ?? 8,
              right: rightPadding ?? 8),
          child: Text(
            text,
          )),
    );
  }
}
