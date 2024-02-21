import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/constants/colors.dart';

class TextfieldRefactor extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final int? maxLines;
  final Key? formKey;
  final Widget? suffixIcon;
  final bool readOnly;
  final String? hintText;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  // final IconData fieldIcon;
  const TextfieldRefactor({
    super.key,
    this.controller,
    this.labelText,
    this.keyboardType,
    this.validator,
    this.maxLines = 1,
    this.formKey,
    this.suffixIcon,
    this.readOnly = false,
    this.hintText,
    this.obscureText = false,
    this.inputFormatters,
    // required this.fieldIcon
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        obscureText: obscureText,
        maxLines: maxLines,
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        readOnly: readOnly,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
            hintText: hintText,
            //  isDense: true,
            contentPadding: const EdgeInsets.all(15),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorConstant.primary1), borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorConstant.primary1)),
            labelText: labelText,
            labelStyle: TextStyle(color: ColorConstant.primary1),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: ColorConstant.primary1),
            ),
            //  focusedBorder: OutlineInputBorder()

            suffixIcon: suffixIcon),
      ),
    );
  }
}
