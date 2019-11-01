import 'dart:ui';
import 'package:flutter/material.dart';

// gradient colors
const reddish = Color.fromRGBO(171, 39, 133, 1); //pink like
const blushish = Color.fromRGBO(189, 78, 97, 1); //blush like
const TextStyle h1TextBlack = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

class CustomIcons {
  static const IconData twitter = IconData(0xe900, fontFamily: "CustomIcons");
  static const IconData facebook = IconData(0xe901, fontFamily: "CustomIcons");
  static const IconData googlePlus =
      IconData(0xe902, fontFamily: "CustomIcons");
  static const IconData linkedin = IconData(0xe903, fontFamily: "CustomIcons");
}
class SocialIcon extends StatelessWidget {
  final List<Color> colors;
  final IconData iconData;
  final Function onPressed;
  SocialIcon({this.colors, this.iconData, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.only(left: 14.0),
      child: Container(
        width: 75.0,
        height: 55.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: colors, tileMode: TileMode.clamp)),
        child: RawMaterialButton(
          shape: CircleBorder(),
          onPressed: onPressed,
          child: Icon(iconData, color: Colors.white),
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  PrimaryButton({this.key, this.text, this.height, this.onPressed}) : super(key: key);
  Key key;
  String text;
  double height;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new ConstrainedBox(
      constraints: BoxConstraints.expand(height: height),
      child: new RaisedButton(
          child: new Text(text, style: new TextStyle(color: Colors.white, fontSize: 20.0)),
          shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(height / 2))),
          color: Colors.blue,
          textColor: Colors.black87,
          onPressed: onPressed),
    );
  }
}