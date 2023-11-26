import 'package:flutter/material.dart';
import 'package:keepyoga/constants.dart';

class CustomNumberField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool? validate;
  const CustomNumberField({
    super.key,
    required this.controller,
    required this.labelText,
    this.validate,
  });

  @override
  State<CustomNumberField> createState() => _CustomNumberFieldState();
}

class _CustomNumberFieldState extends State<CustomNumberField> {
  int counter = 0;

  void increaseCounter() {
    setState(() {
      counter++;
      widget.controller.text = counter.toString();
    });
  }

  void decreaseCounter() {
    if (counter != 0) {
      setState(() {
        counter--;
        widget.controller.text = counter.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
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
        suffixIcon: Column(
          children: [
            GestureDetector(
              onTap: increaseCounter,
              child: Icon(
                Icons.keyboard_arrow_up,
                color: kDarkAccentColor,
              ),
            ),
            GestureDetector(
              onTap: decreaseCounter,
              child: Icon(
                Icons.keyboard_arrow_down,
                color: kDarkAccentColor,
              ),
            ),
          ],
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
      cursorColor: kDarkAccentColor,
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
