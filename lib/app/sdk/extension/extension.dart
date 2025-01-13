import 'package:flutter/cupertino.dart';

extension PaddAll on Widget {
  Widget addHorizantalPadding(double padding) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: padding), child: this);

  Widget addVerticalPadding(double padding) =>
      Padding(padding: EdgeInsets.symmetric(vertical: padding), child: this);
  Widget addAllPad(double padding) {
    return Padding(padding: EdgeInsets.all(padding), child: this);
  }
}
