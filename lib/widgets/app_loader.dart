import 'dart:math' as math;
import 'package:flutter/material.dart';

class AppLoader extends StatefulWidget {
  final double size;
  final Color? color;

  const AppLoader({
    super.key,
    this.size = 50.0,
    this.color,
  });

  @override
  State<AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loaderColor = widget.color ?? Theme.of(context).colorScheme.primary;

    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SizedBox(
            width: widget.size,
            height: widget.size,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Outer ring
                Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: CustomPaint(
                    size: Size(widget.size, widget.size),
                    painter: _SpinnerPainter(
                      color: loaderColor.withValues(alpha: 0.3),
                      trackColor: loaderColor,
                      strokeWidth: widget.size / 10,
                    ),
                  ),
                ),
                // Inner pulsing circle
                Container(
                  width: widget.size * 0.4 * (0.8 + 0.2 * math.sin(_controller.value * 2 * math.pi)),
                  height: widget.size * 0.4 * (0.8 + 0.2 * math.sin(_controller.value * 2 * math.pi)),
                  decoration: BoxDecoration(
                    color: loaderColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _SpinnerPainter extends CustomPainter {
  final Color color;
  final Color trackColor;
  final double strokeWidth;

  _SpinnerPainter({
    required this.color,
    required this.trackColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final paint = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw background partial track
    paint.color = color;
    canvas.drawArc(
      rect,
      0,
      2 * math.pi,
      false,
      paint,
    );

    // Draw active spinner section
    paint.color = trackColor;
    canvas.drawArc(
      rect,
      -math.pi / 2,
      math.pi / 1.5,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _SpinnerPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.trackColor != trackColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
