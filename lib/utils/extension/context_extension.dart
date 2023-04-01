import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  Color get primaryColor => theme.colorScheme.primary;
  Color get secondaryColor => theme.colorScheme.secondary;
  Color get errorColor => theme.colorScheme.error;
  Color get backgroundColor => theme.colorScheme.background;
  Color get cardColor => theme.cardColor;
  Color get textColor => theme.textTheme.bodyLarge!.color!;
  Color? get textSecondaryColor => theme.textTheme.bodyMedium!.color;

  NavigatorState nav() => Navigator.of(this);
  NavigatorState rootNav() => Navigator.of(this, rootNavigator: true);
}
