import 'package:flutter/material.dart';
import 'package:my_nikah_booking/utils/extension/context_extension.dart';

class ModalBottomSheetContainer extends StatelessWidget {
  final double? height;
  final Widget child;
  final EdgeInsets padding;

  const ModalBottomSheetContainer({
    Key? key,
    required this.child,
    this.height,
    this.padding = const EdgeInsets.all(16),
  }) : super(key: key);

  static final ShapeBorder modalShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                width: 68,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: padding,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
