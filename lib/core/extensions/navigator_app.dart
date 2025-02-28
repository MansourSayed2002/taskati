import 'package:flutter/material.dart';

extension NavigatorApp on BuildContext {
  void push(Widget widget) =>
      Navigator.of(this).push(MaterialPageRoute(builder: (context) => widget));
  void pushReplacement(Widget widget) => Navigator.of(
    this,
  ).pushReplacement(MaterialPageRoute(builder: (context) => widget));

  void pushRemoveUntil(Widget widget) => Navigator.of(this).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => widget),
    (route) => false,
  );

  pop() => Navigator.of(this).pop();
}
