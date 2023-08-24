import 'package:cpssoft_crud/app/shared/constant_color.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? margin;
  final double? hintTextSize;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefixIcon;
  final Color? cursorColor;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextStyle? floatingLabelStyle;
  final TextStyle? labelStyle;
  final String? labelText;
  final InputBorder? focusedBorder;
  final bool? isDense;
  final bool? isBorderOutlined;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.controller,
    this.margin,
    this.hintTextSize,
    this.contentPadding,
    this.prefixIcon,
    this.cursorColor,
    this.floatingLabelBehavior,
    this.floatingLabelStyle,
    this.labelStyle,
    this.labelText,
    this.focusedBorder,
    this.isDense,
    this.isBorderOutlined,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextFormField(
        cursorColor: cursorColor,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          contentPadding: contentPadding,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 13,
            color: kBlackColor,
          ),
          border: isBorderOutlined == true
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                )
              : UnderlineInputBorder(
                  borderSide: BorderSide(color: kGreyColor),
                ),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: kGreyColor,
                ),
              ),
          floatingLabelBehavior: floatingLabelBehavior,
          floatingLabelStyle: floatingLabelStyle,
          labelText: labelText,
          labelStyle: labelStyle,
          isDense: isDense,
        ),
      ),
    );
  }
}
