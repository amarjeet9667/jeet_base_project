import 'package:flutter/material.dart';

import '../utils.dart';


class ReusableTextField extends StatelessWidget {
  const ReusableTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.validatorText = "This Field Is Required",
    this.minLines,
    this.useLabel = false,
    this.suffixText = "",
    this.suffixIcon,
    this.obscureText = false,
    this.height = 8,
    this.fontSize = 18,
    this.textColor = Colors.white,
    this.hintTextColor = Colors.white,
    this.inputType = TextInputType.text,
    this.readOnly = false,
    this.isUnderlineBorder = true,
    this.onChanged,
    this.prefixIcon,
  });

  final TextEditingController controller;
  final String hint;
  final String validatorText;
  final Widget? prefixIcon;
  final int? minLines;
  final TextInputType inputType;
  final double fontSize;
  final Color textColor;
  final Color hintTextColor;
  final bool useLabel;
  final Widget? suffixIcon;
  final double height;
  final bool obscureText;
  final String suffixText;
  final bool readOnly;
  final bool isUnderlineBorder;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      maxLines: minLines != null ? ((minLines ?? 0) * 2) : 1,
      minLines: minLines,
      readOnly: readOnly,
      obscureText: obscureText,
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
      ),
      decoration: InputDecoration(
        isDense: true,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: fontSize,
          color: hintTextColor,
          letterSpacing: .5,
        ),
        hintText: useLabel ? null : hint,
        label: useLabel
            ? Text(
                hint,
                style: TextStyle(
                  fontSize: fontSize,
                  color: hintTextColor,
                  fontWeight: FontWeight.w500,
                ),
              )
            : null,
        prefixIcon: prefixIcon,
        contentPadding: EdgeInsets.fromLTRB(8, height, 12, 12),
        suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: suffixText != ""
                ? Text(
                    suffixText,
                    style: const TextStyle(
                      color: Color(0xffEB1A15),
                      fontSize: 12,
                    ),
                  )
                : suffixIcon),
        suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 12),
        prefixIconConstraints:
            const BoxConstraints(minWidth: 50, minHeight: 12),
        border: isUnderlineBorder
            ? StylesUtils.textFieldUnderlineBorder
            : StylesUtils.textFieldOutsideBorder,
        enabledBorder: isUnderlineBorder
            ? StylesUtils.textFieldUnderlineBorder
            : StylesUtils.textFieldOutsideBorder,
        focusedBorder: isUnderlineBorder
            ? StylesUtils.textFieldUnderlineBorder
            : StylesUtils.textFieldOutsideBorder,
        errorBorder: isUnderlineBorder
            ? StylesUtils.textFieldUnderlineBorder
            : StylesUtils.textFieldOutsideBorder,
        focusedErrorBorder: isUnderlineBorder
            ? StylesUtils.textFieldUnderlineBorder
            : StylesUtils.textFieldOutsideBorder,
      ),
      onChanged: onChanged,
      validator: (val) {
        if (val!.isEmpty) return validatorText;
        return null;
      },
    );
  }
}
