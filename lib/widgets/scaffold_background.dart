import 'package:flutter/material.dart';
import 'package:my_nikah_booking/utils/constant.dart';
import 'package:my_nikah_booking/utils/extension/extension.dart';

class ScaffoldBackground extends StatelessWidget {
  final Scaffold child;

  const ScaffoldBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            context.secondaryColor.lighten(0.35),
            context.backgroundColor,
            context.backgroundColor,
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -43,
            left: -23,
            child: CustomPaint(
              size: const Size(180, 156),
              foregroundPainter: _CircleBlurPainter(
                blurRadius: 80,
                color: context.primaryColor.withOpacity(0.8),
                offset: 0,
              ),
            ),
          ),
          Positioned(
            top: -43,
            left: 109,
            child: CustomPaint(
              size: const Size(200, 98),
              foregroundPainter: _CircleBlurPainter(
                blurRadius: 80,
                color: context.secondaryColor,
                offset: 0,
              ),
            ),
          ),
          Theme(
            data: context.theme.copyWith(
              scaffoldBackgroundColor: Colors.transparent,
              appBarTheme: AppBarTheme(
                color: Colors.transparent,
                elevation: 0,
                titleTextStyle: TextStyle(
                  fontFamily: FontFamily.maisonNeue,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: context.textSecondaryColor,
                ),
                actionsIconTheme: IconThemeData(
                  color: context.textSecondaryColor,
                ),
              ),
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}

class _CircleBlurPainter extends CustomPainter {
  final double blurRadius;
  final Color color;
  final double offset;

  const _CircleBlurPainter({
    required this.blurRadius,
    required this.color,
    this.offset = 0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurRadius);

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2 - offset,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
