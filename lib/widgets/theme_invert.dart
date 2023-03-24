import 'package:flutter/material.dart';
import 'package:my_nikah_booking/utils/extension/extension.dart';

class ThemeInvert extends StatelessWidget {
  final Widget child;

  const ThemeInvert({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.theme.copyWith(
        textTheme: context.theme.textTheme.apply(
          bodyColor: context.cardColor,
        ),
        iconTheme: context.theme.iconTheme.copyWith(
          color: context.cardColor,
        ),
      ),
      child: child,
    );
  }
}
