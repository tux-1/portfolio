import 'package:flutter/material.dart';

class LiftEffect extends StatefulWidget {
  final Widget child;
  final double initialElevation;
  final double hoveredElevation;
  final double liftDistance; // How much it shifts up visually
  final Duration duration;
  final void Function()? onPressed;

  const LiftEffect({
    super.key,
    required this.child,
    this.onPressed,
    this.initialElevation = 2.0,
    this.hoveredElevation = 8.0,
    this.liftDistance = 4.0, // Shift up by 4 pixels
    this.duration = const Duration(milliseconds: 200),
  });

  @override
  State<LiftEffect> createState() => _LiftEffectState();
}

class _LiftEffectState extends State<LiftEffect> {
  bool _isHovered = false;

  void _onEnter(PointerEvent details) {
    setState(() {
      _isHovered = true;
    });
  }

  void _onExit(PointerEvent details) {
    setState(() {
      _isHovered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double elevation = _isHovered
        ? widget.hoveredElevation
        : widget.initialElevation;
    final double yOffset = _isHovered ? -widget.liftDistance : 0.0;

    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: AnimatedContainer(
        duration: widget.duration,
        // The Transform moves the element up/down smoothly
        transform: Matrix4.translationValues(0, yOffset, 0),
        // The Material widget provides the elevation/shadow
        child: MaterialButton(
          onPressed: widget.onPressed,
          highlightColor: Colors.transparent,
          padding: EdgeInsets.zero,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),

            side: BorderSide(
              color: Theme.of(
                context,
              ).colorScheme.primaryContainer.withAlpha((255 * 0.25).floor()),
            ),
          ),

          color: Theme.of(context).cardColor,
          child: widget.child,
        ),
      ),
    );
  }
}
