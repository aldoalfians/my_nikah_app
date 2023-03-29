import 'package:flutter/material.dart';
import 'package:my_nikah_booking/utils/extension/extension.dart';

class AppElevatedButton extends StatelessWidget {
  final ElevatedButtonType? type;
  final bool large;
  final Widget? child;
  final VoidCallback? onPressed;

  const AppElevatedButton({
    Key? key,
    this.type = ElevatedButtonType.primary,
    this.child,
    this.onPressed,
    this.large = false,
  }) : super(key: key);

  Widget _buildButton(BuildContext context) {
    const largeTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    final style = type == ElevatedButtonType.secondary
        ? ElevatedButton.styleFrom(
            onPrimary: context.cardColor,
            primary: context.secondaryColor,
            textStyle: large ? largeTextStyle : null,
          )
        : ElevatedButton.styleFrom(
            onPrimary: context.cardColor,
            primary: context.primaryColor,
            textStyle: large ? largeTextStyle : null,
          );

    return ElevatedButton(
      style: style,
      child: child,
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (large == true) {
      return SizedBox(
        height: 46,
        width: double.infinity,
        child: _buildButton(context),
      );
    }

    return _buildButton(context);
  }
}

enum ElevatedButtonType { primary, secondary }
