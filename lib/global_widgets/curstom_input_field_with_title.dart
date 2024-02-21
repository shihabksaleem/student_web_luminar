import 'package:flutter/material.dart';
import 'package:lumainar/core/constants/colors.dart';

class CustomInputFieldWithTitle extends StatelessWidget {
  final String title;
  final String? hintText;
  final bool IsEditable;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Key? formKey;
  final Widget? suffix;
  final bool readOnly;
  final bool obscureText;

  const CustomInputFieldWithTitle(
      {Key? key,
      required this.title,
      this.hintText,
      required this.IsEditable,
      this.validator,
      this.formKey,
      this.suffix,
      this.readOnly = false,
      this.controller,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: title,
                ),
                TextSpan(
                  text: (IsEditable == true) ? ' *' : ' ',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 255, 54, 13),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          IgnorePointer(
            ignoring: !IsEditable,
            child: Form(
              key: formKey,
              child: TextFormField(
                cursorColor: ColorConstant.primary1,
                controller: controller,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                obscureText: obscureText,
                readOnly: readOnly,
                decoration: InputDecoration(
                  hintText: hintText,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  enabledBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  focusedBorder:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.red)),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  suffixIcon: suffix,
                  border: InputBorder.none,
                ),
                validator: validator,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
