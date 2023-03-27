import 'package:flutter/material.dart';
import 'package:my_nikah_booking/utils/extension/context_extension.dart';

class ImagePlaceholder extends StatelessWidget {
  final Widget child;
  final double iconSize;
  final IconData icon;

  const ImagePlaceholder({
    Key? key,
    required this.child,
    this.iconSize = 32,
    this.icon = Icons.image_outlined,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brokenImageBgColor = context.textColor.withOpacity(0.05);
    final brokenImageIconColor = context.textColor.withOpacity(0.2);
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: brokenImageBgColor,
            child: Center(
              child: Icon(
                icon,
                color: brokenImageIconColor,
                size: iconSize,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: child,
        ),
      ],
    );
  }
}
