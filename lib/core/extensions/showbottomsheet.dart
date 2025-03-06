import 'package:flutter/material.dart';
import 'package:taskati/core/theme/color_app.dart';

extension ShowBottomSheet on BuildContext {
  bottomSheet({
    required double height,
    required Widget widget,
    required Color color,
  }) {
    return showBottomSheet(
      context: this,
      builder:
          (context) => Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: ColorApp.grey,
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              color: color,
            ),
            height: height,
            child: widget,
          ),
    );
  }
}
