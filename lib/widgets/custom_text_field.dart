import 'package:flutter/material.dart';
import 'package:telechat/utils/colors.dart';

class CustomField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool? isSecured;
  final Widget? trailing;
  final void Function(String)? onChanged;

  const CustomField({
    super.key,
    required this.label,
    required this.hintText,
    this.isSecured,
    this.trailing,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: isSecured == true ? true : false,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(.15),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),
        labelText: label,
        hintText: hintText,
        suffixIcon: trailing,
      ),
    );
  }
}
