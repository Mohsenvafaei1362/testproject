import 'package:flutter/material.dart';
import 'package:testproject/core/extentions/extention.dart';
import 'package:testproject/core/utils/colors.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.labelText,
    this.hintText,
    this.width,
    this.height,
    this.onChanged,
  });
  final double? width;
  final double? height;
  final String? hintText;
  final String? labelText;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.screenwidth * 0.8,
      height: height ?? 50,
      child: TextField(
        style: TextStyle(
          color: Color(0xFFD0DDD0),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        onChanged: onChanged,
        decoration: InputDecoration(
          fillColor: Colors.white.withAlpha(600),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: WHITE_COLOR.withAlpha(600)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: UNITED_NATIONS_BLUE_COLOR.withAlpha(700),
              width: 2,
            ),
          ),
          labelText: labelText ?? 'Username',
          labelStyle: TextStyle(
            color: Colors.white.withAlpha(700),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
