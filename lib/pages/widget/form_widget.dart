import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormWidget extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? inputType;
  final String? hintText;
  final String? errorText;
  final Function(String)? onChange;
  final String? Function(String?)? validate;
  final Widget? suffixIcon;
  final Widget? prefixWidget;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatter;
  final int? maxLength;
  final int? maxLine;
  final Widget? suffixWidget;
  final bool autoFocus;
  final TextAlign textAlign;
  final double fontSize;
  final FontWeight fontWeight;

  const FormWidget(
      {Key? key,
      this.controller,
      this.inputType,
      this.hintText,
      this.errorText,
      this.onChange,
      this.suffixIcon,
      this.prefixWidget,
      this.prefixIcon,
      this.validate,
      this.inputFormatter,
      this.maxLength,
      this.maxLine = 1,
      this.suffixWidget,
      this.textAlign = TextAlign.start,
      this.fontSize = 17,
      this.fontWeight = FontWeight.w500,
      this.autoFocus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      controller: controller,
      onChanged: onChange,
      validator: validate,
      inputFormatters: inputFormatter,
      maxLength: maxLength,
      maxLines: maxLine,
      autofocus: autoFocus,
      textAlign: textAlign,
      cursorColor: Colors.grey,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight, height: 1.5),
      decoration: InputDecoration(
          isDense: true,
          counterText: "",
          // labelText: labelText ?? "",
          hintText: hintText ?? "",
          // errorText: errorText ?? null,
          // errorMaxLines: 3,
          // fillColor: fillColor == null ? Color(AppColor.formColor) : fillColor,
          // filled: isFilled,
          filled: true,
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          hintStyle: TextStyle(fontWeight: FontWeight.w500),
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          constraints: BoxConstraints(maxHeight: 75),
          border: InputBorder.none,
          prefix: prefixWidget,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          suffix: suffixWidget),
    );
  }
}
