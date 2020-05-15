import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String button_text;
  final Color button_color;
  final Color button_text_color;
  final double button_radius;
  final double button_height;
  final VoidCallback onPressed;

  const SocialLoginButton(
      {Key key,
      @required this.button_text,
      this.button_color,
      this.button_text_color,
      this.button_radius,
      this.button_height,
      this.onPressed})
      : assert(button_text!=null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width/1.35,
      height: button_height,
      child: Material(
        borderRadius: BorderRadius.circular(button_radius),
        shadowColor: Colors.redAccent,
        color: button_color,
        elevation: 7.0,
        child: GestureDetector(
          onTap: onPressed,
          child: Center(
            child: Text(
              button_text,
              style: TextStyle(
                color: button_text_color,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
