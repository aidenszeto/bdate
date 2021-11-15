import 'package:flutter/material.dart';

PreferredSizeWidget transparentAppBar({
  required BuildContext context,
  required List<Widget> actions,
  required Text title,
  required Widget leading,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: title,
    leading: leading,
    actions: actions,
  );
}
