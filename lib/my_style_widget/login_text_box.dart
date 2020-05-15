import 'package:flutter/material.dart';

class LoginTextBoX extends StatelessWidget {
  final String label_text;
  final Color text_color;
  final Color underline_text_color;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool obscureText;
  final Function onSaved;

  const LoginTextBoX({
    Key key,
    this.label_text,
    this.text_color,
    this.underline_text_color,
    this.inputType,
    this.inputAction,
    this.obscureText,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label_text,
        labelStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: text_color,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: underline_text_color),
        ),
      ),
      keyboardType: inputType,
      textInputAction: inputAction,
      obscureText: obscureText,
      onSaved: onSaved,
      // controller: mail,
    );
  }
}
