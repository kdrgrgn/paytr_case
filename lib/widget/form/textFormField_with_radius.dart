import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paytr_case/app_constant/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  final String? initialValue;
  final double? height;
  final double? width;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool? obscureText;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final void Function(String? value)? onChanged;
  final void Function()? onTap;
  final Color? color;
  final bool isShadow;
  final double borderWidth;
  final Widget? icon;
  final Widget? suffixIcon;
  final TextStyle? texStyle;
  final int? minLines;
  final int? maxLines;
  final TextAlign textAlign;
  final int? maxLength;
  final FocusNode? focusNode;
  final bool autofocus;
  final double radius;

  const AppTextFormField({
    this.initialValue,
    this.height,
    this.width,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.inputFormatters,
    this.keyboardType,
    this.controller,
    this.obscureText,
    this.onSaved,
    this.onTap,
    this.validator,
    this.onChanged,
    this.color,
    this.isShadow = true,
    this.borderWidth = 0.2,
    this.suffixIcon,
    this.icon,
    this.texStyle,
    this.minLines,
    this.maxLines,
    this.textAlign = TextAlign.start,
    this.maxLength,
    this.focusNode,
    this.autofocus=false,
    this.radius=20,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: isShadow ? 5.0 : 0,
      shadowColor: isShadow ? Colors.grey.withOpacity(0.2) : null,
      borderRadius: BorderRadius.circular(radius),
      color: color ?? Colors.white,
      child: SizedBox(
        height: height,
        width: width,
        child: TextFormField(
          onTap:onTap ,
          autofocus: autofocus,
          textAlign: textAlign,
          focusNode: focusNode,
          initialValue: initialValue,
          maxLength: maxLength,
          validator: validator,
          minLines: minLines??1,
          maxLines: maxLines??1,
          onSaved: onSaved,
          onChanged: onChanged,
          obscureText: obscureText ?? false,
          controller: controller,
          cursorColor: appDarkColor,
          style: texStyle,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            fillColor: Colors.green,
            hintText: hintText,
            hintStyle: hintStyle,
            contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 5),
            prefixIcon: prefixIcon,
            icon: icon,
            suffixIcon: suffixIcon,
            counterText: "",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(
                width: borderWidth,
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(
                width: borderWidth,
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(
                width: borderWidth,
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
