// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:keepyoga/constants.dart';

class CustomPopUpField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  void Function()? onTap;
  final bool? validate;
  CustomPopUpField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.onTap,
    this.validate,
  });

  @override
  State<CustomPopUpField> createState() => _CustomPopUpFieldState();
}

class _CustomPopUpFieldState extends State<CustomPopUpField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: kLightAccentColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kLightAccentColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kLightAccentColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kLightAccentColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kLightAccentColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kLightAccentColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        label: Text(widget.labelText),
        labelStyle: TextStyle(
          color: kDarkAccentColor,
        ),
        suffixIcon: Icon(
          Icons.keyboard_arrow_down,
          color: kDarkAccentColor,
        ),
      ),
      cursorColor: kDarkAccentColor,
      readOnly: true,
      onTap: widget.onTap,
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (widget.validate != null && widget.validate == true && value!.isEmpty) {
          return 'Please fill this field to continue';
        } else {
          return null;
        }
      },
    );
  }
}
