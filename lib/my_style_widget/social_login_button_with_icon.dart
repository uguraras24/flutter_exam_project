import 'package:flutter/material.dart';

class SocialLoginButtonWithIcon extends StatelessWidget {
  final String button_text;
  final Color button_color;
  final Color button_text_color;
  final double button_radius;
  final double button_height;
  final VoidCallback onPressed;
  final AssetImage imageicon;

  const SocialLoginButtonWithIcon(
      {Key key,
      @required this.button_text,
      this.button_color,
      this.button_text_color,
      this.button_radius,
      this.button_height,
      this.onPressed,
      this.imageicon})
      : assert(button_text!=null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width / 1.35,
      height: button_height,
      color: button_color,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: button_text_color,
            style: BorderStyle.solid,
            width: 1.0,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(button_radius),
        ),
        child: InkWell(
          onTap: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: ImageIcon(imageicon),
              ),
              SizedBox(
                width: 10.0,
              ),
              Center(
                child: Text(
                  button_text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
