import 'package:flutter/material.dart';
import 'package:my_nikah_booking/utils/extension/extension.dart';

class AppOutlinedButton extends StatelessWidget {
  final OutlinedButtonType? type;
  final bool large;
  final dynamic? child;
  final VoidCallback? onPressed;

  const AppOutlinedButton({
    Key? key,
    this.type = OutlinedButtonType.primary,
    this.child,
    this.onPressed,
    this.large = false,
  }) : super(key: key);

  Widget _buildButton(BuildContext context) {
    const largeTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    final style = type == OutlinedButtonType.secondary
        ? OutlinedButton.styleFrom(
            side: BorderSide(
              color: context.secondaryColor,
              width: 1,
            ),
            primary: context.secondaryColor,
            textStyle: large ? largeTextStyle : null,
          )
        : OutlinedButton.styleFrom(
            side: BorderSide(
              color: context.primaryColor,
              width: 1,
            ),
            primary: context.primaryColor,
            textStyle: large ? largeTextStyle : null,
          );

    return OutlinedButton(
      style: style,
      child: child,
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (large == true) {
      return SizedBox(
        height: 56,
        width: double.infinity,
        child: _buildButton(context),
      );
    }

    return _buildButton(context);
  }
}

enum OutlinedButtonType { primary, secondary }
