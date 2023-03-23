import 'package:flutter/material.dart';

class MainTabRoute extends InheritedWidget {
  final String? value;
  final void Function(String, {Object? arguments}) pushNamed;

  const MainTabRoute({
    Key? key,
    required Widget child,
    required this.pushNamed,
    this.value,
  }) : super(key: key, child: child);

  static MainTabRoute? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MainTabRoute>();
  }

  @override
  bool updateShouldNotify(covariant MainTabRoute oldWidget) {
    return value != oldWidget.value;
  }
}
