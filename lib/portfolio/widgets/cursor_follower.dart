import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GradientCursorFollower extends StatefulWidget {
  final Widget content;

  const GradientCursorFollower({super.key, required this.content});

  @override
  State<GradientCursorFollower> createState() => _GradientCursorFollowerState();
}

class _GradientCursorFollowerState extends State<GradientCursorFollower> {
  Offset _cursorPosition = Offset.zero;
  bool _isHovering = false;
  late final platform = defaultTargetPlatform;
  late final isMobileOS =
      platform == TargetPlatform.android || platform == TargetPlatform.iOS;

  void _updateCursor(PointerEvent event) {
    setState(() {
      _cursorPosition = event.localPosition;
      _isHovering = true;
    });
  }

  void _onExit(PointerEvent event) {
    setState(() {
      _isHovering = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: isMobileOS ? null : _updateCursor,
      onExit: isMobileOS ? null : _onExit,
      child: Stack(
        children: [
          if (_isHovering)
            Positioned(
              child: IgnorePointer(
                child: CustomPaint(
                  painter: GradientPainter(center: _cursorPosition, radius: 55),
                ),
              ),
            ),

          // ----------------------------------------------------
          // 2. THE CONTENT LAYER (Drawn second, so it's on top)
          // ----------------------------------------------------
          widget.content,
        ],
      ),
    );
  }
}

class GradientPainter extends CustomPainter {
  final Offset center;
  final double radius;

  GradientPainter({required this.center, required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();

    // Define the Radial Gradient
    final RadialGradient gradient = RadialGradient(
      center: Alignment.center,
      radius: 0.5, // Gradient spread
      colors: [
        const Color.fromARGB(255, 28, 98, 156).withAlpha((255 * 0.35).floor()),
        const Color.fromARGB(255, 28, 98, 156).withAlpha((255 * 0).floor()),
      ],
      stops: const [0.0, 1.0],
    );

    // Create a Rect that defines the gradient area relative to the center
    final Rect rect = Rect.fromCircle(center: center, radius: radius);

    // Apply the gradient shader to the paint object
    paint.shader = gradient.createShader(rect);

    // Draw a circle using the paint shader
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(GradientPainter oldDelegate) {
    // Only repaint when the center position changes
    return oldDelegate.center != center;
  }
}
