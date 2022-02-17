import 'package:flutter/material.dart';
import 'package:todobooks/color.dart';

class TextInputField extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final TextEditingController controller;
  final String? hintText;
  final ValueNotifier<bool> isError;
  final String? errorMassage;
  final bool obscureText;
  const TextInputField({
    Key? key,
    this.margin,
    this.padding,
    required this.controller,
    this.hintText,
    required this.isError,
    this.errorMassage,
    this.obscureText = false,
  }) : super(key: key);

  EdgeInsetsGeometry get _margin => margin ?? const EdgeInsets.only(bottom: 20);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _margin,
      padding: padding,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: (value) {
          if (isError.value) {
            return errorMassage;
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorMap().primary,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorMap().black.withOpacity(0.1),
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorMap().primary,
              width: 1,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: ColorMap().black.withOpacity(0.1),
          ),
        ),
      ),
    );
  }
}
